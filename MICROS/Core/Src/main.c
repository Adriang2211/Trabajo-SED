/* USER CODE BEGIN Header */
/**
  ******************************************************************************
  * @file           : main.c
  * @brief          : Main program body
  ******************************************************************************
  * @attention
  *
  * Copyright (c) 2022 STMicroelectronics.
  * All rights reserved.
  *
  * This software is licensed under terms that can be found in the LICENSE file
  * in the root directory of this software component.
  * If no LICENSE file comes with this software, it is provided AS-IS.
  *
  ******************************************************************************
  */
/* USER CODE END Header */
/* Includes ------------------------------------------------------------------*/
#include "main.h"

/* Private includes ----------------------------------------------------------*/
/* USER CODE BEGIN Includes */
#include <string.h>
#include <stdio.h>
/* USER CODE END Includes */

/* Private typedef -----------------------------------------------------------*/
/* USER CODE BEGIN PTD */

/* USER CODE END PTD */

/* Private define ------------------------------------------------------------*/
/* USER CODE BEGIN PD */
#define SLAVE_ADDRESS_LCD 0x4E //Dirección LCD
#define LINES 2 //Dimensiones LCD
#define ROWS 16 //Dimensiones LCD
#define NUM_MEDIDAS 10
#define T_DEBOUNCER 500 //Tiempo entre pulsaciones fijado en 0,5s
#define TIEMPO_DESDE_ULTIMA_VEZ 5000
/* USER CODE END PD */

/* Private macro -------------------------------------------------------------*/
/* USER CODE BEGIN PM */

/* USER CODE END PM */

/* Private variables ---------------------------------------------------------*/
ADC_HandleTypeDef hadc1;
DMA_HandleTypeDef hdma_adc1;

I2C_HandleTypeDef hi2c1;

TIM_HandleTypeDef htim1;
TIM_HandleTypeDef htim2;

/* USER CODE BEGIN PV */

/* USER CODE END PV */

/* Private function prototypes -----------------------------------------------*/
void SystemClock_Config(void);
static void MX_GPIO_Init(void);
static void MX_DMA_Init(void);
static void MX_ADC1_Init(void);
static void MX_TIM1_Init(void);
static void MX_I2C1_Init(void);
static void MX_TIM2_Init(void);
/* USER CODE BEGIN PFP */
void lcd_init();
void lcd_send_cmd(char cmd);
void lcd_update(char* str);
void lcd_send_data(char data);
void lcd_send_string(char *str);
void lcd_clear(void);
void strdel(char* cadena);
void info(void);
/* USER CODE END PFP */

/* Private user code ---------------------------------------------------------*/
/* USER CODE BEGIN 0 */
uint16_t ADC_value[2],ADC_buffer[2];//[0] para sensor nivel y [1] para sensor de tierra
volatile int flag_riego = 0;
volatile int flag_boton = 0;
volatile int flag_agua = 0; //Para cuando el deposito de agua esta vacio
volatile uint32_t media = 0;
volatile uint32_t ultimas_medidas [NUM_MEDIDAS] = {100, 100, 100, 100, 100, 100, 100, 100, 100, 100}; //Evita que se encienda al riego al encender
char texto_pantalla [LINES*ROWS];
int contador_linea=0;
volatile int ultima_pulsacion = 0;
volatile int ultima_vez = 0;
volatile int nint=0;
//Reloj
uint32_t second = 0;
uint32_t minute = 0;
uint32_t hour = 0;
uint32_t count_second;
uint32_t count_minute;
uint32_t count_hour;
//Para introducir la hora al conectar el sistema
int intro_minute = 0;
int intro_hour = 0;
//Para introducir la hora a la que regar cada dia
uint32_t water_minute = 0;
uint32_t water_hour = 100; //Asi si se espera sin pulsar esta hora nunca se da y nunca salta el riego programado
//Comprobaciones de ajustes iniciales
int OK_hour = 0;
int OK_minute = 0;
int counter;
int settings = 0;
char time_h [2]; //Mostrar hora en display
char time_m [2]; //Mostrar minutos en display

void HAL_ADC_ConvCpltCallback (ADC_HandleTypeDef * hadc){
	if (hadc->Instance == ADC1){
		ADC_value[0]=ADC_buffer[0]; // Nivel
		ADC_value[1]=ADC_buffer[1]; // Tierra
	}
}

