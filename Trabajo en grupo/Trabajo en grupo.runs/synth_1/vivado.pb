
?
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2$
create_project: 2default:default2
00:00:062default:default2
00:00:092default:default2
378.3122default:default2
61.0822default:defaultZ17-268h px? 
?
Command: %s
1870*	planAhead2?
?read_checkpoint -auto_incremental -incremental {C:/Users/nacho/Documents/GitHub/Trabajo-SED-VHDL/Trabajo en grupo/Trabajo en grupo.srcs/utils_1/imports/synth_1/top.dcp}2default:defaultZ12-2866h px? 
?
;Read reference checkpoint from %s for incremental synthesis3154*	planAhead2?
wC:/Users/nacho/Documents/GitHub/Trabajo-SED-VHDL/Trabajo en grupo/Trabajo en grupo.srcs/utils_1/imports/synth_1/top.dcp2default:defaultZ12-5825h px? 
T
-Please ensure there are no constraint changes3725*	planAheadZ12-7989h px? 
q
Command: %s
53*	vivadotcl2@
,synth_design -top top -part xc7a100tcsg324-12default:defaultZ4-113h px? 
:
Starting synth_design
149*	vivadotclZ4-321h px? 
?
@Attempting to get a license for feature '%s' and/or device '%s'
308*common2
	Synthesis2default:default2
xc7a100t2default:defaultZ17-347h px? 
?
0Got license for feature '%s' and/or device '%s'
310*common2
	Synthesis2default:default2
xc7a100t2default:defaultZ17-349h px? 
W
Loading part %s157*device2$
xc7a100tcsg324-12default:defaultZ21-403h px? 

