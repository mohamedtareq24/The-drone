EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L Device:R_Small R1
U 1 1 60A28104
P 4800 4050
F 0 "R1" V 4604 4050 50  0000 C CNN
F 1 "R_Small" V 4695 4050 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P5.08mm_Horizontal" H 4800 4050 50  0001 C CNN
F 3 "~" H 4800 4050 50  0001 C CNN
	1    4800 4050
	0    -1   1    0   
$EndComp
$Comp
L Transistor_BJT:TIP122 Q1
U 1 1 60A2810A
P 4450 4050
F 0 "Q1" H 4657 4004 50  0000 L CNN
F 1 "TIP122" H 4657 4095 50  0000 L CNN
F 2 "Package_TO_SOT_THT:TO-220-3_Vertical" H 4650 3975 50  0001 L CIN
F 3 "https://www.onsemi.com/pub/Collateral/TIP120-D.PDF" H 4450 4050 50  0001 L CNN
	1    4450 4050
	-1   0    0    1   
$EndComp
$Comp
L Device:R_Small R3
U 1 1 60A4007C
P 6650 4100
F 0 "R3" V 6650 4100 50  0000 C CNN
F 1 "R_Small" V 6545 4100 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P5.08mm_Horizontal" H 6650 4100 50  0001 C CNN
F 3 "~" H 6650 4100 50  0001 C CNN
	1    6650 4100
	0    1    1    0   
$EndComp
$Comp
L Device:R_Small R4
U 1 1 60A4008D
P 6500 1950
F 0 "R4" V 6304 1950 50  0000 C CNN
F 1 "R_Small" V 6395 1950 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P5.08mm_Horizontal" H 6500 1950 50  0001 C CNN
F 3 "~" H 6500 1950 50  0001 C CNN
	1    6500 1950
	0    1    -1   0   
$EndComp
$Comp
L Transistor_BJT:TIP122 Q4
U 1 1 60A40093
P 6950 1950
F 0 "Q4" H 7157 1904 50  0000 L CNN
F 1 "TIP122" H 7157 1995 50  0000 L CNN
F 2 "Package_TO_SOT_THT:TO-220-3_Vertical" H 7150 1875 50  0001 L CIN
F 3 "https://www.onsemi.com/pub/Collateral/TIP120-D.PDF" H 6950 1950 50  0001 L CNN
	1    6950 1950
	1    0    0    -1  
$EndComp
Wire Wire Line
	6750 1950 6600 1950
Wire Wire Line
	7050 1750 7300 1750
Wire Wire Line
	7700 4300 7050 4300
$Comp
L Transistor_BJT:TIP122 Q2
U 1 1 60AB24D2
P 4450 1950
F 0 "Q2" H 4657 1904 50  0000 L CNN
F 1 "TIP122" H 4657 1995 50  0000 L CNN
F 2 "Package_TO_SOT_THT:TO-220-3_Vertical" H 4650 1875 50  0001 L CIN
F 3 "https://www.onsemi.com/pub/Collateral/TIP120-D.PDF" H 4450 1950 50  0001 L CNN
	1    4450 1950
	-1   0    0    -1  
$EndComp
Wire Wire Line
	4350 1750 4100 1750
Wire Wire Line
	4700 4050 4650 4050
Wire Wire Line
	4050 4300 4350 4300
Wire Wire Line
	4350 4300 4350 4250
Wire Wire Line
	7300 1750 7300 1700
$Comp
L Connector:Conn_01x02_Female J11
U 1 1 60B3308D
P 7500 1600
F 0 "J11" V 7346 1648 50  0000 L CNN
F 1 "Conn_01x02_Female" V 7437 1648 50  0000 L CNN
F 2 "Connector_PinSocket_1.00mm:PinSocket_1x02_P1.00mm_Vertical" H 7500 1600 50  0001 C CNN
F 3 "~" H 7500 1600 50  0001 C CNN
	1    7500 1600
	1    0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x02_Female J2
U 1 1 60B332D5
P 3900 1750
F 0 "J2" H 3792 1425 50  0000 C CNN
F 1 "Conn_01x02_Female" H 3792 1516 50  0000 C CNN
F 2 "Connector_PinSocket_1.00mm:PinSocket_1x02_P1.00mm_Vertical" H 3900 1750 50  0001 C CNN
F 3 "~" H 3900 1750 50  0001 C CNN
	1    3900 1750
	-1   0    0    1   