int detec_lvl(uint16_t valor){ // nivel del deposito
	if ( valor >=4000)
		return 3;//50<x<100%
	else if (valor<4000 && valor>=3500)
		return 2;//<=25<x<50%
	else if(valor<3500 && valor>200)
		return 1;//<=25%
	else
		return 0;//0%
}

int humedad(int medida){ //porcentaje de humedad
float porce=0;
float num=0;
	if(medida<1000)
	{
		return 0;// 0% de humedad
	} else {
		num=(medida-1000);
		porce=((num/(4095-1000))*100);
		return (int)porce;
	}
}

void HAL_GPIO_EXTI_Callback(uint16_t GPIO_Pin){
    if (GPIO_Pin==GPIO_PIN_0 && (HAL_GetTick()-ultima_pulsacion)>T_DEBOUNCER){
    	if (flag_riego == 0){
    		flag_boton = 1; //Si se pulsa el boton cuando no se esta regando
    	} else {
    		flag_riego = 0; //Si se pulsa el boton mientras se esta regando se para de regar
    		HAL_TIM_OC_Stop_IT(&htim1, TIM_CHANNEL_2);
    		ultima_vez = HAL_GetTick();
    	}
    	ultima_pulsacion = HAL_GetTick();
    }
}

void HAL_TIM_OC_DelayElapsedCallback (TIM_HandleTypeDef* htim){
	if (htim->Instance == TIM1){
		if(nint==0)
			nint=1;
		else
		{	nint=0;
			flag_riego = 0;
					HAL_TIM_OC_Stop_IT(&htim1, TIM_CHANNEL_2);
					__HAL_TIM_SET_COUNTER(&htim1, 0);
					ultima_vez = HAL_GetTick();
		}
	}
}

void HAL_TIM_PeriodElapsedCallback(TIM_HandleTypeDef *htim){
	if (htim->Instance == TIM2){
				lcd_update(texto_pantalla);
		__HAL_TIM_SET_COUNTER(&htim2, 0);

		//Guardar las medidas de humedad
		for (int i = 0; i < NUM_MEDIDAS-1; i++)
			ultimas_medidas[i] = ultimas_medidas[i+1];
		ultimas_medidas[NUM_MEDIDAS-1] = humedad(ADC_value[1]);

		//Cacular la media
		uint32_t sumatorio = 0;
		for (int i = 0; i < NUM_MEDIDAS ; i++)
			sumatorio += ultimas_medidas[i];
		media = sumatorio / NUM_MEDIDAS;
	}
}


/* USER CODE END 0 */

/**
  * @brief  The application entry point.
  * @retval int
  */