VNo compile time benefit to using incremental synthesis; A full resynthesis will be run2353*designutilsZ20-5440h px? 
?
?Flow is switching to default flow due to incremental criteria not met. If you would like to alter this behaviour and have the flow terminate instead, please set the following parameter config_implementation {autoIncr.Synth.RejectBehavior Terminate}2229*designutilsZ20-4379h px? 
?
HMultithreading enabled for synth_design using a maximum of %s processes.4828*oasys2
22default:defaultZ8-7079h px? 
a
?Launching helper process for spawning children vivado processes4827*oasysZ8-7078h px? 
_
#Helper process launched with PID %s4824*oasys2
20602default:defaultZ8-7075h px? 
?
5undeclared symbol '%s', assumed default net type '%s'7502*oasys2
REGCCE2default:default2
wire2default:default2[
EC:/Xilinx/Vivado/2022.2/data/verilog/src/unimacro/BRAM_SINGLE_MACRO.v2default:default2
21702default:default8@Z8-11241h px? 
?
%s*synth2?
yStarting RTL Elaboration : Time (s): cpu = 00:00:09 ; elapsed = 00:00:09 . Memory (MB): peak = 1210.066 ; gain = 408.547
2default:defaulth px? 
?
synthesizing module '%s'638*oasys2
top2default:default2?
mC:/Users/nacho/Documents/GitHub/Trabajo-SED-VHDL/Trabajo en grupo/Trabajo en grupo.srcs/sources_1/new/top.vhd2default:default2
342default:default8@Z8-638h px? 
?
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
	SYNCHRNZR2default:default2?
sC:/Users/nacho/Documents/GitHub/Trabajo-SED-VHDL/Trabajo en grupo/Trabajo en grupo.srcs/sources_1/new/SYNCHRNZR.vhd2default:default2
342default:default2
synch2default:default2
	SYNCHRNZR2default:default2?
mC:/Users/nacho/Documents/GitHub/Trabajo-SED-VHDL/Trabajo en grupo/Trabajo en grupo.srcs/sources_1/new/top.vhd2default:default2
1672default:default8@Z8-3491h px? 
?
synthesizing module '%s'638*oasys2
	SYNCHRNZR2default:default2?
sC:/Users/nacho/Documents/GitHub/Trabajo-SED-VHDL/Trabajo en grupo/Trabajo en grupo.srcs/sources_1/new/SYNCHRNZR.vhd2default:default2
422default:default8@Z8-638h px? 
?
%done synthesizing module '%s' (%s#%s)256*oasys2
	SYNCHRNZR2default:default2
02default:default2
12default:default2?
sC:/Users/nacho/Documents/GitHub/Trabajo-SED-VHDL/Trabajo en grupo/Trabajo en grupo.srcs/sources_1/new/SYNCHRNZR.vhd2default:default2
422default:default8@Z8-256h px? 
?
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
	SYNCHRNZR2default:default2?
sC:/Users/nacho/Documents/GitHub/Trabajo-SED-VHDL/Trabajo en grupo/Trabajo en grupo.srcs/sources_1/new/SYNCHRNZR.vhd2default:default2
342default:default2
synch2default:default2
	SYNCHRNZR2default:default2?
mC:/Users/nacho/Documents/GitHub/Trabajo-SED-VHDL/Trabajo en grupo/Trabajo en grupo.srcs/sources_1/new/top.vhd2default:default2
1672default:default8@Z8-3491h px? 
?
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
	SYNCHRNZR2default:default2?
sC:/Users/nacho/Documents/GitHub/Trabajo-SED-VHDL/Trabajo en grupo/Trabajo en grupo.srcs/sources_1/new/SYNCHRNZR.vhd2default:default2
342default:default2
synch2default:default2
	SYNCHRNZR2default:default2?
mC:/Users/nacho/Documents/GitHub/Trabajo-SED-VHDL/Trabajo en grupo/Trabajo en grupo.srcs/sources_1/new/top.vhd2default:default2
1672default:default8@Z8-3491h px? 
?
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
	SYNCHRNZR2default:default2?
sC:/Users/nacho/Documents/GitHub/Trabajo-SED-VHDL/Trabajo en grupo/Trabajo en grupo.srcs/sources_1/new/SYNCHRNZR.vhd2default:default2
342default:default2
synch2default:default2
	SYNCHRNZR2default:default2?
mC:/Users/nacho/Documents/GitHub/Trabajo-SED-VHDL/Trabajo en grupo/Trabajo en grupo.srcs/sources_1/new/top.vhd2default:default2
1672default:default8@Z8-3491h px? 
?
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
	EDGEDTCTR2default:default2?
sC:/Users/nacho/Documents/GitHub/Trabajo-SED-VHDL/Trabajo en grupo/Trabajo en grupo.srcs/sources_1/new/EDGEDTCTR.vhd2default:default2
342default:default2
edge2default:default2
	EDGEDTCTR2default:default2?
mC:/Users/nacho/Documents/GitHub/Trabajo-SED-VHDL/Trabajo en grupo/Trabajo en grupo.srcs/sources_1/new/top.vhd2default:default2
1772default:default8@Z8-3491h px? 
?
synthesizing module '%s'638*oasys2
	EDGEDTCTR2default:default2?
sC:/Users/nacho/Documents/GitHub/Trabajo-SED-VHDL/Trabajo en grupo/Trabajo en grupo.srcs/sources_1/new/EDGEDTCTR.vhd2default:default2
422default:default8@Z8-638h px? 
?
%done synthesizing module '%s' (%s#%s)256*oasys2
	EDGEDTCTR2default:default2
02default:default2
12default:default2?
sC:/Users/nacho/Documents/GitHub/Trabajo-SED-VHDL/Trabajo en grupo/Trabajo en grupo.srcs/sources_1/new/EDGEDTCTR.vhd2default:default2
422default:default8@Z8-256h px? 
?
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
	EDGEDTCTR2default:default2?
sC:/Users/nacho/Documents/GitHub/Trabajo-SED-VHDL/Trabajo en grupo/Trabajo en grupo.srcs/sources_1/new/EDGEDTCTR.vhd2default:default2
342default:default2
edge2default:default2
	EDGEDTCTR2default:default2?
mC:/Users/nacho/Documents/GitHub/Trabajo-SED-VHDL/Trabajo en grupo/Trabajo en grupo.srcs/sources_1/new/top.vhd2default:default2
1772default:default8@Z8-3491h px? 
?
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
	EDGEDTCTR2default:default2?
sC:/Users/nacho/Documents/GitHub/Trabajo-SED-VHDL/Trabajo en grupo/Trabajo en grupo.srcs/sources_1/new/EDGEDTCTR.vhd2default:default2
342default:default2
edge2default:default2
	EDGEDTCTR2default:default2?
mC:/Users/nacho/Documents/GitHub/Trabajo-SED-VHDL/Trabajo en grupo/Trabajo en grupo.srcs/sources_1/new/top.vhd2default:default2
1772default:default8@Z8-3491h px? 
?
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
	EDGEDTCTR2default:default2?
sC:/Users/nacho/Documents/GitHub/Trabajo-SED-VHDL/Trabajo en grupo/Trabajo en grupo.srcs/sources_1/new/EDGEDTCTR.vhd2default:default2
342default:default2
edge2default:default2
	EDGEDTCTR2default:default2?
mC:/Users/nacho/Documents/GitHub/Trabajo-SED-VHDL/Trabajo en grupo/Trabajo en grupo.srcs/sources_1/new/top.vhd2default:default2
1772default:default8@Z8-3491h px? 
?
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
FSM2default:default2?
mC:/Users/nacho/Documents/GitHub/Trabajo-SED-VHDL/Trabajo en grupo/Trabajo en grupo.srcs/sources_1/new/FSM.vhd2default:default2
62default:default2
FSM_C2default:default2
FSM2default:default2?
mC:/Users/nacho/Documents/GitHub/Trabajo-SED-VHDL/Trabajo en grupo/Trabajo en grupo.srcs/sources_1/new/top.vhd2default:default2
1862default:default8@Z8-3491h px? 
?
synthesizing module '%s'638*oasys2
FSM2default:default2?
mC:/Users/nacho/Documents/GitHub/Trabajo-SED-VHDL/Trabajo en grupo/Trabajo en grupo.srcs/sources_1/new/FSM.vhd2default:default2
272default:default8@Z8-638h px? 
?
%done synthesizing module '%s' (%s#%s)256*oasys2
FSM2default:default2
02default:default2
12default:default2?
mC:/Users/nacho/Documents/GitHub/Trabajo-SED-VHDL/Trabajo en grupo/Trabajo en grupo.srcs/sources_1/new/FSM.vhd2default:default2
272default:default8@Z8-256h px? 
c
%s
*synth2K
7	Parameter in_time_width bound to: 13 - type: integer 
2default:defaulth p
x
? 
d
%s
*synth2L
8	Parameter out_time_width bound to: 13 - type: integer 
2default:defaulth p
x
? 
c
%s
*synth2K
7	Parameter divide bound to: 100000000 - type: integer 
2default:defaulth p
x
? 
`
%s
*synth2H
4	Parameter conversion bound to: 30 - type: integer 
2default:defaulth p
x
? 
`
%s
*synth2H
4	Parameter max_time bound to: 5940 - type: integer 
2default:defaulth p
x
? 
?
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
CRONO2default:default2?
oC:/Users/nacho/Documents/GitHub/Trabajo-SED-VHDL/Trabajo en grupo/Trabajo en grupo.srcs/sources_1/new/CRONO.vhd2default:default2
52default:default2
CRONO_C2default:default2
CRONO2default:default2?
mC:/Users/nacho/Documents/GitHub/Trabajo-SED-VHDL/Trabajo en grupo/Trabajo en grupo.srcs/sources_1/new/top.vhd2default:default2
2052default:default8@Z8-3491h px? 
?
synthesizing module '%s'638*oasys2
CRONO2default:default2?
oC:/Users/nacho/Documents/GitHub/Trabajo-SED-VHDL/Trabajo en grupo/Trabajo en grupo.srcs/sources_1/new/CRONO.vhd2default:default2
282default:default8@Z8-638h px? 
c
%s
*synth2K
7	Parameter in_time_width bound to: 13 - type: integer 
2default:defaulth p
x
? 
d
%s
*synth2L
8	Parameter out_time_width bound to: 13 - type: integer 
2default:defaulth p
x
? 
c
%s
*synth2K
7	Parameter divide bound to: 100000000 - type: integer 
2default:defaulth p
x
? 
`
%s
*synth2H
4	Parameter conversion bound to: 30 - type: integer 
2default:defaulth p
x
? 
`
%s
*synth2H
4	Parameter max_time bound to: 5940 - type: integer 
2default:defaulth p
x
? 
c
%s
*synth2K
7	Parameter DIVIDE bound to: 100000000 - type: integer 
2default:defaulth p
x
? 
?
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
FREQ_DIV2default:default2?
rC:/Users/nacho/Documents/GitHub/Trabajo-SED-VHDL/Trabajo en grupo/Trabajo en grupo.srcs/sources_1/new/FREQ_DIV.vhd2default:default2
52default:default2"
freq_div_1_sec2default:default2
FREQ_DIV2default:default2?
oC:/Users/nacho/Documents/GitHub/Trabajo-SED-VHDL/Trabajo en grupo/Trabajo en grupo.srcs/sources_1/new/CRONO.vhd2default:default2
612default:default8@Z8-3491h px? 
?
synthesizing module '%s'638*oasys2
FREQ_DIV2default:default2?
rC:/Users/nacho/Documents/GitHub/Trabajo-SED-VHDL/Trabajo en grupo/Trabajo en grupo.srcs/sources_1/new/FREQ_DIV.vhd2default:default2
162default:default8@Z8-638h px? 
c
%s
*synth2K
7	Parameter DIVIDE bound to: 100000000 - type: integer 
2default:defaulth p
x
? 
?
%done synthesizing module '%s' (%s#%s)256*oasys2
FREQ_DIV2default:default2
02default:default2
12default:default2?
rC:/Users/nacho/Documents/GitHub/Trabajo-SED-VHDL/Trabajo en grupo/Trabajo en grupo.srcs/sources_1/new/FREQ_DIV.vhd2default:default2
162default:default8@Z8-256h px? 
_
%s
*synth2G
3	Parameter out_width bound to: 13 - type: integer 
2default:defaulth p
x
? 
`
%s
*synth2H
4	Parameter conversion bound to: 30 - type: integer 
2default:defaulth p
x
? 
^
%s
*synth2F
2	Parameter maximo bound to: 5940 - type: integer 
2default:defaulth p
x
? 
?
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
	INCREMENT2default:default2?
sC:/Users/nacho/Documents/GitHub/Trabajo-SED-VHDL/Trabajo en grupo/Trabajo en grupo.srcs/sources_1/new/INCREMENT.vhd2default:default2
62default:default2"
increment_load2default:default2
	INCREMENT2default:default2?
oC:/Users/nacho/Documents/GitHub/Trabajo-SED-VHDL/Trabajo en grupo/Trabajo en grupo.srcs/sources_1/new/CRONO.vhd2default:default2
712default:default8@Z8-3491h px? 
?
synthesizing module '%s'638*oasys2
	INCREMENT2default:default2?
sC:/Users/nacho/Documents/GitHub/Trabajo-SED-VHDL/Trabajo en grupo/Trabajo en grupo.srcs/sources_1/new/INCREMENT.vhd2default:default2
222default:default8@Z8-638h px? 
_
%s
*synth2G
3	Parameter out_width bound to: 13 - type: integer 
2default:defaulth p
x
? 
`
%s
*synth2H
4	Parameter conversion bound to: 30 - type: integer 
2default:defaulth p
x
? 
^
%s
*synth2F
2	Parameter maximo bound to: 5940 - type: integer 
2default:defaulth p
x
? 
?
Esignal '%s' is read in the process but is not in the sensitivity list614*oasys2
ENABLE2default:default2?
sC:/Users/nacho/Documents/GitHub/Trabajo-SED-VHDL/Trabajo en grupo/Trabajo en grupo.srcs/sources_1/new/INCREMENT.vhd2default:default2
252default:default8@Z8-614h px? 
?
%done synthesizing module '%s' (%s#%s)256*oasys2
	INCREMENT2default:default2
02default:default2
12default:default2?
sC:/Users/nacho/Documents/GitHub/Trabajo-SED-VHDL/Trabajo en grupo/Trabajo en grupo.srcs/sources_1/new/INCREMENT.vhd2default:default2
222default:default8@Z8-256h px? 
?
Esignal '%s' is read in the process but is not in the sensitivity list614*oasys2
Load2default:default2?
oC:/Users/nacho/Documents/GitHub/Trabajo-SED-VHDL/Trabajo en grupo/Trabajo en grupo.srcs/sources_1/new/CRONO.vhd2default:default2
852default:default8@Z8-614h px? 
?
%done synthesizing module '%s' (%s#%s)256*oasys2
CRONO2default:default2
02default:default2
12default:default2?
oC:/Users/nacho/Documents/GitHub/Trabajo-SED-VHDL/Trabajo en grupo/Trabajo en grupo.srcs/sources_1/new/CRONO.vhd2default:default2
282default:default8@Z8-256h px? 
[
%s
*synth2C
/	Parameter width bound to: 13 - type: integer 
2default:defaulth p
x
? 
?
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
MUX2A12default:default2?
pC:/Users/nacho/Documents/GitHub/Trabajo-SED-VHDL/Trabajo en grupo/Trabajo en grupo.srcs/sources_1/new/MUX2A1.vhd2default:default2
52default:default2
MUX_C2default:default2
MUX2A12default:default2?
mC:/Users/nacho/Documents/GitHub/Trabajo-SED-VHDL/Trabajo en grupo/Trabajo en grupo.srcs/sources_1/new/top.vhd2default:default2
2272default:default8@Z8-3491h px? 
?
synthesizing module '%s'638*oasys2
MUX2A12default:default2?
pC:/Users/nacho/Documents/GitHub/Trabajo-SED-VHDL/Trabajo en grupo/Trabajo en grupo.srcs/sources_1/new/MUX2A1.vhd2default:default2
172default:default8@Z8-638h px? 
[
%s
*synth2C
/	Parameter width bound to: 13 - type: integer 
2default:defaulth p
x
? 
?
Esignal '%s' is read in the process but is not in the sensitivity list614*oasys2
DATA22default:default2?
pC:/Users/nacho/Documents/GitHub/Trabajo-SED-VHDL/Trabajo en grupo/Trabajo en grupo.srcs/sources_1/new/MUX2A1.vhd2default:default2
202default:default8@Z8-614h px? 
?
Esignal '%s' is read in the process but is not in the sensitivity list614*oasys2
DATA12default:default2?
pC:/Users/nacho/Documents/GitHub/Trabajo-SED-VHDL/Trabajo en grupo/Trabajo en grupo.srcs/sources_1/new/MUX2A1.vhd2default:default2
202default:default8@Z8-614h px? 
?
%done synthesizing module '%s' (%s#%s)256*oasys2
MUX2A12default:default2
02default:default2
12default:default2?
pC:/Users/nacho/Documents/GitHub/Trabajo-SED-VHDL/Trabajo en grupo/Trabajo en grupo.srcs/sources_1/new/MUX2A1.vhd2default:default2
172default:default8@Z8-256h px? 
`
%s
*synth2H
4	Parameter speed_width bound to: 4 - type: integer 
2default:defaulth p
x
? 
_
%s
*synth2G
3	Parameter incl_width bound to: 4 - type: integer 
2default:defaulth p
x
? 
e
%s
*synth2M
9	Parameter conversion_speed bound to: 1 - type: integer 
2default:defaulth p
x
? 
d
%s
*synth2L
8	Parameter conversion_incl bound to: 1 - type: integer 
2default:defaulth p
x
? 
Y
%s
*synth2A
-	Parameter max bound to: 15 - type: integer 
2default:defaulth p
x
? 
?
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
MODOS2default:default2?
oC:/Users/nacho/Documents/GitHub/Trabajo-SED-VHDL/Trabajo en grupo/Trabajo en grupo.srcs/sources_1/new/MODOS.vhd2default:default2
62default:default2
MODOS_C2default:default2
MODOS2default:default2?
mC:/Users/nacho/Documents/GitHub/Trabajo-SED-VHDL/Trabajo en grupo/Trabajo en grupo.srcs/sources_1/new/top.vhd2default:default2
2372default:default8@Z8-3491h px? 
?
synthesizing module '%s'638*oasys2
MODOS2default:default2?
oC:/Users/nacho/Documents/GitHub/Trabajo-SED-VHDL/Trabajo en grupo/Trabajo en grupo.srcs/sources_1/new/MODOS.vhd2default:default2
292default:default8@Z8-638h px? 
`
%s
*synth2H
4	Parameter speed_width bound to: 4 - type: integer 
2default:defaulth p
x
? 
_
%s
*synth2G
3	Parameter incl_width bound to: 4 - type: integer 
2default:defaulth p
x
? 
e
%s
*synth2M
9	Parameter conversion_speed bound to: 1 - type: integer 
2default:defaulth p
x
? 
d
%s
*synth2L
8	Parameter conversion_incl bound to: 1 - type: integer 
2default:defaulth p
x
? 
Y
%s
*synth2A
-	Parameter max bound to: 15 - type: integer 
2default:defaulth p
x
? 
^
%s
*synth2F
2	Parameter out_width bound to: 4 - type: integer 
2default:defaulth p
x
? 
_
%s
*synth2G
3	Parameter conversion bound to: 1 - type: integer 
2default:defaulth p
x
? 
\
%s
*synth2D
0	Parameter maximo bound to: 15 - type: integer 
2default:defaulth p
x
? 
?
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
	INCREMENT2default:default2?
sC:/Users/nacho/Documents/GitHub/Trabajo-SED-VHDL/Trabajo en grupo/Trabajo en grupo.srcs/sources_1/new/INCREMENT.vhd2default:default2
62default:default2
	velocidad2default:default2
	INCREMENT2default:default2?
oC:/Users/nacho/Documents/GitHub/Trabajo-SED-VHDL/Trabajo en grupo/Trabajo en grupo.srcs/sources_1/new/MODOS.vhd2default:default2
522default:default8@Z8-3491h px? 
?
synthesizing module '%s'638*oasys2-
INCREMENT__parameterized12default:default2?
sC:/Users/nacho/Documents/GitHub/Trabajo-SED-VHDL/Trabajo en grupo/Trabajo en grupo.srcs/sources_1/new/INCREMENT.vhd2default:default2
222default:default8@Z8-638h px? 
^
%s
*synth2F
2	Parameter out_width bound to: 4 - type: integer 
2default:defaulth p
x
? 
_
%s
*synth2G
3	Parameter conversion bound to: 1 - type: integer 
2default:defaulth p
x
? 
\
%s
*synth2D
0	Parameter maximo bound to: 15 - type: integer 
2default:defaulth p
x
? 
?
Esignal '%s' is read in the process but is not in the sensitivity list614*oasys2
ENABLE2default:default2?
sC:/Users/nacho/Documents/GitHub/Trabajo-SED-VHDL/Trabajo en grupo/Trabajo en grupo.srcs/sources_1/new/INCREMENT.vhd2default:default2
252default:default8@Z8-614h px? 
?
%done synthesizing module '%s' (%s#%s)256*oasys2-
INCREMENT__parameterized12default:default2
02default:default2
12default:default2?
sC:/Users/nacho/Documents/GitHub/Trabajo-SED-VHDL/Trabajo en grupo/Trabajo en grupo.srcs/sources_1/new/INCREMENT.vhd2default:default2
222default:default8@Z8-256h px? 
^
%s
*synth2F
2	Parameter out_width bound to: 4 - type: integer 
2default:defaulth p
x
? 
_
%s
*synth2G
3	Parameter conversion bound to: 1 - type: integer 
2default:defaulth p
x
? 
\
%s
*synth2D
0	Parameter maximo bound to: 15 - type: integer 
2default:defaulth p
x
? 
?
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
	INCREMENT2default:default2?
sC:/Users/nacho/Documents/GitHub/Trabajo-SED-VHDL/Trabajo en grupo/Trabajo en grupo.srcs/sources_1/new/INCREMENT.vhd2default:default2
62default:default2
inclinacion2default:default2
	INCREMENT2default:default2?
oC:/Users/nacho/Documents/GitHub/Trabajo-SED-VHDL/Trabajo en grupo/Trabajo en grupo.srcs/sources_1/new/MODOS.vhd2default:default2
672default:default8@Z8-3491h px? 
?
%done synthesizing module '%s' (%s#%s)256*oasys2
MODOS2default:default2
02default:default2
12default:default2?
oC:/Users/nacho/Documents/GitHub/Trabajo-SED-VHDL/Trabajo en grupo/Trabajo en grupo.srcs/sources_1/new/MODOS.vhd2default:default2
292default:default8@Z8-256h px? 
`
%s
*synth2H
4	Parameter speed_width bound to: 4 - type: integer 
2default:defaulth p
x
? 
_
%s
*synth2G
3	Parameter incl_width bound to: 4 - type: integer 
2default:defaulth p
x
? 
`
%s
*synth2H
4	Parameter time_width bound to: 13 - type: integer 
2default:defaulth p
x
? 
[
%s
*synth2C
/	Parameter digits bound to: 8 - type: integer 
2default:defaulth p
x
? 
a
%s
*synth2I
5	Parameter digits_range bound to: 3 - type: integer 
2default:defaulth p
x
? 
?
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
	DISP_CTRL2default:default2?
sC:/Users/nacho/Documents/GitHub/Trabajo-SED-VHDL/Trabajo en grupo/Trabajo en grupo.srcs/sources_1/new/DISP_CRTL.vhd2default:default2
52default:default2
DISP_CTRL_C2default:default2
	DISP_CTRL2default:default2?
mC:/Users/nacho/Documents/GitHub/Trabajo-SED-VHDL/Trabajo en grupo/Trabajo en grupo.srcs/sources_1/new/top.vhd2default:default2
2592default:default8@Z8-3491h px? 
?
synthesizing module '%s'638*oasys2
	DISP_CTRL2default:default2?
sC:/Users/nacho/Documents/GitHub/Trabajo-SED-VHDL/Trabajo en grupo/Trabajo en grupo.srcs/sources_1/new/DISP_CRTL.vhd2default:default2
252default:default8@Z8-638h px? 
`
%s
*synth2H
4	Parameter speed_width bound to: 4 - type: integer 
2default:defaulth p
x
? 
_
%s
*synth2G
3	Parameter incl_width bound to: 4 - type: integer 
2default:defaulth p
x
? 
`
%s
*synth2H
4	Parameter time_width bound to: 13 - type: integer 
2default:defaulth p
x
? 
[
%s
*synth2C
/	Parameter digits bound to: 8 - type: integer 
2default:defaulth p
x
? 
a
%s
*synth2I
5	Parameter digits_range bound to: 3 - type: integer 
2default:defaulth p
x
? 
_
%s
*synth2G
3	Parameter DIVIDE bound to: 10000 - type: integer 
2default:defaulth p
x
? 
?
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
FREQ_DIV2default:default2?
rC:/Users/nacho/Documents/GitHub/Trabajo-SED-VHDL/Trabajo en grupo/Trabajo en grupo.srcs/sources_1/new/FREQ_DIV.vhd2default:default2
52default:default2)
divisor_de_frecuencia2default:default2
FREQ_DIV2default:default2?
sC:/Users/nacho/Documents/GitHub/Trabajo-SED-VHDL/Trabajo en grupo/Trabajo en grupo.srcs/sources_1/new/DISP_CRTL.vhd2default:default2
1062default:default8@Z8-3491h px? 
?
synthesizing module '%s'638*oasys2,
FREQ_DIV__parameterized12default:default2?
rC:/Users/nacho/Documents/GitHub/Trabajo-SED-VHDL/Trabajo en grupo/Trabajo en grupo.srcs/sources_1/new/FREQ_DIV.vhd2default:default2
162default:default8@Z8-638h px? 
_
%s
*synth2G
3	Parameter DIVIDE bound to: 10000 - type: integer 
2default:defaulth p
x
? 
?
%done synthesizing module '%s' (%s#%s)256*oasys2,
FREQ_DIV__parameterized12default:default2
02default:default2
12default:default2?
rC:/Users/nacho/Documents/GitHub/Trabajo-SED-VHDL/Trabajo en grupo/Trabajo en grupo.srcs/sources_1/new/FREQ_DIV.vhd2default:default2
162default:default8@Z8-256h px? 
?
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
DIG_SEL2default:default2?
qC:/Users/nacho/Documents/GitHub/Trabajo-SED-VHDL/Trabajo en grupo/Trabajo en grupo.srcs/sources_1/new/DIG_SEL.vhd2default:default2
62default:default2&
selector_de_digito2default:default2
DIG_SEL2default:default2?
sC:/Users/nacho/Documents/GitHub/Trabajo-SED-VHDL/Trabajo en grupo/Trabajo en grupo.srcs/sources_1/new/DISP_CRTL.vhd2default:default2
1152default:default8@Z8-3491h px? 
?
synthesizing module '%s'638*oasys2
DIG_SEL2default:default2?
qC:/Users/nacho/Documents/GitHub/Trabajo-SED-VHDL/Trabajo en grupo/Trabajo en grupo.srcs/sources_1/new/DIG_SEL.vhd2default:default2
192default:default8@Z8-638h px? 
[
%s
*synth2C
/	Parameter DIGITS bound to: 8 - type: integer 
2default:defaulth p
x
? 
a
%s
*synth2I
5	Parameter DIGITS_RANGE bound to: 3 - type: integer 
2default:defaulth p
x
? 
?
Esignal '%s' is read in the process but is not in the sensitivity list614*oasys2
RESET2default:default2?
qC:/Users/nacho/Documents/GitHub/Trabajo-SED-VHDL/Trabajo en grupo/Trabajo en grupo.srcs/sources_1/new/DIG_SEL.vhd2default:default2
222default:default8@Z8-614h px? 
?
Esignal '%s' is read in the process but is not in the sensitivity list614*oasys2
RESET2default:default2?
qC:/Users/nacho/Documents/GitHub/Trabajo-SED-VHDL/Trabajo en grupo/Trabajo en grupo.srcs/sources_1/new/DIG_SEL.vhd2default:default2
352default:default8@Z8-614h px? 
?
%done synthesizing module '%s' (%s#%s)256*oasys2
DIG_SEL2default:default2
02default:default2
12default:default2?
qC:/Users/nacho/Documents/GitHub/Trabajo-SED-VHDL/Trabajo en grupo/Trabajo en grupo.srcs/sources_1/new/DIG_SEL.vhd2default:default2
192default:default8@Z8-256h px? 
?
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
MUX2default:default2?
mC:/Users/nacho/Documents/GitHub/Trabajo-SED-VHDL/Trabajo en grupo/Trabajo en grupo.srcs/sources_1/new/MUX.vhd2default:default2
52default:default2
multiplexor2default:default2
MUX2default:default2?
sC:/Users/nacho/Documents/GitHub/Trabajo-SED-VHDL/Trabajo en grupo/Trabajo en grupo.srcs/sources_1/new/DISP_CRTL.vhd2default:default2
1222default:default8@Z8-3491h px? 
?
synthesizing module '%s'638*oasys2
MUX2default:default2?
mC:/Users/nacho/Documents/GitHub/Trabajo-SED-VHDL/Trabajo en grupo/Trabajo en grupo.srcs/sources_1/new/MUX.vhd2default:default2
222default:default8@Z8-638h px? 
Z
%s
*synth2B
.	Parameter width bound to: 4 - type: integer 
2default:defaulth p
x
? 
?
default block is never used226*oasys2?
mC:/Users/nacho/Documents/GitHub/Trabajo-SED-VHDL/Trabajo en grupo/Trabajo en grupo.srcs/sources_1/new/MUX.vhd2default:default2
252default:default8@Z8-226h px? 
?
%done synthesizing module '%s' (%s#%s)256*oasys2
MUX2default:default2
02default:default2
12default:default2?
mC:/Users/nacho/Documents/GitHub/Trabajo-SED-VHDL/Trabajo en grupo/Trabajo en grupo.srcs/sources_1/new/MUX.vhd2default:default2
222default:default8@Z8-256h px? 
?
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
DCDR7SEG2default:default2?
rC:/Users/nacho/Documents/GitHub/Trabajo-SED-VHDL/Trabajo en grupo/Trabajo en grupo.srcs/sources_1/new/DCDR7SEG.vhd2default:default2
62default:default2
	decod7seg2default:default2
DCDR7SEG2default:default2?
sC:/Users/nacho/Documents/GitHub/Trabajo-SED-VHDL/Trabajo en grupo/Trabajo en grupo.srcs/sources_1/new/DISP_CRTL.vhd2default:default2
1352default:default8@Z8-3491h px? 
?
synthesizing module '%s'638*oasys2
DCDR7SEG2default:default2?
rC:/Users/nacho/Documents/GitHub/Trabajo-SED-VHDL/Trabajo en grupo/Trabajo en grupo.srcs/sources_1/new/DCDR7SEG.vhd2default:default2
132default:default8@Z8-638h px? 
?
%done synthesizing module '%s' (%s#%s)256*oasys2
DCDR7SEG2default:default2
02default:default2
12default:default2?
rC:/Users/nacho/Documents/GitHub/Trabajo-SED-VHDL/Trabajo en grupo/Trabajo en grupo.srcs/sources_1/new/DCDR7SEG.vhd2default:default2
132default:default8@Z8-256h px? 
?
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
DEC2BCD2default:default2?
qC:/Users/nacho/Documents/GitHub/Trabajo-SED-VHDL/Trabajo en grupo/Trabajo en grupo.srcs/sources_1/new/DEC2BCD.vhd2default:default2
62default:default2(
speed_BCD_conversion2default:default2
DEC2BCD2default:default2?
sC:/Users/nacho/Documents/GitHub/Trabajo-SED-VHDL/Trabajo en grupo/Trabajo en grupo.srcs/sources_1/new/DISP_CRTL.vhd2default:default2
1482default:default8@Z8-3491h px? 
?
synthesizing module '%s'638*oasys2
DEC2BCD2default:default2?
qC:/Users/nacho/Documents/GitHub/Trabajo-SED-VHDL/Trabajo en grupo/Trabajo en grupo.srcs/sources_1/new/DEC2BCD.vhd2default:default2
152default:default8@Z8-638h px? 
?
%done synthesizing module '%s' (%s#%s)256*oasys2
DEC2BCD2default:default2
02default:default2
12default:default2?
qC:/Users/nacho/Documents/GitHub/Trabajo-SED-VHDL/Trabajo en grupo/Trabajo en grupo.srcs/sources_1/new/DEC2BCD.vhd2default:default2
152default:default8@Z8-256h px? 
?
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
DEC2BCD2default:default2?
qC:/Users/nacho/Documents/GitHub/Trabajo-SED-VHDL/Trabajo en grupo/Trabajo en grupo.srcs/sources_1/new/DEC2BCD.vhd2default:default2
62default:default2'
incl_BCD_conversion2default:default2
DEC2BCD2default:default2?
sC:/Users/nacho/Documents/GitHub/Trabajo-SED-VHDL/Trabajo en grupo/Trabajo en grupo.srcs/sources_1/new/DISP_CRTL.vhd2default:default2
1552default:default8@Z8-3491h px? 
a
%s
*synth2I
5	Parameter input_width bound to: 13 - type: integer 
2default:defaulth p
x
? 
?
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
	TIME_CONV2default:default2?
sC:/Users/nacho/Documents/GitHub/Trabajo-SED-VHDL/Trabajo en grupo/Trabajo en grupo.srcs/sources_1/new/TIME_CONV.vhd2default:default2
52default:default2$
conversor_tiempo2default:default2
	TIME_CONV2default:default2?
sC:/Users/nacho/Documents/GitHub/Trabajo-SED-VHDL/Trabajo en grupo/Trabajo en grupo.srcs/sources_1/new/DISP_CRTL.vhd2default:default2
1632default:default8@Z8-3491h px? 
?
synthesizing module '%s'638*oasys2
	TIME_CONV2default:default2?
sC:/Users/nacho/Documents/GitHub/Trabajo-SED-VHDL/Trabajo en grupo/Trabajo en grupo.srcs/sources_1/new/TIME_CONV.vhd2default:default2
172default:default8@Z8-638h px? 
a
%s
*synth2I
5	Parameter input_width bound to: 13 - type: integer 
2default:defaulth p
x
? 
?
%done synthesizing module '%s' (%s#%s)256*oasys2
	TIME_CONV2default:default2
02default:default2
12default:default2?
sC:/Users/nacho/Documents/GitHub/Trabajo-SED-VHDL/Trabajo en grupo/Trabajo en grupo.srcs/sources_1/new/TIME_CONV.vhd2default:default2
172default:default8@Z8-256h px? 
?
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
DEC2BCD2default:default2?
qC:/Users/nacho/Documents/GitHub/Trabajo-SED-VHDL/Trabajo en grupo/Trabajo en grupo.srcs/sources_1/new/DEC2BCD.vhd2default:default2
62default:default2*
minutes_BCD_conversion2default:default2
DEC2BCD2default:default2?
sC:/Users/nacho/Documents/GitHub/Trabajo-SED-VHDL/Trabajo en grupo/Trabajo en grupo.srcs/sources_1/new/DISP_CRTL.vhd2default:default2
1742default:default8@Z8-3491h px? 
?
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
DEC2BCD2default:default2?
qC:/Users/nacho/Documents/GitHub/Trabajo-SED-VHDL/Trabajo en grupo/Trabajo en grupo.srcs/sources_1/new/DEC2BCD.vhd2default:default2
62default:default2*
seconds_BCD_conversion2default:default2
DEC2BCD2default:default2?
sC:/Users/nacho/Documents/GitHub/Trabajo-SED-VHDL/Trabajo en grupo/Trabajo en grupo.srcs/sources_1/new/DISP_CRTL.vhd2default:default2
1812default:default8@Z8-3491h px? 
?
%done synthesizing module '%s' (%s#%s)256*oasys2
	DISP_CTRL2default:default2
02default:default2
12default:default2?
sC:/Users/nacho/Documents/GitHub/Trabajo-SED-VHDL/Trabajo en grupo/Trabajo en grupo.srcs/sources_1/new/DISP_CRTL.vhd2default:default2
252default:default8@Z8-256h px? 
?
%done synthesizing module '%s' (%s#%s)256*oasys2
top2default:default2
02default:default2
12default:default2?
mC:/Users/nacho/Documents/GitHub/Trabajo-SED-VHDL/Trabajo en grupo/Trabajo en grupo.srcs/sources_1/new/top.vhd2default:default2
342default:default8@Z8-256h px? 
?
%s*synth2?
yFinished RTL Elaboration : Time (s): cpu = 00:00:12 ; elapsed = 00:00:13 . Memory (MB): peak = 1302.055 ; gain = 500.535
2default:defaulth px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
M
%s
*synth25
!Start Handling Custom Attributes
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s*synth2?
?Finished Handling Custom Attributes : Time (s): cpu = 00:00:12 ; elapsed = 00:00:13 . Memory (MB): peak = 1302.055 ; gain = 500.535
2default:defaulth px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s*synth2?
?Finished RTL Optimization Phase 1 : Time (s): cpu = 00:00:12 ; elapsed = 00:00:13 . Memory (MB): peak = 1302.055 ; gain = 500.535
2default:defaulth px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2.
Netlist sorting complete. 2default:default2
00:00:002default:default2 
00:00:00.0182default:default2
1302.0552default:default2
0.0002default:defaultZ17-268h px? 
K
)Preparing netlist for logic optimization
349*projectZ1-570h px? 
>

Processing XDC Constraints
244*projectZ1-262h px? 
=
Initializing timing engine
348*projectZ1-569h px? 
?
Parsing XDC File [%s]
179*designutils2]
GC:/Users/nacho/Documents/GitHub/Trabajo-SED-VHDL/Nexys-4-DDR-Master.xdc2default:default8Z20-179h px? 
?
Finished Parsing XDC File [%s]
178*designutils2]
GC:/Users/nacho/Documents/GitHub/Trabajo-SED-VHDL/Nexys-4-DDR-Master.xdc2default:default8Z20-178h px? 
?
?Implementation specific constraints were found while reading constraint file [%s]. These constraints will be ignored for synthesis but will be used in implementation. Impacted constraints are listed in the file [%s].
233*project2[
GC:/Users/nacho/Documents/GitHub/Trabajo-SED-VHDL/Nexys-4-DDR-Master.xdc2default:default2)
.Xil/top_propImpl.xdc2default:defaultZ1-236h px? 
H
&Completed Processing XDC Constraints

245*projectZ1-263h px? 
?
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2.
Netlist sorting complete. 2default:default2
00:00:002default:default2 
00:00:00.0012default:default2
1358.1642default:default2
0.0002default:defaultZ17-268h px? 
~
!Unisim Transformation Summary:
%s111*project29
%No Unisim elements were transformed.
2default:defaultZ1-111h px? 
?
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common24
 Constraint Validation Runtime : 2default:default2
00:00:002default:default2 
00:00:00.0072default:default2
1358.1642default:default2
0.0002default:defaultZ17-268h px? 

VNo compile time benefit to using incremental synthesis; A full resynthesis will be run2353*designutilsZ20-5440h px? 
?
?Flow is switching to default flow due to incremental criteria not met. If you would like to alter this behaviour and have the flow terminate instead, please set the following parameter config_implementation {autoIncr.Synth.RejectBehavior Terminate}2229*designutilsZ20-4379h px? 
?
5undeclared symbol '%s', assumed default net type '%s'7502*oasys2
REGCCE2default:default2
wire2default:default2[
EC:/Xilinx/Vivado/2022.2/data/verilog/src/unimacro/BRAM_SINGLE_MACRO.v2default:default2
21702default:default8@Z8-11241h px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s*synth2?
Finished Constraint Validation : Time (s): cpu = 00:00:25 ; elapsed = 00:00:26 . Memory (MB): peak = 1358.164 ; gain = 556.645
2default:defaulth px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
V
%s
*synth2>
*Start Loading Part and Timing Information
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
K
%s
*synth23
Loading part: xc7a100tcsg324-1
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s*synth2?
?Finished Loading Part and Timing Information : Time (s): cpu = 00:00:25 ; elapsed = 00:00:26 . Memory (MB): peak = 1358.164 ; gain = 556.645
2default:defaulth px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
Z
%s
*synth2B
.Start Applying 'set_property' XDC Constraints
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s*synth2?
?Finished applying 'set_property' XDC Constraints : Time (s): cpu = 00:00:25 ; elapsed = 00:00:26 . Memory (MB): peak = 1358.164 ; gain = 556.645
2default:defaulth px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
3inferred FSM for state register '%s' in module '%s'802*oasys2$
EstadoActual_reg2default:default2
FSM2default:defaultZ8-802h px? 
?
%s
*synth2x
d---------------------------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s
*synth2t
`                   State |                     New Encoding |                Previous Encoding 
2default:defaulth p
x
? 
?
%s
*synth2x
d---------------------------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s
*synth2s
_                  reposo |                          0000001 |                              000
2default:defaulth p
x
? 
?
%s
*synth2s
_                  config |                          0000010 |                              001
2default:defaulth p
x
? 
?
%s
*synth2s
_               config_ok |                          0000100 |                              010
2default:defaulth p
x
? 
?
%s
*synth2s
_                ready_up |                          0001000 |                              011
2default:defaulth p
x
? 
?
%s
*synth2s
_             funciona_up |                          0010000 |                              100
2default:defaulth p
x
? 
?
%s
*synth2s
_              ready_down |                          0100000 |                              101
2default:defaulth p
x
? 
?
%s
*synth2s
_           funciona_down |                          1000000 |                              110
2default:defaulth p
x
? 
?
%s
*synth2x
d---------------------------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
Gencoded FSM with state register '%s' using encoding '%s' in module '%s'3353*oasys2$
EstadoActual_reg2default:default2
one-hot2default:default2
FSM2default:defaultZ8-3354h px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s*synth2?
?Finished RTL Optimization Phase 2 : Time (s): cpu = 00:00:26 ; elapsed = 00:00:27 . Memory (MB): peak = 1358.164 ; gain = 556.645
2default:defaulth px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
L
%s
*synth24
 Start RTL Component Statistics 
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
K
%s
*synth23
Detailed RTL Component Info : 
2default:defaulth p
x
? 
:
%s
*synth2"
+---Adders : 
2default:defaulth p
x
? 
X
%s
*synth2@
,	   2 Input   32 Bit       Adders := 8     
2default:defaulth p
x
? 
X
%s
*synth2@
,	   2 Input   13 Bit       Adders := 2     
2default:defaulth p
x
? 
=
%s
*synth2%
+---Registers : 
2default:defaulth p
x
? 
Z
%s
*synth2B
.	               32 Bit    Registers := 8     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	               13 Bit    Registers := 2     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	                8 Bit    Registers := 1     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	                7 Bit    Registers := 2     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	                4 Bit    Registers := 10    
2default:defaulth p
x
? 
Z
%s
*synth2B
.	                3 Bit    Registers := 5     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	                2 Bit    Registers := 4     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	                1 Bit    Registers := 7     
2default:defaulth p
x
? 
?
%s
*synth2'
+---Multipliers : 
2default:defaulth p
x
? 
X
%s
*synth2@
,	               6x32  Multipliers := 2     
2default:defaulth p
x
? 
9
%s
*synth2!
+---Muxes : 
2default:defaulth p
x
? 
X
%s
*synth2@
,	   2 Input   32 Bit        Muxes := 14    
2default:defaulth p
x
? 
X
%s
*synth2@
,	   2 Input   13 Bit        Muxes := 7     
2default:defaulth p
x
? 
X
%s
*synth2@
,	   7 Input    7 Bit        Muxes := 2     
2default:defaulth p
x
? 
X
%s
*synth2@
,	   2 Input    7 Bit        Muxes := 9     
2default:defaulth p
x
? 
X
%s
*synth2@
,	   2 Input    4 Bit        Muxes := 2     
2default:defaulth p
x
? 
X
%s
*synth2@
,	   2 Input    1 Bit        Muxes := 9     
2default:defaulth p
x
? 
X
%s
*synth2@
,	   7 Input    1 Bit        Muxes := 4     
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
O
%s
*synth27
#Finished RTL Component Statistics 
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
H
%s
*synth20
Start Part Resource Summary
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s
*synth2k
WPart Resources:
DSPs: 240 (col length:80)
BRAMs: 270 (col length: RAMB18 80 RAMB36 40)
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
K
%s
*synth23
Finished Part Resource Summary
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
W
%s
*synth2?
+Start Cross Boundary and Area Optimization
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
H
&Parallel synthesis criteria is not met4829*oasysZ8-7080h px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s*synth2?
?Finished Cross Boundary and Area Optimization : Time (s): cpu = 00:00:37 ; elapsed = 00:00:39 . Memory (MB): peak = 1358.164 ; gain = 556.645
2default:defaulth px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
R
%s
*synth2:
&Start Applying XDC Timing Constraints
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s*synth2?
?Finished Applying XDC Timing Constraints : Time (s): cpu = 00:00:46 ; elapsed = 00:00:47 . Memory (MB): peak = 1358.164 ; gain = 556.645
2default:defaulth px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
F
%s
*synth2.
Start Timing Optimization
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s*synth2?
}Finished Timing Optimization : Time (s): cpu = 00:00:51 ; elapsed = 00:00:52 . Memory (MB): peak = 1389.812 ; gain = 588.293
2default:defaulth px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
E
%s
*synth2-
Start Technology Mapping
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s*synth2?
|Finished Technology Mapping : Time (s): cpu = 00:00:51 ; elapsed = 00:00:53 . Memory (MB): peak = 1389.812 ; gain = 588.293
2default:defaulth px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s
*synth2'
Start IO Insertion
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
Q
%s
*synth29
%Start Flattening Before IO Insertion
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
T
%s
*synth2<
(Finished Flattening Before IO Insertion
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
H
%s
*synth20
Start Final Netlist Cleanup
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
K
%s
*synth23
Finished Final Netlist Cleanup
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s*synth2?
vFinished IO Insertion : Time (s): cpu = 00:00:59 ; elapsed = 00:01:00 . Memory (MB): peak = 1389.812 ; gain = 588.293
2default:defaulth px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
O
%s
*synth27
#Start Renaming Generated Instances
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s*synth2?
?Finished Renaming Generated Instances : Time (s): cpu = 00:00:59 ; elapsed = 00:01:00 . Memory (MB): peak = 1389.812 ; gain = 588.293
2default:defaulth px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
L
%s
*synth24
 Start Rebuilding User Hierarchy
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s*synth2?
?Finished Rebuilding User Hierarchy : Time (s): cpu = 00:00:59 ; elapsed = 00:01:00 . Memory (MB): peak = 1389.812 ; gain = 588.293
2default:defaulth px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
K
%s
*synth23
Start Renaming Generated Ports
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s*synth2?
?Finished Renaming Generated Ports : Time (s): cpu = 00:00:59 ; elapsed = 00:01:00 . Memory (MB): peak = 1389.812 ; gain = 588.293
2default:defaulth px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
M
%s
*synth25
!Start Handling Custom Attributes
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s*synth2?
?Finished Handling Custom Attributes : Time (s): cpu = 00:00:59 ; elapsed = 00:01:00 . Memory (MB): peak = 1389.812 ; gain = 588.293
2default:defaulth px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
J
%s
*synth22
Start Renaming Generated Nets
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s*synth2?
?Finished Renaming Generated Nets : Time (s): cpu = 00:00:59 ; elapsed = 00:01:00 . Memory (MB): peak = 1389.812 ; gain = 588.293
2default:defaulth px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
K
%s
*synth23
Start Writing Synthesis Report
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
A
%s
*synth2)

Report BlackBoxes: 
2default:defaulth p
x
? 
J
%s
*synth22
+-+--------------+----------+
2default:defaulth p
x
? 
J
%s
*synth22
| |BlackBox name |Instances |
2default:defaulth p
x
? 
J
%s
*synth22
+-+--------------+----------+
2default:defaulth p
x
? 
J
%s
*synth22
+-+--------------+----------+
2default:defaulth p
x
? 
A
%s*synth2)

Report Cell Usage: 
2default:defaulth px? 
D
%s*synth2,
+------+-------+------+
2default:defaulth px? 
D
%s*synth2,
|      |Cell   |Count |
2default:defaulth px? 
D
%s*synth2,
+------+-------+------+
2default:defaulth px? 
D
%s*synth2,
|1     |BUFG   |     3|
2default:defaulth px? 
D
%s*synth2,
|2     |CARRY4 |   171|
2default:defaulth px? 
D
%s*synth2,
|3     |LUT1   |    20|
2default:defaulth px? 
D
%s*synth2,
|4     |LUT2   |   297|
2default:defaulth px? 
D
%s*synth2,
|5     |LUT3   |   178|
2default:defaulth px? 
D
%s*synth2,
|6     |LUT4   |   153|
2default:defaulth px? 
D
%s*synth2,
|7     |LUT5   |   393|
2default:defaulth px? 
D
%s*synth2,
|8     |LUT6   |    68|
2default:defaulth px? 
D
%s*synth2,
|9     |MUXF7  |     1|
2default:defaulth px? 
D
%s*synth2,
|10    |FDCE   |   341|
2default:defaulth px? 
D
%s*synth2,
|11    |FDPE   |    24|
2default:defaulth px? 
D
%s*synth2,
|12    |FDRE   |    50|
2default:defaulth px? 
D
%s*synth2,
|13    |LDC    |    12|
2default:defaulth px? 
D
%s*synth2,
|14    |IBUF   |     7|
2default:defaulth px? 
D
%s*synth2,
|15    |OBUF   |    30|
2default:defaulth px? 
D
%s*synth2,
+------+-------+------+
2default:defaulth px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s*synth2?
?Finished Writing Synthesis Report : Time (s): cpu = 00:00:59 ; elapsed = 00:01:00 . Memory (MB): peak = 1389.812 ; gain = 588.293
2default:defaulth px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
r
%s
*synth2Z
FSynthesis finished with 0 errors, 0 critical warnings and 1 warnings.
2default:defaulth p
x
? 
?
%s
*synth2?
Synthesis Optimization Runtime : Time (s): cpu = 00:00:44 ; elapsed = 00:00:57 . Memory (MB): peak = 1389.812 ; gain = 532.184
2default:defaulth p
x
? 
?
%s
*synth2?
?Synthesis Optimization Complete : Time (s): cpu = 00:00:59 ; elapsed = 00:01:01 . Memory (MB): peak = 1389.812 ; gain = 588.293
2default:defaulth p
x
? 
B
 Translating synthesized netlist
350*projectZ1-571h px? 
?
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2.
Netlist sorting complete. 2default:default2
00:00:002default:default2 
00:00:00.0412default:default2
1389.8122default:default2
0.0002default:defaultZ17-268h px? 
g
-Analyzing %s Unisim elements for replacement
17*netlist2
1842default:defaultZ29-17h px? 
j
2Unisim Transformation completed in %s CPU seconds
28*netlist2
02default:defaultZ29-28h px? 
K
)Preparing netlist for logic optimization
349*projectZ1-570h px? 
u
)Pushed %s inverter(s) to %s load pin(s).
98*opt2
02default:default2
02default:defaultZ31-138h px? 
?
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2.
Netlist sorting complete. 2default:default2
00:00:002default:default2
00:00:002default:default2
1389.8122default:default2
0.0002default:defaultZ17-268h px? 
?
!Unisim Transformation Summary:
%s111*project2\
H  A total of 12 instances were transformed.
  LDC => LDCE: 12 instances
2default:defaultZ1-111h px? 
f
$Synth Design complete, checksum: %s
562*	vivadotcl2
8839fd12default:defaultZ4-1430h px? 
U
Releasing license: %s
83*common2
	Synthesis2default:defaultZ17-83h px? 
?
G%s Infos, %s Warnings, %s Critical Warnings and %s Errors encountered.
28*	vivadotcl2
862default:default2
82default:default2
02default:default2
02default:defaultZ4-41h px? 
^
%s completed successfully
29*	vivadotcl2 
synth_design2default:defaultZ4-42h px? 
?
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2"
synth_design: 2default:default2
00:01:062default:default2
00:01:182default:default2
1389.8122default:default2
983.7732default:defaultZ17-268h px? 
?
 The %s '%s' has been generated.
621*common2

checkpoint2default:default2{
gC:/Users/nacho/Documents/GitHub/Trabajo-SED-VHDL/Trabajo en grupo/Trabajo en grupo.runs/synth_1/top.dcp2default:defaultZ17-1381h px? 
?
%s4*runtcl2p
\Executing : report_utilization -file top_utilization_synth.rpt -pb top_utilization_synth.pb
2default:defaulth px? 
?
Exiting %s at %s...
206*common2
Vivado2default:default2,
Fri Dec 16 11:37:09 20222default:defaultZ17-206h px? 


End Record