$EndComp
$Comp
L Connector:Conn_01x02_Female J1
U 1 1 60B33954
P 3850 4400
F 0 "J1" H 3742 4075 50  0000 C CNN
F 1 "Conn_01x02_Female" H 3742 4166 50  0000 C CNN
F 2 "Connector_PinSocket_1.00mm:PinSocket_1x02_P1.00mm_Vertical" H 3850 4400 50  0001 C CNN
F 3 "~" H 3850 4400 50  0001 C CNN
	1    3850 4400
	-1   0    0    1   
$EndComp
$Comp
L Connector:Conn_01x02_Female J12
U 1 1 60B33F26
P 7900 4300
F 0 "J12" H 7928 4276 50  0000 L CNN
F 1 "Conn_01x02_Female" H 7928 4185 50  0000 L CNN
F 2 "Connector_PinSocket_1.00mm:PinSocket_1x02_P1.00mm_Vertical" H 7900 4300 50  0001 C CNN
F 3 "~" H 7900 4300 50  0001 C CNN
	1    7900 4300
	1    0    0    -1  
$EndComp
Wire Wire Line
	7300 1600 7300 1650
$Comp
L Connector:Conn_01x01_Female J8
U 1 1 60B3B5AB
P 6400 2150
F 0 "J8" V 6246 2198 50  0000 L CNN
F 1 "Conn_01x01_Female" V 6337 2198 50  0000 L CNN
F 2 "Connector_PinHeader_1.00mm:PinHeader_1x01_P1.00mm_Vertical" H 6400 2150 50  0001 C CNN
F 3 "~" H 6400 2150 50  0001 C CNN
	1    6400 2150
	0    1    1    0   
$EndComp
$Comp
L Connector:Conn_01x01_Female J9
U 1 1 60B3B896
P 6550 3900
F 0 "J9" V 6488 3812 50  0000 R CNN
F 1 "Conn_01x01_Female" V 6700 4300 50  0000 R CNN
F 2 "Connector_PinHeader_1.00mm:PinHeader_1x01_P1.00mm_Vertical" H 6550 3900 50  0001 C CNN
F 3 "~" H 6550 3900 50  0001 C CNN
	1    6550 3900
	0    -1   -1   0   
$EndComp
$Comp
L Connector:Conn_01x01_Female J4
U 1 1 60B3C0C2
P 4900 3850
F 0 "J4" V 4838 3762 50  0000 R CNN
F 1 "Conn_01x01_Female" V 4747 3762 50  0000 R CNN
F 2 "Connector_PinHeader_1.00mm:PinHeader_1x01_P1.00mm_Vertical" H 4900 3850 50  0001 C CNN
F 3 "~" H 4900 3850 50  0001 C CNN
	1    4900 3850
	0    -1   -1   0   
$EndComp
Wire Wire Line
	4100 1650 5800 1650
Wire Wire Line
	4050 4400 5650 4400
$Comp
L Connector:Conn_01x01_Female J6
U 1 1 60B3CBDF
P 5650 4600
F 0 "J6" V 5496 4648 50  0000 L CNN
F 1 "Conn_01x01_Female" V 5587 4648 50  0000 L CNN
F 2 "Connector_PinHeader_1.00mm:PinHeader_1x01_P1.00mm_Vertical" H 5650 4600 50  0001 C CNN
F 3 "~" H 5650 4600 50  0001 C CNN
	1    5650 4600
	0    1    1    0   
$EndComp
Connection ~ 5650 4400
Wire Wire Line
	5650 4400 7700 4400
$Comp
L Connector:Conn_01x01_Female J7
U 1 1 60B3D505
P 5800 1450
F 0 "J7" V 5738 1362 50  0000 R CNN
F 1 "Conn_01x01_Female" V 5647 1362 50  0000 R CNN
F 2 "Connector_PinHeader_1.00mm:PinHeader_1x01_P1.00mm_Vertical" H 5800 1450 50  0001 C CNN
F 3 "~" H 5800 1450 50  0001 C CNN
	1    5800 1450
	0    -1   -1   0   
$EndComp
Connection ~ 5800 1650
Wire Wire Line
	5800 1650 7300 1650
Wire Wire Line
	7050 2150 7050 2350
Wire Wire Line
	4350 2150 4350 2950