int main(void)
{
  /* USER CODE BEGIN 1 */

  /* USER CODE END 1 */

  /* MCU Configuration--------------------------------------------------------*/

  /* Reset of all peripherals, Initializes the Flash interface and the Systick. */
  HAL_Init();

  /* USER CODE BEGIN Init */
  /* USER CODE END Init */

  /* Configure the system clock */
  SystemClock_Config();

  /* USER CODE BEGIN SysInit */

  /* USER CODE END SysInit */

  /* Initialize all configured peripherals */
  MX_GPIO_Init();
  MX_DMA_Init();
  MX_ADC1_Init();
  MX_TIM1_Init();
  MX_I2C1_Init();
  MX_TIM2_Init();
  /* USER CODE BEGIN 2 */
  lcd_init();

  HAL_ADC_Start_DMA(&hadc1, (uint32_t*)ADC_buffer, 2);
  strcpy(texto_pantalla, "Bienvenido al   sistema de riego");
  lcd_update(texto_pantalla);
  uint32_t tiempo= HAL_GetTick();
 while( (HAL_GetTick()-tiempo)<1000)
{
	 strcpy(texto_pantalla, "Bienvenido al   sistema de riego");
  //Para que el mensaje se mantenga en la patanlla 1 segundo
 }
  lcd_clear();
  HAL_TIM_Base_Start_IT(&htim2);

//Para instertar la hora actual
  counter = HAL_GetTick();
    while (!OK_hour){// Set hora
  	  if (flag_boton){//Se incrementa 1 hora cada vez que se pulsa el boton
    		if (intro_hour < 23){
    			intro_hour++;
    		} else {
    			intro_hour = 0; //Vuelta a 0
    		}
    		flag_boton = 0;
    		counter = HAL_GetTick();
    	}
    	if (HAL_GetTick() - counter > 5000){
    		OK_hour = 1; //Si no se pulsa en 5segundos, se da por terminado el cambio de la hora
    	}
      //Mensaje en la pantalla
  	  if (intro_hour >= 10)
  	  	  sprintf(time_h, "%i", intro_hour);
  	  else
  		  sprintf(time_h, "0%i", intro_hour);

    	strcpy (texto_pantalla, "Actual (hora):  ");
    	strcat(texto_pantalla, time_h);
    	strcat(texto_pantalla, ":00           ");
    }
    counter = HAL_GetTick();
    while (!OK_minute){ // Set minutos
    	if (flag_boton){ //Se incrementa 1 minuto cada vez que se pulsa el boton
    		if (intro_minute < 59){
    			intro_minute++;
    		} else {
    			intro_minute = 0;
    		}
    		flag_boton = 0;
    		counter = HAL_GetTick();
    	}
    	if (HAL_GetTick() - counter > 5000){
    		OK_minute = 1; //Si no se pulsa en 5segundos, se da por terminado el cambio de los minutos
    	}
    	//Mensaje en la pantalla
  	  if (intro_minute >= 10)
  	  	  sprintf(time_m, "%i", intro_minute);
  	  else
  		  sprintf(time_m, "0%i", intro_minute);

  	strcpy (texto_pantalla, "Actual (mins):  ");
  	strcat(texto_pantalla, time_h);
  	strcat(texto_pantalla, ":");
  	strcat(texto_pantalla, time_m);
  	strcat(texto_pantalla, "           ");
    }

 //Para insetar la hora a la que se quiere regar o no activar la opcion
    OK_hour = 0;
    OK_minute = 0;
    counter = HAL_GetTick();
    while (!OK_hour){// Set hora de riego
    	if (flag_boton){
    		if (water_hour < 23){
    			water_hour++;
    		} else {
    			water_hour = 0;
    		}
    		flag_boton = 0;
    		counter = HAL_GetTick();
    	}
    	if (HAL_GetTick() - counter > 5000){
    		OK_hour = 1;
    	}
    	//Mensaje en la pantalla
    	if (water_hour == 100)
    		strcpy (texto_pantalla, "Programar riego?SI=pulsa NO=wait");
    	else {
    		if (water_hour >= 10)
    			sprintf(time_h, "%i", water_hour);
    		else
    			sprintf(time_h, "0%i", water_hour);

    		strcpy (texto_pantalla, "Riego (hora):   ");
    		strcat(texto_pantalla, time_h);
    		strcat(texto_pantalla, ":00           ");
    	}
    }
    counter = HAL_GetTick();
    while (!OK_minute){ // Set minuto de riego
    	if (flag_boton){
    		if (water_minute < 59){
    			water_minute++;
    		} else {
    			water_minute = 0;
    		}
    		flag_boton = 0;
    		counter = HAL_GetTick();
    	}
    	if (HAL_GetTick() - counter > 5000){
    		OK_minute = 1;
    	}
    	//Mensaje en la pantalla
    	if (water_hour == 100)
    	  		strcpy (texto_pantalla, "      wait                      ");
    	else {
    	  	if (water_minute >= 10)
    	  		  	  sprintf(time_m, "%i", water_minute);
    	  		  else
    	  			  sprintf(time_m, "0%i", water_minute);

    	  		strcpy (texto_pantalla, "Riego (mins):   ");
    	  		strcat(texto_pantalla, time_h);
    	  		strcat(texto_pantalla, ":");
    	  		strcat(texto_pantalla, time_m);
    	  		strcat(texto_pantalla, "           ");
    	}
    }

    counter = HAL_GetTick();
    settings = 1; //Terminado el setting

  /* USER CODE END 2 */

  /* Infinite loop */
  /* USER CODE BEGIN WHILE */
  while (1)
  {
    /* USER CODE END WHILE */

    /* USER CODE BEGIN 3 */
//Conteo de tiempo
	  count_second = ((HAL_GetTick()-counter) * 0.001);
	  count_minute = ((HAL_GetTick()-counter) / 60000);
	  count_hour = ((HAL_GetTick()-counter) / 3600000);
//Hora real
	  second = count_second % 60;
	  minute = (intro_minute + count_minute) % 60;
	  hour = (intro_hour + count_hour + ((intro_minute + count_minute) / 60)) % 24;

	  flag_agua = detec_lvl(ADC_value[0]);

	  char buffer [2];
	  if (media >= 10)
	  	  sprintf(buffer, "%i", media);

	  else
		  sprintf(buffer, "0%i", media);

	  if (!flag_riego && flag_agua != 0){ // si no esta regando y hay agua en el deposito = midiendo
		  strcpy(texto_pantalla, "Midiendo...|SistHumedad:");
	      strcat(texto_pantalla, buffer);
	      if(media!=100)
	      strcat(texto_pantalla, "%");
	      strcat(texto_pantalla, "|STBY");
	     }
	  else if (flag_riego && flag_agua != 0){ //Regando (hay suficiente agua para ello)
	      if ((water_hour == hour) && (water_minute == minute) && (second < 4)) //Ademas regando en hora programada
	    	  strcpy(texto_pantalla, "Hora regar.|SistHumedad:");
	      else
	    	  strcpy(texto_pantalla, "Regando....|SistHumedad:");
	      strcat(texto_pantalla, buffer);
	      strcat(texto_pantalla, "%");
	      strcat(texto_pantalla, "|  ON");
	     }
	  else if (media < 50 && flag_agua == 0){ //Debería estar regando pero no hay agua
	      strcpy(texto_pantalla, "ALERTA| Sin aguaHumedad:");
	      strcat(texto_pantalla, buffer);
	      strcat(texto_pantalla, "%| !!!");
	      }
	  else if (!flag_riego && flag_agua == 0){ //No necesita regar pero si lo necesitara no habría agua
	      strcpy(texto_pantalla, "Midiendo..|AVISOHum:");
	      strcat(texto_pantalla, buffer);
	      strcat(texto_pantalla, "%|SIN AGUA");
	  	  }
	  else
	      strcpy(texto_pantalla, "ERROR");




	  if (((media < 50) || (flag_boton == 1) || ((water_hour == hour) && (water_minute == minute) && (second < 4))) && (flag_riego == 0) && ((HAL_GetTick() - ultima_vez) > TIEMPO_DESDE_ULTIMA_VEZ)){
		  flag_boton = 0;
	  	  if (detec_lvl(ADC_value[0]) > 0){
	  		  HAL_NVIC_DisableIRQ(EXTI0_IRQn); //Deshabilitar las interrupciones
	  		  flag_riego = 1;
	  		  //HAL_GPIO_WritePin(GPIOE, GPIO_PIN_11, 1);
	  		  HAL_TIM_OC_Start_IT(&htim1, TIM_CHANNEL_2);
	  		  HAL_NVIC_EnableIRQ(EXTI0_IRQn); //Volver a habilitar las interrupciones
	  	  }
	  }

	  //Detener el riego si se queda sin agua
	  if ((!flag_agua) && (flag_riego)){
		  flag_riego=0;
		  nint=0;
	  		 HAL_TIM_OC_Stop_IT(&htim1, TIM_CHANNEL_2);
	  		 __HAL_TIM_SET_COUNTER(&htim1, 0);
	  		 ultima_vez = HAL_GetTick();

	  }

  }
  /* USER CODE END 3 */
}

/**
  * @brief System Clock Configuration
  * @retval None
  */
void SystemClock_Config(void)
{
  RCC_OscInitTypeDef RCC_OscInitStruct = {0};
  RCC_ClkInitTypeDef RCC_ClkInitStruct = {0};

  /** Configure the main internal regulator output voltage
  */
  __HAL_RCC_PWR_CLK_ENABLE();
  __HAL_PWR_VOLTAGESCALING_CONFIG(PWR_REGULATOR_VOLTAGE_SCALE1);

  /** Initializes the RCC Oscillators according to the specified parameters
  * in the RCC_OscInitTypeDef structure.
  */
  RCC_OscInitStruct.OscillatorType = RCC_OSCILLATORTYPE_HSI;
  RCC_OscInitStruct.HSIState = RCC_HSI_ON;
  RCC_OscInitStruct.HSICalibrationValue = RCC_HSICALIBRATION_DEFAULT;
  RCC_OscInitStruct.PLL.PLLState = RCC_PLL_ON;
  RCC_OscInitStruct.PLL.PLLSource = RCC_PLLSOURCE_HSI;
  RCC_OscInitStruct.PLL.PLLM = 8;
  RCC_OscInitStruct.PLL.PLLN = 50;
  RCC_OscInitStruct.PLL.PLLP = RCC_PLLP_DIV2;
  RCC_OscInitStruct.PLL.PLLQ = 8;
  if (HAL_RCC_OscConfig(&RCC_OscInitStruct) != HAL_OK)
  {
    Error_Handler();
  }

  /** Initializes the CPU, AHB and APB buses clocks
  */
  RCC_ClkInitStruct.ClockType = RCC_CLOCKTYPE_HCLK|RCC_CLOCKTYPE_SYSCLK
                              |RCC_CLOCKTYPE_PCLK1|RCC_CLOCKTYPE_PCLK2;
  RCC_ClkInitStruct.SYSCLKSource = RCC_SYSCLKSOURCE_PLLCLK;
  RCC_ClkInitStruct.AHBCLKDivider = RCC_SYSCLK_DIV1;
  RCC_ClkInitStruct.APB1CLKDivider = RCC_HCLK_DIV4;
  RCC_ClkInitStruct.APB2CLKDivider = RCC_HCLK_DIV1;

  if (HAL_RCC_ClockConfig(&RCC_ClkInitStruct, FLASH_LATENCY_1) != HAL_OK)
  {
    Error_Handler();
  }
}