$Comp
L Connector:Conn_01x01_Female J10
U 1 1 60B3E6AF
P 7250 3000
F 0 "J10" H 7278 3026 50  0000 L CNN
F 1 "Conn_01x01_Female" H 7278 2935 50  0000 L CNN
F 2 "Connector_PinHeader_1.00mm:PinHeader_1x01_P1.00mm_Vertical" H 7250 3000 50  0001 C CNN
F 3 "~" H 7250 3000 50  0001 C CNN
	1    7250 3000
	1    0    0    -1  
$EndComp
Connection ~ 7050 3000
Wire Wire Line
	7050 3000 7050 3900
$Comp
L Connector:Conn_01x01_Female J3
U 1 1 60B3EDE6
P 4150 2950
F 0 "J3" H 4042 2725 50  0000 C CNN
F 1 "Conn_01x01_Female" H 4042 2816 50  0000 C CNN
F 2 "Connector_PinHeader_1.00mm:PinHeader_1x01_P1.00mm_Vertical" H 4150 2950 50  0001 C CNN
F 3 "~" H 4150 2950 50  0001 C CNN
	1    4150 2950
	-1   0    0    1   
$EndComp
Connection ~ 4350 2950
Wire Wire Line
	4350 2950 4350 3850
$Comp
L Mechanical:MountingHole H1
U 1 1 60C47A96
P 5750 2800
F 0 "H1" H 5850 2846 50  0000 L CNN
F 1 "MountingHole" H 5850 2755 50  0000 L CNN
F 2 "MountingHole:MountingHole_2.5mm" H 5750 2800 50  0001 C CNN
F 3 "~" H 5750 2800 50  0001 C CNN
	1    5750 2800
	1    0    0    -1  
$EndComp
$Comp
L Mechanical:MountingHole H2
U 1 1 60C47CCF
P 5750 3100
F 0 "H2" H 5850 3146 50  0000 L CNN
F 1 "MountingHole" H 5850 3055 50  0000 L CNN
F 2 "MountingHole:MountingHole_2.5mm" H 5750 3100 50  0001 C CNN
F 3 "~" H 5750 3100 50  0001 C CNN
	1    5750 3100
	1    0    0    -1  
$EndComp
$Comp
L Transistor_BJT:TIP122 Q3
U 1 1 60A40082
P 6950 4100
F 0 "Q3" H 7157 4146 50  0000 L CNN
F 1 "TIP122" H 7157 4055 50  0000 L CNN
F 2 "Package_TO_SOT_THT:TO-220-3_Vertical" H 7150 4025 50  0001 L CIN
F 3 "https://www.onsemi.com/pub/Collateral/TIP120-D.PDF" H 6950 4100 50  0001 L CNN
	1    6950 4100
	1    0    0    1   
$EndComp
Wire Wire Line
	4350 2950 7050 2950
Wire Wire Line
	7050 2950 7050 3000
Connection ~ 7050 2950
$Comp
L Connector:Conn_01x01_Female J13
U 1 1 60AAEB86
P 7250 2350
F 0 "J13" H 7278 2376 50  0000 L CNN
F 1 "Conn_01x01_Female" H 7278 2285 50  0000 L CNN
F 2 "Connector_PinHeader_1.00mm:PinHeader_1x01_P1.00mm_Vertical" H 7250 2350 50  0001 C CNN
F 3 "~" H 7250 2350 50  0001 C CNN
	1    7250 2350
	1    0    0    -1  
$EndComp
Connection ~ 7050 2350
Wire Wire Line
	7050 2350 7050 2950
$Comp
L Device:R_Small R2
U 1 1 60ABF936
P 4750 1950
F 0 "R2" V 4554 1950 50  0000 C CNN
F 1 "R_Small" V 4645 1950 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P5.08mm_Horizontal" H 4750 1950 50  0001 C CNN
F 3 "~" H 4750 1950 50  0001 C CNN
	1    4750 1950
	0    1    -1   0   
$EndComp
$Comp
L Connector:Conn_01x01_Female J5
U 1 1 60ABFE1F
P 4850 2150
F 0 "J5" V 4696 2198 50  0000 L CNN
F 1 "Conn_01x01_Female" V 4787 2198 50  0000 L CNN
F 2 "Connector_PinHeader_1.00mm:PinHeader_1x01_P1.00mm_Vertical" H 4850 2150 50  0001 C CNN
F 3 "~" H 4850 2150 50  0001 C CNN
	1    4850 2150
	0    1    1    0   
$EndComp
$EndSCHEMATC