/**
  * @brief ADC1 Initialization Function
  * @param None
  * @retval None
  */
static void MX_ADC1_Init(void)
{

  /* USER CODE BEGIN ADC1_Init 0 */

  /* USER CODE END ADC1_Init 0 */

  ADC_ChannelConfTypeDef sConfig = {0};

  /* USER CODE BEGIN ADC1_Init 1 */

  /* USER CODE END ADC1_Init 1 */

  /** Configure the global features of the ADC (Clock, Resolution, Data Alignment and number of conversion)
  */
  hadc1.Instance = ADC1;
  hadc1.Init.ClockPrescaler = ADC_CLOCK_SYNC_PCLK_DIV2;
  hadc1.Init.Resolution = ADC_RESOLUTION_12B;
  hadc1.Init.ScanConvMode = ENABLE;
  hadc1.Init.ContinuousConvMode = ENABLE;
  hadc1.Init.DiscontinuousConvMode = DISABLE;
  hadc1.Init.ExternalTrigConvEdge = ADC_EXTERNALTRIGCONVEDGE_NONE;
  hadc1.Init.ExternalTrigConv = ADC_SOFTWARE_START;
  hadc1.Init.DataAlign = ADC_DATAALIGN_RIGHT;
  hadc1.Init.NbrOfConversion = 2;
  hadc1.Init.DMAContinuousRequests = ENABLE;
  hadc1.Init.EOCSelection = ADC_EOC_SINGLE_CONV;
  if (HAL_ADC_Init(&hadc1) != HAL_OK)
  {
    Error_Handler();
  }

  /** Configure for the selected ADC regular channel its corresponding rank in the sequencer and its sample time.
  */
  sConfig.Channel = ADC_CHANNEL_4;
  sConfig.Rank = 1;
  sConfig.SamplingTime = ADC_SAMPLETIME_480CYCLES;
  if (HAL_ADC_ConfigChannel(&hadc1, &sConfig) != HAL_OK)
  {
    Error_Handler();
  }

  /** Configure for the selected ADC regular channel its corresponding rank in the sequencer and its sample time.
  */
  sConfig.Channel = ADC_CHANNEL_5;
  sConfig.Rank = 2;
  if (HAL_ADC_ConfigChannel(&hadc1, &sConfig) != HAL_OK)
  {
    Error_Handler();
  }
  /* USER CODE BEGIN ADC1_Init 2 */

  /* USER CODE END ADC1_Init 2 */

}

/**
  * @brief I2C1 Initialization Function
  * @param None
  * @retval None
  */
static void MX_I2C1_Init(void)
{

  /* USER CODE BEGIN I2C1_Init 0 */

  /* USER CODE END I2C1_Init 0 */

  /* USER CODE BEGIN I2C1_Init 1 */

  /* USER CODE END I2C1_Init 1 */
  hi2c1.Instance = I2C1;
  hi2c1.Init.ClockSpeed = 100000;
  hi2c1.Init.DutyCycle = I2C_DUTYCYCLE_2;
  hi2c1.Init.OwnAddress1 = 0;
  hi2c1.Init.AddressingMode = I2C_ADDRESSINGMODE_7BIT;
  hi2c1.Init.DualAddressMode = I2C_DUALADDRESS_DISABLE;
  hi2c1.Init.OwnAddress2 = 0;
  hi2c1.Init.GeneralCallMode = I2C_GENERALCALL_DISABLE;
  hi2c1.Init.NoStretchMode = I2C_NOSTRETCH_DISABLE;
  if (HAL_I2C_Init(&hi2c1) != HAL_OK)
  {
    Error_Handler();
  }
  /* USER CODE BEGIN I2C1_Init 2 */

  /* USER CODE END I2C1_Init 2 */

}

/**
  * @brief TIM1 Initialization Function
  * @param None
  * @retval None
  */
static void MX_TIM1_Init(void)
{

  /* USER CODE BEGIN TIM1_Init 0 */

  /* USER CODE END TIM1_Init 0 */

  TIM_ClockConfigTypeDef sClockSourceConfig = {0};
  TIM_MasterConfigTypeDef sMasterConfig = {0};
  TIM_OC_InitTypeDef sConfigOC = {0};
  TIM_BreakDeadTimeConfigTypeDef sBreakDeadTimeConfig = {0};

  /* USER CODE BEGIN TIM1_Init 1 */

  /* USER CODE END TIM1_Init 1 */
  htim1.Instance = TIM1;
  htim1.Init.Prescaler = 49999;
  htim1.Init.CounterMode = TIM_COUNTERMODE_UP;
  htim1.Init.Period = 4999;
  htim1.Init.ClockDivision = TIM_CLOCKDIVISION_DIV1;
  htim1.Init.RepetitionCounter = 0;
  htim1.Init.AutoReloadPreload = TIM_AUTORELOAD_PRELOAD_DISABLE;
  if (HAL_TIM_Base_Init(&htim1) != HAL_OK)
  {
    Error_Handler();
  }
  sClockSourceConfig.ClockSource = TIM_CLOCKSOURCE_INTERNAL;
  if (HAL_TIM_ConfigClockSource(&htim1, &sClockSourceConfig) != HAL_OK)
  {
    Error_Handler();
  }
  if (HAL_TIM_OC_Init(&htim1) != HAL_OK)
  {
    Error_Handler();
  }
  sMasterConfig.MasterOutputTrigger = TIM_TRGO_RESET;
  sMasterConfig.MasterSlaveMode = TIM_MASTERSLAVEMODE_DISABLE;
  if (HAL_TIMEx_MasterConfigSynchronization(&htim1, &sMasterConfig) != HAL_OK)
  {
    Error_Handler();
  }
  sConfigOC.OCMode = TIM_OCMODE_ACTIVE;
  sConfigOC.Pulse = 0;
  sConfigOC.OCPolarity = TIM_OCPOLARITY_HIGH;
  sConfigOC.OCNPolarity = TIM_OCNPOLARITY_HIGH;
  sConfigOC.OCFastMode = TIM_OCFAST_DISABLE;
  sConfigOC.OCIdleState = TIM_OCIDLESTATE_RESET;
  sConfigOC.OCNIdleState = TIM_OCNIDLESTATE_RESET;
  if (HAL_TIM_OC_ConfigChannel(&htim1, &sConfigOC, TIM_CHANNEL_2) != HAL_OK)
  {
    Error_Handler();
  }
  sBreakDeadTimeConfig.OffStateRunMode = TIM_OSSR_DISABLE;
  sBreakDeadTimeConfig.OffStateIDLEMode = TIM_OSSI_DISABLE;
  sBreakDeadTimeConfig.LockLevel = TIM_LOCKLEVEL_OFF;
  sBreakDeadTimeConfig.DeadTime = 0;
  sBreakDeadTimeConfig.BreakState = TIM_BREAK_DISABLE;
  sBreakDeadTimeConfig.BreakPolarity = TIM_BREAKPOLARITY_HIGH;
  sBreakDeadTimeConfig.AutomaticOutput = TIM_AUTOMATICOUTPUT_DISABLE;
  if (HAL_TIMEx_ConfigBreakDeadTime(&htim1, &sBreakDeadTimeConfig) != HAL_OK)
  {
    Error_Handler();
  }
  /* USER CODE BEGIN TIM1_Init 2 */

  /* USER CODE END TIM1_Init 2 */
  HAL_TIM_MspPostInit(&htim1);

}

/**
  * @brief TIM2 Initialization Function
  * @param None
  * @retval None
  */
static void MX_TIM2_Init(void)
{

  /* USER CODE BEGIN TIM2_Init 0 */

  /* USER CODE END TIM2_Init 0 */

  TIM_ClockConfigTypeDef sClockSourceConfig = {0};
  TIM_MasterConfigTypeDef sMasterConfig = {0};

  /* USER CODE BEGIN TIM2_Init 1 */

  /* USER CODE END TIM2_Init 1 */
  htim2.Instance = TIM2;
  htim2.Init.Prescaler = 49999;
  htim2.Init.CounterMode = TIM_COUNTERMODE_UP;
  htim2.Init.Period = 500;
  htim2.Init.ClockDivision = TIM_CLOCKDIVISION_DIV1;
  htim2.Init.AutoReloadPreload = TIM_AUTORELOAD_PRELOAD_DISABLE;
  if (HAL_TIM_Base_Init(&htim2) != HAL_OK)
  {
    Error_Handler();
  }
  sClockSourceConfig.ClockSource = TIM_CLOCKSOURCE_INTERNAL;
  if (HAL_TIM_ConfigClockSource(&htim2, &sClockSourceConfig) != HAL_OK)
  {
    Error_Handler();
  }
  sMasterConfig.MasterOutputTrigger = TIM_TRGO_RESET;
  sMasterConfig.MasterSlaveMode = TIM_MASTERSLAVEMODE_DISABLE;
  if (HAL_TIMEx_MasterConfigSynchronization(&htim2, &sMasterConfig) != HAL_OK)
  {
    Error_Handler();
  }
  /* USER CODE BEGIN TIM2_Init 2 */

  /* USER CODE END TIM2_Init 2 */

}

/**
  * Enable DMA controller clock
  */
static void MX_DMA_Init(void)
{

  /* DMA controller clock enable */
  __HAL_RCC_DMA2_CLK_ENABLE();

  /* DMA interrupt init */
  /* DMA2_Stream0_IRQn interrupt configuration */
  HAL_NVIC_SetPriority(DMA2_Stream0_IRQn, 0, 0);
  HAL_NVIC_EnableIRQ(DMA2_Stream0_IRQn);

}

/**
  * @brief GPIO Initialization Function
  * @param None
  * @retval None
  */
static void MX_GPIO_Init(void)
{
  GPIO_InitTypeDef GPIO_InitStruct = {0};

  /* GPIO Ports Clock Enable */
  __HAL_RCC_GPIOA_CLK_ENABLE();
  __HAL_RCC_GPIOE_CLK_ENABLE();
  __HAL_RCC_GPIOB_CLK_ENABLE();

  /*Configure GPIO pin : PA0 */
  GPIO_InitStruct.Pin = GPIO_PIN_0;
  GPIO_InitStruct.Mode = GPIO_MODE_IT_RISING;
  GPIO_InitStruct.Pull = GPIO_NOPULL;
  HAL_GPIO_Init(GPIOA, &GPIO_InitStruct);

  /* EXTI interrupt init*/
  HAL_NVIC_SetPriority(EXTI0_IRQn, 0, 0);
  HAL_NVIC_EnableIRQ(EXTI0_IRQn);

}

/* USER CODE BEGIN 4 */
void lcd_send_data (char data)
{
	char data_u, data_l;
	uint8_t data_t[4];
	data_u = (data&0xf0);
	data_l = ((data<<4)&0xf0);
	data_t[0] = data_u|0x0D;  //en=1, rs=1
	data_t[1] = data_u|0x09;  //en=0, rs=1
	data_t[2] = data_l|0x0D;  //en=1, rs=1
	data_t[3] = data_l|0x09;  //en=0, rs=1
	HAL_I2C_Master_Transmit (&hi2c1, SLAVE_ADDRESS_LCD,(uint8_t *) data_t, 4, HAL_MAX_DELAY);
}

void lcd_send_cmd (char cmd)
{
  char data_u, data_l;
	uint8_t data_t[4];
	data_u = (cmd&0xf0);
	data_l = ((cmd<<4)&0xf0);
	data_t[0] = data_u|0x0C;  //en=1, rs=0
	data_t[1] = data_u|0x08;  //en=0, rs=0
	data_t[2] = data_l|0x0C;  //en=1, rs=0
	data_t[3] = data_l|0x08;  //en=0, rs=0
	HAL_I2C_Master_Transmit (&hi2c1, SLAVE_ADDRESS_LCD,(uint8_t *) data_t, 4, HAL_MAX_DELAY);
}

void lcd_init (void)
{
	HAL_Delay(45); //Datasheet especifica espera de 40ms
	lcd_send_cmd (0x30); //Encendido del display y del cursor
	HAL_Delay(5); //Datasheet especifica espera de 4.1ms
	lcd_send_cmd (0x30); //El datasheet especifica que se debe repetir el envio de esta instruccion
	HAL_Delay(1); //Datasheet especifica espera de 100us
	lcd_send_cmd(0x30);
	HAL_Delay(1);
	lcd_send_cmd (0x20);  // 4bit mode
	HAL_Delay(1);
	lcd_send_cmd (0x28); // Function set --> DL=0 (4 bit mode), N = 1 (2 line display) F = 0 (5x8 characters)
	HAL_Delay(1);
	lcd_send_cmd (0x08); //Display on/off control --> D=0,C=0, B=0  ---> display off
	HAL_Delay(1);
	lcd_send_cmd (0x01);  //Clear
	HAL_Delay(1);
	lcd_send_cmd (0x06); //Entry mode set --> I/D = 1 (increment cursor) & S = 0 (no shift)
	HAL_Delay(1);
	lcd_send_cmd (0x0C); //Display on/off control --> D = 1, C and B = 0. (Cursor and blink, last two bits)
	HAL_Delay(1);
}

void lcd_send_string (char *str)
{
	//Escribe a continuación de lo que haya
	static int contador_linea = 0; //Static para que no se borre entre ejecuciones de la función
	contador_linea = 0;
	while (*str){
		lcd_send_data (*str++);
		contador_linea = (contador_linea) % (ROWS*LINES); //Contar hasta el número de caracteres máximo
		contador_linea++;
		if (contador_linea == ROWS)
			lcd_send_cmd(0xc0); //Pasa a la segunda línea
		if (contador_linea > ROWS*LINES)
			return; //No hace nada más porque no hay espacio
	}
}

void lcd_update (char *str){

	lcd_clear(); //Borra la pantalla y pone el cursor en la esquina superior izquierda
	//En esta funcion se hacen los saltos de linea necesarios.
	/*
	int contador_lineas = 0;
	contador_lineas = 0;
	while (*str){
		lcd_send_data (*str++);
		contador_lineas = (contador_lineas) % (ROWS*LINES); //Contar hasta el número de caracteres máximo
		contador_lineas++;
		if (contador_lineas == ROWS)
			lcd_send_cmd(0xc0); //Pasa a la segunda línea
		if (contador_lineas > ROWS*LINES)
			return; //No hace nada más porque no hay espacio
	}
	*/
	lcd_send_string(str);

}

void lcd_clear(void){ //Tambien posiciona el cursor en la esquina superior izquierda. SOLO VALE PARA DISPLAY 16x2
	lcd_send_cmd(0x80); //Posiciona en el comienzo
	for (int i=0; i < LINES; i++){ //Recorrer todas las filas
		for (int j=0; j < ROWS; j++) //Recorrer todas las columnas
			lcd_send_data(' '); //Poner espacios (borrar todo)
		lcd_send_cmd(0x0c); //Posicionar en la segunda linea
	}
	lcd_send_cmd(0x80); //Posicionar el cursor en el comienzo de nuevo
}

void strdel(char* cadena){
	for (int i=0; i < LINES*ROWS; i++)
		*cadena++ = ' ';


}

void info(void){
	HAL_NVIC_DisableIRQ(EXTI0_IRQn);
	strdel(texto_pantalla);
	strcpy(texto_pantalla, "Test");
	HAL_NVIC_EnableIRQ(EXTI0_IRQn); //Volver a habilitar las interrupciones
}
/* USER CODE END 4 */

/**
  * @brief  This function is executed in case of error occurrence.
  * @retval None
  */
void Error_Handler(void)
{
  /* USER CODE BEGIN Error_Handler_Debug */
  /* User can add his own implementation to report the HAL error return state */
  __disable_irq();
  while (1)
  {
  }
  /* USER CODE END Error_Handler_Debug */
}

#ifdef  USE_FULL_ASSERT
/**
  * @brief  Reports the name of the source file and the source line number
  *         where the assert_param error has occurred.
  * @param  file: pointer to the source file name
  * @param  line: assert_param error line source number
  * @retval None
  */
void assert_failed(uint8_t *file, uint32_t line)
{
  /* USER CODE BEGIN 6 */
  /* User can add his own implementation to report the file name and line number,
     ex: printf("Wrong parameters value: file %s on line %d\r\n", file, line) */
  /* USER CODE END 6 */
}
#endif /* USE_FULL_ASSERT */
