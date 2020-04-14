% Jacob Eisenbarth, Marach
% This script will be used to run multiple different PowerWorld cases within
% Matlab. The system for this script is for a PMU located at the CHJ PH1
% bus which has a total of 4 generator connected downsteam to it.

%% Initialize Matlab
clc,clear all, format longG,format compact
% close all
tic

%% Establish a connection with PowerWorld / SimAuto
disp('>> Connecting to PowerWorld Simulator / SimAuto...')
SimAuto= actxserver('pwrworld.SimulatorAuto');
disp('Connection established')

%% Gen Data to be Entered into dyd File
%Generator 1 Bus 44141 CHJ 01202 ID 01
%Model gentpj
gentpj(1,1)=8; %Tpdo
gentpj(1,2)=0.035; %Tppdo
gentpj(1,3)=0; %Tpqo
gentpj(1,4)=0.025; %Tppqo
gentpj(1,5)=2.27; %H
% gentpj(1,5)=2.16657866589616; %H
gentpj(1,6)=0; %D
gentpj(1,7)=1.245; %Ld
gentpj(1,8)=0.9; %Lq %Avoid fitting because when Tpqo=0 Lq must = Lpq
gentpj(1,9)=0.42; %Lpd
gentpj(1,10)=0.9; %Lpq %Avoid fitting because when Tpqo=0 Lq must = Lpq
gentpj(1,11)=0.31; %Lppd
gentpj(1,12)=0.31; %Lppq
gentpj(1,13)=0.22; %Ll
gentpj(1,14)=0.23; %S1
gentpj(1,15)=0.62; %S12
gentpj(1,16)=0.0031; %Ra
gentpj(1,17)=0; %Rcomp
gentpj(1,18)=-0.05; %Xcomp
gentpj(1,19)=0.5; %accel
gentpj(1,20)=0.1; %Kis

%Model exst1
% exst1(1,1)=0.012; %Tr
exst1(1,1)=4*1/300; %Tr %Changed because smaller than 4 * Ts
exst1(1,2)=0.2; %Vimax
exst1(1,3)=-0.2; %Vimin
exst1(1,4)=1.15; %Tc
exst1(1,5)=2.5; %Tb
exst1(1,6)=141; %Ka
exst1(1,7)=0; %Ta
exst1(1,8)=4.96; %Vrmax
exst1(1,9)=0; %Vrmin
exst1(1,10)=0.06; %Kc
exst1(1,11)=0; %Kf
exst1(1,12)=0; %Tf
exst1(1,13)=0; %Tc1
exst1(1,14)=0; %Tb1
exst1(1,15)=99; %Vamax
exst1(1,16)=-99; %Vamin
exst1(1,17)=0; %Xe
exst1(1,18)=99; %Ilr
exst1(1,19)=0; %Klr

%Model wsccst
wsccst(1,1)=3; %J
wsccst(1,2)=0; %Kqv
wsccst(1,3)=0; %Tqv
wsccst(1,4)=6; %Kqs
wsccst(1,5)=0.05; %Tqs
wsccst(1,6)=27; %Tq
wsccst(1,7)=0; %Tq1
wsccst(1,8)=0; %Tpq1
wsccst(1,9)=0.033; %Tq2
wsccst(1,10)=0.208; %Tpq2
wsccst(1,11)=0.033; %Tq3
wsccst(1,12)=0.208; %Tpq3
wsccst(1,13)=0.07; %Vsmax
wsccst(1,14)=0; %Vcutoff
wsccst(1,15)=-0.07; %Vslow
wsccst(1,16)=0; %T1
wsccst(1,17)=0; %T2
wsccst(1,18)=0; %T3
wsccst(1,19)=0; %Kboost
wsccst(1,20)=0; %Dw1
wsccst(1,21)=0; %Dw2
wsccst(1,22)=0; %Ddwt
wsccst(1,23)=99; %Tdelay
wsccst(1,24)=0; %T4
wsccst(1,25)=0; %Sw1
wsccst(1,26)=0; %Td1
wsccst(1,27)=0; %Td2
wsccst(1,28)=0; %Vtl
wsccst(1,29)=0; %Vk

%Model hyg3
hyg3(1,1)=1; %Pmax
hyg3(1,2)=0; %Pmin
hyg3(1,3)=1; %Cflag
hyg3(1,4)=0; %Rgate
hyg3(1,5)=0.05; %Relec
hyg3(1,6)=0.02; %Td
hyg3(1,7)=0.1; %Tf
hyg3(1,8)=0.2; %Tp
hyg3(1,9)=0.2; %Velop
hyg3(1,10)=-0.2; %Velcl
hyg3(1,11)=0; %K1
hyg3(1,12)=2; %K2
hyg3(1,13)=0.5; %Ki
hyg3(1,14)=1; %Kg
hyg3(1,15)=0.85; %Tt
hyg3(1,16)=0; %db1
hyg3(1,17)=0; %eps
hyg3(1,18)=0; %db2
hyg3(1,19)=1.4; %Tw
hyg3(1,20)=1; %At
hyg3(1,21)=0; %Dturb
hyg3(1,22)=0; %qnl
hyg3(1,23)=1; %H0
hyg3(1,24)=0.12; %Gv1
hyg3(1,25)=0; %Pgv1
hyg3(1,26)=0.62; %Gv2
hyg3(1,27)=0.702; %Pgv2
hyg3(1,28)=0.72; %Gv3
hyg3(1,29)=0.81; %Pgv3
hyg3(1,30)=0.8; %Gv4
hyg3(1,31)=0.881; %Pgv4
hyg3(1,32)=0.92; %Gv5
hyg3(1,33)=0.964; %Pgv5
hyg3(1,34)=1; %Gv6
hyg3(1,35)=1; %Pgv6

%Generator 2 Bus 44141 CHJ 01202 ID 02
%Model gentpj
gentpj(2,1)=8; %Tpdo
gentpj(2,2)=0.035; %Tppdo
gentpj(2,3)=0; %Tpqo
gentpj(2,4)=0.025; %Tppqo
gentpj(2,5)=2.27; %H
gentpj(2,6)=0; %D
gentpj(2,7)=1.245; %Ld
gentpj(2,8)=0.9; %Lq %Avoid fitting because when Tpqo=0 Lq must = Lpq
gentpj(2,9)=0.42; %Lpd
gentpj(2,10)=0.9; %Lpq %Avoid fitting because when Tpqo=0 Lq must = Lpq
gentpj(2,11)=0.31; %Lppd
gentpj(2,12)=0.31; %Lppq
gentpj(2,13)=0.22; %Ll
gentpj(2,14)=0.23; %S1
gentpj(2,15)=0.62; %S12
gentpj(2,16)=0.0031; %Ra
gentpj(2,17)=0; %Rcomp
gentpj(2,18)=-0.05; %Xcomp
gentpj(2,19)=0.5; %accel
gentpj(2,20)=0.1; %Kis

%Model exst1
% exst1(2,1)=0.012; %Tr
exst1(2,1)=4*1/300; %Tr %Changed because smaller than 4 * Ts
exst1(2,2)=0.2; %Vimax
exst1(2,3)=-0.2; %Vimin
exst1(2,4)=1.15; %Tc
exst1(2,5)=2.5; %Tb
exst1(2,6)=141; %Ka
exst1(2,7)=0; %Ta
exst1(2,8)=4.96; %Vrmax
exst1(2,9)=0; %Vrmin
exst1(2,10)=0.06; %Kc
exst1(2,11)=0; %Kf
exst1(2,12)=0; %Tf
exst1(2,13)=0; %Tc1
exst1(2,14)=0; %Tb1
exst1(2,15)=99; %Vamax
exst1(2,16)=-99; %Vamin
exst1(2,17)=0; %Xe
exst1(2,18)=99; %Ilr
exst1(2,19)=0; %Klr

%Model wsccst
wsccst(2,1)=3; %J
wsccst(2,2)=0; %Kqv
wsccst(2,3)=0; %Tqv
wsccst(2,4)=6; %Kqs
wsccst(2,5)=0.05; %Tqs
wsccst(2,6)=27; %Tq
wsccst(2,7)=0; %Tq1
wsccst(2,8)=0; %Tpq1
wsccst(2,9)=0.033; %Tq2
wsccst(2,10)=0.208; %Tpq2
wsccst(2,11)=0.033; %Tq3
wsccst(2,12)=0.208; %Tpq3
wsccst(2,13)=0.07; %Vsmax
wsccst(2,14)=0; %Vcutoff
wsccst(2,15)=-0.07; %Vslow
wsccst(2,16)=0; %T1
wsccst(2,17)=0; %T2
wsccst(2,18)=0; %T3
wsccst(2,19)=0; %Kboost
wsccst(2,20)=0; %Dw1
wsccst(2,21)=0; %Dw2
wsccst(2,22)=0; %Ddwt
wsccst(2,23)=99; %Tdelay
wsccst(2,24)=0; %T4
wsccst(2,25)=0; %Sw1
wsccst(2,26)=0; %Td1
wsccst(2,27)=0; %Td2
wsccst(2,28)=0; %Vtl
wsccst(2,29)=0; %Vk

%Model hyg3
hyg3(2,1)=1; %Pmax
hyg3(2,2)=0; %Pmin
hyg3(2,3)=1; %Cflag
hyg3(2,4)=0; %Rgate
hyg3(2,5)=0.048; %Relec
hyg3(2,6)=0.02; %Td
hyg3(2,7)=0.1; %Tf
hyg3(2,8)=0.2; %Tp
hyg3(2,9)=0.2; %Velop
hyg3(2,10)=-0.2; %Velcl
hyg3(2,11)=0; %K1
hyg3(2,12)=2; %K2
hyg3(2,13)=0.5; %Ki
hyg3(2,14)=1; %Kg
hyg3(2,15)=0.85; %Tt
hyg3(2,16)=0; %db1
hyg3(2,17)=0; %eps
hyg3(2,18)=0; %db2
hyg3(2,19)=1.4; %Tw
hyg3(2,20)=1; %At
hyg3(2,21)=0; %Dturb
hyg3(2,22)=0; %qnl
hyg3(2,23)=1; %H0
hyg3(2,24)=0.12; %Gv1
hyg3(2,25)=0; %Pgv1
hyg3(2,26)=0.62; %Gv2
hyg3(2,27)=0.702; %Pgv2
hyg3(2,28)=0.72; %Gv3
hyg3(2,29)=0.81; %Pgv3
hyg3(2,30)=0.8; %Gv4
hyg3(2,31)=0.881; %Pgv4
hyg3(2,32)=0.92; %Gv5
hyg3(2,33)=0.964; %Pgv5
hyg3(2,34)=1; %Gv6
hyg3(2,35)=1; %Pgv6

%Generator 3 Bus 44142 CHJ 0304 ID 03
%Model gentpj
gentpj(3,1)=8; %Tpdo
gentpj(3,2)=0.035; %Tppdo
gentpj(3,3)=0; %Tpqo
gentpj(3,4)=0.025; %Tppqo
gentpj(3,5)=2.27; %H
% gentpj(3,5)=2.16648545328398; %H
gentpj(3,6)=0; %D
gentpj(3,7)=1.245; %Ld
gentpj(3,8)=0.9; %Lq %Avoid fitting because when Tpqo=0 Lq must = Lpq
gentpj(3,9)=0.42; %Lpd
gentpj(3,10)=0.9; %Lpq %Avoid fitting because when Tpqo=0 Lq must = Lpq
gentpj(3,11)=0.31; %Lppd
gentpj(3,12)=0.31; %Lppq
gentpj(3,13)=0.22; %Ll
gentpj(3,14)=0.23; %S1
gentpj(3,15)=0.62; %S12
gentpj(3,16)=0.0031; %Ra
gentpj(3,17)=0; %Rcomp
gentpj(3,18)=-0.05; %Xcomp
gentpj(3,19)=0.5; %accel
gentpj(3,20)=0.1; %Kis

%Model exst1
% exst1(3,1)=0.012; %Tr
exst1(3,1)=4*1/300; %Tr %Changed because smaller than 4 * Ts
exst1(3,2)=0.2; %Vimax
exst1(3,3)=-0.2; %Vimin
exst1(3,4)=1.15; %Tc
exst1(3,5)=2.5; %Tb
exst1(3,6)=141; %Ka
exst1(3,7)=0; %Ta
exst1(3,8)=4.96; %Vrmax
exst1(3,9)=0; %Vrmin
exst1(3,10)=0.06; %Kc
exst1(3,11)=0; %Kf
exst1(3,12)=0; %Tf
exst1(3,13)=0; %Tc1
exst1(3,14)=0; %Tb1
exst1(3,15)=99; %Vamax
exst1(3,16)=-99; %Vamin
exst1(3,17)=0; %Xe
exst1(3,18)=99; %Ilr
exst1(3,19)=0; %Klr

%Model wsccst
wsccst(3,1)=3; %J
wsccst(3,2)=0; %Kqv
wsccst(3,3)=0; %Tqv
wsccst(3,4)=6; %Kqs
wsccst(3,5)=0.05; %Tqs
wsccst(3,6)=27; %Tq
wsccst(3,7)=0; %Tq1
wsccst(3,8)=0; %Tpq1
wsccst(3,9)=0.033; %Tq2
wsccst(3,10)=0.208; %Tpq2
wsccst(3,11)=0.033; %Tq3
wsccst(3,12)=0.208; %Tpq3
wsccst(3,13)=0.07; %Vsmax
wsccst(3,14)=0; %Vcutoff
wsccst(3,15)=-0.07; %Vslow
wsccst(3,16)=0; %T1
wsccst(3,17)=0; %T2
wsccst(3,18)=0; %T3
wsccst(3,19)=0; %Kboost
wsccst(3,20)=0; %Dw1
wsccst(3,21)=0; %Dw2
wsccst(3,22)=0; %Ddwt
wsccst(3,23)=99; %Tdelay
wsccst(3,24)=0; %T4
wsccst(3,25)=0; %Sw1
wsccst(3,26)=0; %Td1
wsccst(3,27)=0; %Td2
wsccst(3,28)=0; %Vtl
wsccst(3,29)=0; %Vk

%Model hyg3
hyg3(3,1)=1; %Pmax
hyg3(3,2)=0; %Pmin
hyg3(3,3)=1; %Cflag
hyg3(3,4)=0; %Rgate
hyg3(3,5)=0.052; %Relec
hyg3(3,6)=0.02; %Td
hyg3(3,7)=0.1; %Tf
hyg3(3,8)=0.2; %Tp
hyg3(3,9)=0.2; %Velop
hyg3(3,10)=-0.2; %Velcl
hyg3(3,11)=0; %K1
hyg3(3,12)=2; %K2
hyg3(3,13)=0.5; %Ki
hyg3(3,14)=1; %Kg
hyg3(3,15)=0.85; %Tt
hyg3(3,16)=0; %db1
hyg3(3,17)=0; %eps
hyg3(3,18)=0; %db2
hyg3(3,19)=1.4; %Tw
hyg3(3,20)=1; %At
hyg3(3,21)=0; %Dturb
hyg3(3,22)=0; %qnl
hyg3(3,23)=1; %H0
hyg3(3,24)=0.12; %Gv1
hyg3(3,25)=0; %Pgv1
hyg3(3,26)=0.62; %Gv2
hyg3(3,27)=0.702; %Pgv2
hyg3(3,28)=0.72; %Gv3
hyg3(3,29)=0.81; %Pgv3
hyg3(3,30)=0.8; %Gv4
hyg3(3,31)=0.881; %Pgv4
hyg3(3,32)=0.92; %Gv5
hyg3(3,33)=0.964; %Pgv5
hyg3(3,34)=1; %Gv6
hyg3(3,35)=1; %Pgv6

%Generator 4 Bus 44142 CHJ 0304 ID 04
%Model gentpj
gentpj(4,1)=8; %Tpdo
gentpj(4,2)=0.035; %Tppdo
gentpj(4,3)=0; %Tpqo
gentpj(4,4)=0.025; %Tppqo
gentpj(4,5)=2.27; %H
gentpj(4,6)=0; %D
gentpj(4,7)=1.245; %Ld
gentpj(4,8)=0.9; %Lq %Avoid fitting because when Tpqo=0 Lq must = Lpq
gentpj(4,9)=0.42; %Lpd
gentpj(4,10)=0.9; %Lpq %Avoid fitting because when Tpqo=0 Lq must = Lpq
gentpj(4,11)=0.31; %Lppd
gentpj(4,12)=0.31; %Lppq
gentpj(4,13)=0.22; %Ll
gentpj(4,14)=0.23; %S1
gentpj(4,15)=0.62; %S12
gentpj(4,16)=0.0031; %Ra
gentpj(4,17)=0; %Rcomp
gentpj(4,18)=-0.05; %Xcomp
gentpj(4,19)=0.5; %accel
gentpj(4,20)=0.1; %Kis

%Model exst1
% exst1(4,1)=0.012; %Tr
exst1(4,1)=4*1/300; %Tr %Changed because smaller than 4 * Ts
exst1(4,2)=0.2; %Vimax
exst1(4,3)=-0.2; %Vimin
exst1(4,4)=1.15; %Tc
exst1(4,5)=2.5; %Tb
exst1(4,6)=141; %Ka
exst1(4,7)=0; %Ta
exst1(4,8)=4.96; %Vrmax
exst1(4,9)=0; %Vrmin
exst1(4,10)=0.06; %Kc
exst1(4,11)=0; %Kf
exst1(4,12)=0; %Tf
exst1(4,13)=0; %Tc1
exst1(4,14)=0; %Tb1
exst1(4,15)=99; %Vamax
exst1(4,16)=-99; %Vamin
exst1(4,17)=0; %Xe
exst1(4,18)=99; %Ilr
exst1(4,19)=0; %Klr

%Model wsccst
wsccst(4,1)=3; %J
wsccst(4,2)=0; %Kqv
wsccst(4,3)=0; %Tqv
wsccst(4,4)=6; %Kqs
wsccst(4,5)=0.05; %Tqs
wsccst(4,6)=27; %Tq
wsccst(4,7)=0; %Tq1
wsccst(4,8)=0; %Tpq1
wsccst(4,9)=0.033; %Tq2
wsccst(4,10)=0.208; %Tpq2
wsccst(4,11)=0.033; %Tq3
wsccst(4,12)=0.208; %Tpq3
wsccst(4,13)=0.07; %Vsmax
wsccst(4,14)=0; %Vcutoff
wsccst(4,15)=-0.07; %Vslow
wsccst(4,16)=0; %T1
wsccst(4,17)=0; %T2
wsccst(4,18)=0; %T3
wsccst(4,19)=0; %Kboost
wsccst(4,20)=0; %Dw1
wsccst(4,21)=0; %Dw2
wsccst(4,22)=0; %Ddwt
wsccst(4,23)=99; %Tdelay
wsccst(4,24)=0; %T4
wsccst(4,25)=0; %Sw1
wsccst(4,26)=0; %Td1
wsccst(4,27)=0; %Td2
wsccst(4,28)=0; %Vtl
wsccst(4,29)=0; %Vk

%Model hyg3
hyg3(4,1)=1; %Pmax
hyg3(4,2)=0; %Pmin
hyg3(4,3)=1; %Cflag
hyg3(4,4)=0; %Rgate
hyg3(4,5)=0.052; %Relec
hyg3(4,6)=0.02; %Td
hyg3(4,7)=0.1; %Tf
hyg3(4,8)=0.2; %Tp
hyg3(4,9)=0.2; %Velop
hyg3(4,10)=-0.2; %Velcl
hyg3(4,11)=0; %K1
hyg3(4,12)=2; %K2
hyg3(4,13)=0.5; %Ki
hyg3(4,14)=1; %Kg
hyg3(4,15)=0.85; %Tt
hyg3(4,16)=0; %db1
hyg3(4,17)=0; %eps
hyg3(4,18)=0; %db2
hyg3(4,19)=1.4; %Tw
hyg3(4,20)=1; %At
hyg3(4,21)=0; %Dturb
hyg3(4,22)=0; %qnl
hyg3(4,23)=1; %H0
hyg3(4,24)=0.12; %Gv1
hyg3(4,25)=0; %Pgv1
hyg3(4,26)=0.62; %Gv2
hyg3(4,27)=0.702; %Pgv2
hyg3(4,28)=0.72; %Gv3
hyg3(4,29)=0.81; %Pgv3
hyg3(4,30)=0.8; %Gv4
hyg3(4,31)=0.881; %Pgv4
hyg3(4,32)=0.92; %Gv5
hyg3(4,33)=0.964; %Pgv5
hyg3(4,34)=1; %Gv6
hyg3(4,35)=1; %Pgv6

index_gentpj=[1,2,4,5,7,9,11:16,18,20];      %Index for numerical parameters to edit
index_exst1=[1:6,8,10,15,16,18];             %Index for numerical parameters to edit
index_wsccst=[4:6,9:13,15,23];               %Index for numerical parameters to edit
index_hyg3=[1,5:10,12:15,19,20,23,24,26:35]; %Index for numerical parameters to edit
GensOnList=[1,3];   %Which of the 4 generator are on? [1,2,3,4]

%% XFMR Data to be Entered into .pwb File
%XFMR 1 CHJ PH1 to CHJ TX1
XFMR1(1)=.00001; %R
XFMR1(2)=.00023; %X
XFMR1(3)=0.001590; %Mag Conducatnce
XFMR1(4)=-0.005850; %Mag Susceptance
%Tap ratio 1.00000

%XFMR 2 CHJ TX1 to CHJ 0102
XFMR2(1)=.000869; %R
XFMR2(2)=.059651; %X
%Tap ratio 1.04548

%XFMR 3 CHJ TX1 to CHJ 0304
XFMR3(1)=.000951; %R
XFMR3(2)=.060355; %X
%Tap ratio 1.04548

index_XFMR1=[1:2];     %Index for numerical parameters to edit
index_XFMR2=[1:2];     %Index for numerical parameters to edit
index_XFMR3=[1:2];     %Index for numerical parameters to edit

%% Setup Original Parameter Variables
gentpj_original=gentpj;
exst1_original=exst1;
wsccst_original=wsccst;
hyg3_original=hyg3;
XFMR1_original=XFMR1;
XFMR2_original=XFMR2;
XFMR3_original=XFMR3;

index=struct('gentpj',index_gentpj,'exst1',index_exst1,'wsccst',index_wsccst,'hyg3',index_hyg3,'XFMR1',index_XFMR1,'XFMR2',index_XFMR2,'XFMR3',index_XFMR3);

clear index_gentpj index_exst1 index_wsccst index_hyg3 index_XFMR1 index_XFMR2 index_XFMR3

%% Parameter List to be Ran in Single Parameter Fitting
list2016=[...
    %Best Initialization over just event
    "CHJ1 Real Data Combined\CHJ1_2016Event_9231_4to9261_4.mat";...
%     "CHJ1 Real Data Combined\CHJ1_2016Event_9720_3to9750_3.mat";...
%     "CHJ1 Real Data Combined\CHJ1_2016Event_19796_15to19826_15.mat";...
%     "CHJ1 Real Data Combined\CHJ1_2016Event_20398_35to20428_35.mat";...
    ];

list2017=[...
    %Best Initialization over just event
%         "CHJ1 Real Data Combined\CHJ1_2017Event_5095_45to5125_45.mat";...
%         "CHJ1 Real Data Combined\CHJ1_2017Event_5700_35to5730_35.mat";...
%         "CHJ1 Real Data Combined\CHJ1_2017Event_8698_25to8728_25.mat";...
%         "CHJ1 Real Data Combined\CHJ1_2017Event_9303_5to9333_5.mat";... 
    
    ];
list2018=[...
    %     "CHJ1 Real Data Combined\CHJ1_2018Event_5097_15to5127_15.mat"
    %     "CHJ1 Real Data Combined\CHJ1_2018Event_5511_4to5541_4.mat"
    %     "CHJ1 Real Data Combined\CHJ1_2018Event_8701_05to8731_05.mat"
    %     "CHJ1 Real Data Combined\CHJ1_2018Event_8878_2to8908_2.mat"
    ];
list=[list2016;list2017;list2018;];


%     numbers=[...
%     [9241-10:.05:9241]',[9271-10:.05:9271]';...
%         [9721-10:.05:9721]',[9751-10:.05:9751]';...
%         [19800-10:.05:19800]',[19830-10:.05:19830]';...
%         [20400-10:.05:20400]',[20430-10:.05:20430]';...
% ];
%
%
% for y=1:size(numbers,1)
%     t1name=num2str(round(min(numbers(y,:)),3));
%     t2name=num2str(round(max(numbers(y,:)),3));
%
%     t1name(find(t1name=='.'))='_';
%     t2name(find(t2name=='.'))='_';
%     list2016(y,:)=['CHJ1 Real Data Combined\CHJ1_2016Event_',t1name,'to',t2name,'.mat'];
% end
%
%
% numbers=[[5101-10:.05:5101]',[5131-10:.05:5131]';...
%         [5710-10:.05:5710]',[5740-10:.05:5740]';...
%         [8701-10:.05:8701]',[8731-10:.05:8731]';...
%         [9306-10:.05:9306]',[9336-10:.05:9336]';]
% for y=1:size(numbers,1)
%     t1name=num2str(round(min(numbers(y,:)),3));
%     t2name=num2str(round(max(numbers(y,:)),3));
%
%     t1name(find(t1name=='.'))='_';
%     t2name(find(t2name=='.'))='_';
%     list2017(y,:)=['CHJ1 Real Data Combined\CHJ1_2017Event_',t1name,'to',t2name,'.mat'];
% end

% numbers=[[5101-10:.05:5101]',[5131-10:.05:5131]';...
%     [5521-10:.05:5521]',[5551-10:.05:5551]';...
%     [8704-10:.05:8704]',[8734-10:.05:8734]';...
%     [8885-10:.05:8885]',[8915-10:.05:8915]';]
% for y=1:size(numbers,1)
%     t1name=num2str(round(min(numbers(y,:)),3));
%     t2name=num2str(round(max(numbers(y,:)),3));
%
%     t1name(find(t1name=='.'))='_';
%     t2name(find(t2name=='.'))='_';
%     list2018(y,:)=['CHJ1 Real Data Combined\CHJ1_2018Event_',t1name,'to',t2name,'.mat'];
% end




%     list_noisemult=[.0029] %All Events
    list_noisemult=[.0008] %Excluding 5 and 6 events

% list_noisemult=[0]

for m=1:1
    %         if m==1
    %             list=list2016;
    %         elseif m==2
    %             list=list2017;
    %         elseif m==3
    %             list=list2018;
    %         end
    
    list=[list2016;list2017;list2018;];
    
    
%                 for k=1:length(list_noisemult)
    %     clear final_theta output resnorm
    %             for k=1:length(list)
    
    
    
    
    
    
    
%         for k=1:size(list,1)
    %             paramlist=[1:100];
%             paramlist=[4,124,5];
%     paramlist=[4];
    paramlist=[4];
%     paramlist=[1:60,241:246];
%     paramlist=[34:60,241:246];
    
%             paramlist=[4,124,242];
%             paramlist=[1:246];
    
%     paramlist=[4,124,3,123,241,242,6,126,29,149,31,151,32,152,27,147,30,150,244,246,14,134,15,135];
%     paramlist=[49,169,26,146,44,164,48,168,43,163,47,167,40,160,20,140,28,148]
    for k=1:length(paramlist)
        
        
        %         for k=1:length(paramlist)
        % for k=1:length(noisemultiplierlist)
        %File Names to Be Used In Script
        filename_SetupAux=[pwd,'\SetupAux.aux'];
        filename_PlayInCase='CHJ1_PlayIn_RealPMU.PWB';
        filename_DataAux=[pwd,'\PlayInData.aux'];
        filenamedyd=[pwd,'\CHJ1_PlayIn.dyd'];
        filename_RunAux = [pwd,'\LoadDYD_RunPlayIn_RealPMU.aux'];
        
%                                     noisemultstr=num2str(list_noisemult(k));
        noisemultstr=num2str(list_noisemult(1));
        
        noisemultstr=noisemultstr(find(noisemultstr=='.')+1:end);
        
        
        %         if m==1
        %             filename_SaveLocation=['D:\Users\JEisenbarth\Desktop\PowerWorld Files\CHJ1 Real Data Combined\Fittings\CHJ1_2016_PlayInBestInitialization_ZM.mat'];
        %         elseif m==2
        %             filename_SaveLocation=['D:\Users\JEisenbarth\Desktop\PowerWorld Files\CHJ1 Real Data Combined\Fittings\CHJ1_2017_PlayInBestInitialization_ZM.mat'];
        %         elseif m==3
        %             filename_SaveLocation=['D:\Users\JEisenbarth\Desktop\PowerWorld Files\CHJ1 Real Data Combined\Fittings\CHJ1_2018_PlayInBestInitialization_ZM.mat'];
        %         end
        %         filename_SaveLocation=['D:\Users\JEisenbarth\Desktop\PowerWorld Files\CHJ1 Real Data Combined\Fittings\CHJ1_Combined_H_XfmrX_SingleParameter_NoNoise_H_Ks1_T1_XfmrXstart.mat'];
        %                             filename_SaveLocation=['D:\Users\JEisenbarth\Desktop\PowerWorld Files\CHJ1 Real Data Combined\Fittings\CHJ1_Combined_H1_SingleParameter_NoNoise.mat'];
        %                         filename_SaveLocation=['D:\Users\JEisenbarth\Desktop\PowerWorld Files\CHJ1 Real Data Combined\Fittings\CHJ1_Combined_Many_SingleParameter_Event7_VNoiseMult_',noisemultstr,'_PQoffset_00_H_Ks1_T1_XfmrX_AVGStart3.mat'];
        %         filename_SaveLocation=['D:\Users\JEisenbarth\Desktop\PowerWorld Files\CHJ1 Real Data Combined\Fittings\CHJ1_Combined_PlayInBestInitialization2.mat'];
        %                         filename_SaveLocation=['D:\Users\JEisenbarth\Desktop\PowerWorld Files\CHJ1 Real Data Combined\Jacobian Tests\CHJ1_Combined_Event',num2str(k),'Jacobian_Residual_JustQafterEvent.mat'];
        %         filename_SaveLocation=['D:\Users\JEisenbarth\Desktop\PowerWorld Files\CHJ1 Real Data Combined\Fittings\CHJ1_Combined_SingleParameter_H1_H3_NoNoise.mat'];
                                filename_SaveLocation=['D:\Users\JEisenbarth\Desktop\PowerWorld Files\CHJ1 Real Data Combined\Fittings\CHJ1_Combined_SingleParameter_ManyUnsensitiveParameters_Event1_VNoiseMult_',noisemultstr,'_PQoffset_00_NominalStart2.mat'];
%                                 filename_SaveLocation=['D:\Users\JEisenbarth\Desktop\PowerWorld Files\CHJ1 Real Data Combined\Fittings\CHJ1_Combined_AllSingleParameter_NoNoise_NominalStart2.mat'];
%         filename_SaveLocation=['D:\Users\JEisenbarth\Desktop\PowerWorld Files\CHJ1 Real Data Combined\Fittings\CHJ1_Combined_Event5and6_InitializationTest.mat'];
        
        
        numericalsims=250;
        %     clear final_theta resnorm output
        %         clear data data_orig;
        for x=1:numericalsims
            %     for x=1:length(paramlist)
            
            %% Setup PlayIn PowerWorld Case for PMU Data
            %Load datacsv
%                         load(['D:\Users\JEisenbarth\Desktop\PowerWorld Files\',char(list(k))]);
            %                         load(['D:\Users\JEisenbarth\Desktop\PowerWorld Files\',char(list(7))]);
            load(['D:\Users\JEisenbarth\Desktop\PowerWorld Files\',char(list(1))]);
            
            %% Write Data Aux File for Coulee Event PlayIn
            datacsv.t1=datacsv.t1-datacsv.t1(1);
            t1=datacsv.t1;
            Vt=datacsv.Vt;
            I=datacsv.I;
            f1=datacsv.f1;
            
            %% ADD Filtered Measurement Noise to V and F
            %Noise Multipliers
            %                 Vtnoisemultiplier=.0006;
            Vtnoisemultiplier=list_noisemult(1);
%                                     Vtnoisemultiplier=list_noisemult(k);
            
            %         Vtnoisemultiplier=0;
            
            
            %Voltage and current Noise
            Iavg=335.674434028434;       %A from 2016 CJ data
            Vtavg=139042.160648655;      %Volts from 2016 CJ data
            [b,a]=butter(3,5/30); %LP filter with cutoff of 5Hz
            
            

            
            
            %Find Start Time Event
            indexstartevent=find(round(t1,8)==datacsv.tevent);
            
            rng(x)
            Vtnoisemag=Vtnoisemultiplier*Vtavg*randn(length(Vt(indexstartevent:end)),1);
            Vtnoiseang=Vtnoisemultiplier*pi*randn(length(Vt(indexstartevent:end)),1);
            Inoisemag=Vtnoisemultiplier*Iavg*randn(length(I(indexstartevent:end)),1);
            Inoiseang=Vtnoisemultiplier*pi*randn(length(I(indexstartevent:end)),1);
            
%             save_noisedata(k,x).Vtnoisemag=(Vtnoisemag);
%             save_noisedata(k,x).Vtnoiseang=(Vtnoiseang);
%             save_noisedata(k,x).Inoisemag=(Inoisemag);
%             save_noisedata(k,x).Inoiseang=(Inoiseang);
            
            Vtnoisemag=filter(b,a,Vtnoisemag);
            Vtnoiseang=filter(b,a,Vtnoiseang);
            Inoisemag=filter(b,a,Inoisemag);
            Inoiseang=filter(b,a,Inoiseang);
            
            Vtnoisemag(1)=0;
            Vtnoiseang(1)=0;
            Inoisemag(1)=0;
            Inoiseang(1)=0;
            
            Vtnoise=[Vt(1:indexstartevent-1);(abs(Vt(indexstartevent:end))+Vtnoisemag).*exp(1i*(angle(Vt(indexstartevent:end))+Vtnoiseang))];
            Inoise=[I(1:indexstartevent-1);(abs(I(indexstartevent:end))+Inoisemag).*exp(1i*(angle(I(indexstartevent:end))+Inoiseang))];
            
            %Calculate P and Q
            P=real(3*Vtnoise.*conj(Inoise)/1e6);
            Q=imag(3*Vtnoise.*conj(Inoise)/1e6);
            
            %Frequency
            anglenoise=[zeros(indexstartevent-1,1);Vtnoiseang;];
            
            
            fmeasnoise = (30/pi)*angle(exp(1i*anglenoise(2:end))./exp(1i*anglenoise(1:end-1))); %freq error mHz
            fmeasnoise = [fmeasnoise(1);fmeasnoise]/sqrt(6);
            
            fmeasnoise=filter(b,a,fmeasnoise);
            f1(2:end)=f1(2:end)+fmeasnoise(2:end);
            
            %         f1=[f1(1:index10sec);f1(index10sec+1:end)+fmeasnoise];
            
            %Add P and Q Offset Noise
            Pavg=mean(datacsv.P);
            Qavg=mean(datacsv.Q);
            %         PQ_offsetMult=.01;
            PQ_offsetMult=0;
            
            
            
            %         P(2:end)=P(2:end)+Pavg*PQ_offsetMult*(rand(1)-.5);
            %         Q(2:end)=Q(2:end)+Qavg*PQ_offsetMult*(rand(1)-.5);
            
            P(1)=P(1)+Pavg*PQ_offsetMult/10*(rand(1)-.5);
            Q(1)=Q(1)+Qavg*PQ_offsetMult/10*(rand(1)-.5);
            
            %                         %Filter Plot Check
            %                         figure
            %                         subplot(3,1,1)
            %                         plot(t1,real(Vtnoise*sqrt(3)/230e3),t1,real(Vt*sqrt(3)/230e3),'LineWidth',1)
            %                         legend('Added Measurement Noise','Original')
            %                         title(['CHJ1 Event: Voltage PlayIn Noise Mult=',num2str(Vtnoisemultiplier)])
            %                         ylabel('Real Voltage ')
            %                         xlabel('Time(s)')
            %                         grid
            %                         xlim([0,30])
            %
            %                         subplot(3,1,2)
            %                         plot(t1,imag(Vtnoise*sqrt(3)/230e3),t1,imag(Vt*sqrt(3)/230e3),'LineWidth',1)
            %                         legend('Added Measurement Noise','Original')
            %                         ylabel('Imag Voltage ')
            %                         xlabel('Time(s)')
            %                         grid
            %                         xlim([0,30])
            %
            %                         subplot(3,1,3)
            %                         plot(t1,abs(Vtnoise*sqrt(3)/230e3),t1,abs(Vt*sqrt(3)/230e3),'LineWidth',1)
            %                         legend('Added Measurement Noise','Original')
            %                         ylabel('Voltage Magnitude(pu)')
            %                         xlabel('Time(s)')
            %                         grid
            %                         xlim([0,30])
            %
            %                         figure
            %                         subplot(3,1,1)
            %                         plot(t1,real(Inoise),t1,real(I),'LineWidth',1)
            %                         legend('Added Measurement Noise','Original')
            %                         title(['CHJ1 Event: Current PlayIn Noise Mult=',num2str(Vtnoisemultiplier)])
            %                         ylabel('Real Current(A)')
            %                         xlabel('Time(s)')
            %                         grid
            %                         xlim([0,30])
            %
            %                         subplot(3,1,2)
            %                         plot(t1,imag(Inoise),t1,imag(I),'LineWidth',1)
            %                         legend('Added Measurement Noise','Original')
            %                         ylabel('Imag Current (A)')
            %                         xlabel('Time(s)')
            %                         grid
            %                         xlim([0,30])
            %
            %                         subplot(3,1,3)
            %                         plot(t1,abs(Inoise),t1,abs(I),'LineWidth',1)
            %                         legend('Added Measurement Noise','Original')
            %                         ylabel('Current Magnitude(A)')
            %                         xlabel('Time(s)')
            %                         grid
            %                         xlim([0,30])
            %
            %                         figure
            %                         plot(t1,(f1),t1,(f1-fmeasnoise),'LineWidth',1)
            %
            %                         legend('Added Measurement Noise','Original')
            %                         title(['CHJ1 Event: Frequency PlayIn Noise Mult=',num2str(Vtnoisemultiplier)])
            %                         xlabel('Time(s)')
            %                         ylabel('Frequency (Hz)')
            %                         grid
            %                         xlim([0,30])
            %
            %                         figure
            %                         subplot(2,1,1)
            %                         plot(t1,P,t1,datacsv.P,'LineWidth',1)
            %                         legend('Added Measurement Noise','Original')
            %                         title(['CHJ1 Event: Real Power PlayIn Noise Mult=',num2str(Vtnoisemultiplier)])
            %                         ylabel('Real Power (MW)')
            %                         xlabel('Time(s)')
            %                         grid
            %                         xlim([0,30])
            %
            %                         subplot(2,1,2)
            %                         plot(t1,Q,t1,datacsv.Q,'LineWidth',1)
            %                         legend('Added Measurement Noise','Original')
            %                         title(['CHJ1 Event: Reactive Power PlayIn Noise Mult=',num2str(Vtnoisemultiplier)])
            %                         ylabel('Reactive Power (MVAR)')
            %                         xlabel('Time(s)')
            %                         grid
            %                         xlim([0,30])
            
            datacsv.Pnonoise=datacsv.P;
            datacsv.Qnonoise=datacsv.Q;
            datacsv.P=P;
            datacsv.Q=Q;
            
            datacsv.Vtnoise=Vtnoise;
            datacsv.Inoise=Inoise;
            datacsv.f1noise=f1;
            
            
            %           WritePlayInAux(filename_DataAux,t1,ones(size(t1))*abs(Vtnoise(1)*sqrt(3)/230e3),ones(size(t1))*f1(1)/60)
            
            WritePlayInAux(filename_DataAux,t1,abs(Vtnoise*sqrt(3)/230e3),f1/60)
            
            
            %% Setup PowerWorld Case Based on Starting Point for Real PMU Data
            Vpmu=datacsv.Vtnoise(1);
            Ipmu=datacsv.Inoise(1);
            SetupCase_CHJ1(filename_SetupAux,filename_PlayInCase,Ipmu,Vpmu,SimAuto,XFMR1,XFMR2,XFMR3,GensOnList)
            
            
            %% Setup to Run to Minimize Cost Function
            %Setup Column Vector of Parameter to Adjust
            theta_indicies=[...
                1*ones(length(index.gentpj),1),[1:length(index.gentpj)]',ones(length(index.gentpj),1)*1;...
                2*ones(length(index.exst1),1),[1:length(index.exst1)]',ones(length(index.exst1),1)*1;...
                3*ones(length(index.wsccst),1),[1:length(index.wsccst)]',ones(length(index.wsccst),1)*1;...
                4*ones(length(index.hyg3),1),[1:length(index.hyg3)]',ones(length(index.hyg3),1)*1;...
                
                1*ones(length(index.gentpj),1),[1:length(index.gentpj)]',ones(length(index.gentpj),1)*2;...
                2*ones(length(index.exst1),1),[1:length(index.exst1)]',ones(length(index.exst1),1)*2;...
                3*ones(length(index.wsccst),1),[1:length(index.wsccst)]',ones(length(index.wsccst),1)*2;...
                4*ones(length(index.hyg3),1),[1:length(index.hyg3)]',ones(length(index.hyg3),1)*2;...
                
                1*ones(length(index.gentpj),1),[1:length(index.gentpj)]',ones(length(index.gentpj),1)*3;...
                2*ones(length(index.exst1),1),[1:length(index.exst1)]',ones(length(index.exst1),1)*3;...
                3*ones(length(index.wsccst),1),[1:length(index.wsccst)]',ones(length(index.wsccst),1)*3;...
                4*ones(length(index.hyg3),1),[1:length(index.hyg3)]',ones(length(index.hyg3),1)*3;...
                
                1*ones(length(index.gentpj),1),[1:length(index.gentpj)]',ones(length(index.gentpj),1)*4;...
                2*ones(length(index.exst1),1),[1:length(index.exst1)]',ones(length(index.exst1),1)*4;...
                3*ones(length(index.wsccst),1),[1:length(index.wsccst)]',ones(length(index.wsccst),1)*4;...
                4*ones(length(index.hyg3),1),[1:length(index.hyg3)]',ones(length(index.hyg3),1)*4;...
                
                5*ones(length(index.XFMR1),1),[1:length(index.XFMR1)]',zeros(length(index.XFMR1),1);...
                6*ones(length(index.XFMR2),1),[1:length(index.XFMR2)]',zeros(length(index.XFMR2),1);...
                7*ones(length(index.XFMR3),1),[1:length(index.XFMR3)]',zeros(length(index.XFMR3),1);];
            
            %Setup Lower Bound Vector for Timeconstants >4*Timestep
            lb_list=-Inf*ones(size(theta_indicies,1),1);
            lb_list([1,61,121,181])=4*1/300; %Tdop< 4*Ts
            lb_list([2,62,122,182])=4*1/300; %Tdopp< 4*Ts
            lb_list([3,63,123,183])=4*1/300; %Tqopp< 4*Ts
            lb_list([4,64,124,184])=0; %H>0
            lb_list([5,65,125,185])=.42; %Xd>Xdp
            
            %                         lb_list([5])=.32; %
            %             lb_list([6])=.25;
            %             lb_list([8])=.32;
            lb_list([7,67,127,187])=.05; %Xdpp<.05 the Xdpp=.05;
            lb_list([8,68,128,188])=.5*.31; %Xqpp<.5*Xdpp then Xqpp=.5*Xdpp
            lb_list([15,75,135,195])=4*1/300; %Tr< 4*Ts
            lb_list([18,78,138,198])=4*1/300; %Tc< 4*Ts
            lb_list([19,79,139,199])=4*1/300; %Tb< 4*Ts
            lb_list([27,87,147,207])=4*1/300; %Tqs< 4*Ts
            lb_list([28,88,148,208])=4*1/300; %Tq< 4*Ts
            lb_list([29,89,149,209])=4*1/300; %Tq2< 4*Ts
            lb_list([30,90,150,210])=4*1/300; %Tpq2< 4*Ts
            lb_list([31,91,151,211])=4*1/300; %Tq3< 4*Ts
            lb_list([32,92,152,212])=4*1/300; %Tpq3< 4*Ts
            lb_list([33,93,153,213])=1e5; %Vsmax>0
            lb_list([38,98,158,218])=4*1/300; %Td< 4*Ts
            lb_list([39,99,159,219])=4*1/300; %Tf< 4*Ts
            lb_list([40,100,160,220])=4*1/300; %Tp< 4*Ts
            lb_list([46,106,166,226])=4*1/300; %Tt< 4*Ts
            lb_list([47,107,167,227])=4*1/300; %Tw< 4*Ts
            lb_list([48,108,168,228])=0; %At>0
            lb_list([49,109,169,229])=0; %Ho>0
            
            ub_list=Inf*ones(size(theta_indicies,1),1);
            ub_list([7,67,127,187])=.336; %If Xdpp>Xdp then .8*Xdp
            ub_list([8,68,128,188])=.465; %If Xqpp>1.5*Xdpp then Xqpp=1.5*Xdpp
            ub_list([34,94,154,214])=-1e5; %Vslow<0
            
            
            
            %         lb=[lb_list(k);];
            %         ub=[ub_list(k);];
            %         theta_indicies=theta_indicies([k],:);
            
            lb=[lb_list(paramlist(k));];
            ub=[ub_list(paramlist(k));];
            theta_indicies=theta_indicies([paramlist(k)],:);
            
            
            %             lb=[lb_list(paramlist(1));];
            %             ub=[ub_list(paramlist(1));];
            %             theta_indicies=theta_indicies([paramlist(1)],:);
            %
%                         lb=[lb_list(paramlist(x));];
%                         ub=[ub_list(paramlist(x));];
%                         theta_indicies=theta_indicies([paramlist(x)],:);
            
            
%                                     theta_indicies=theta_indicies([paramlist],:);
%                                     lb=[lb_list(paramlist);];
%                                     ub=[ub_list(paramlist);];
            
            %             theta_indicies=[1,4;1,5];    %1st column is model,2nd column is numerical parameter
            %Ex. [1,5]->model=gentpj, parameter=H, P for
            % residual calculations.
            %Ex. [2,2]->model=exst1, parameter=Kr, Q for
            % residual calculations.
            
            %Setup theta Vectors
            theta=zeros(size(theta_indicies,1),1);
            for b=1:length(theta)
                if theta_indicies(b,1)==1
                    theta(b)= gentpj_original(theta_indicies(b,3),index.gentpj(theta_indicies(b,2)));
                elseif theta_indicies(b,1)==2
                    theta(b)= exst1_original(theta_indicies(b,3),index.exst1(theta_indicies(b,2)));
                elseif theta_indicies(b,1)==3
                    theta(b)= wsccst_original(theta_indicies(b,3),index.wsccst(theta_indicies(b,2)));
                elseif theta_indicies(b,1)==4
                    theta(b)= hyg3_original(theta_indicies(b,3),index.hyg3(theta_indicies(b,2)));
                elseif theta_indicies(b,1)==5
                    theta(b)= XFMR1_original(index.XFMR1(theta_indicies(b,2)));
                elseif theta_indicies(b,1)==6
                    theta(b)= XFMR2_original(index.XFMR2(theta_indicies(b,2)));
                elseif theta_indicies(b,1)==7
                    theta(b)= XFMR3_original(index.XFMR3(theta_indicies(b,2)));
                end
            end
            
            percentnominal=abs(.01*theta);
            
            %% Run Simulation w Original theta in model
            % Run Original Simulation w/ Nominal dyd file.
            [data_orig(k,x)] = PowerWorld_WriteDYD_Run_CHJ1_RealPMU(filenamedyd,gentpj_original,exst1_original,hyg3_original,SimAuto,filename_RunAux,filename_PlayInCase,filename_SetupAux,Ipmu,Vpmu,XFMR2_original,XFMR1_original,wsccst_original,XFMR3_original,GensOnList);
            
            
            %% Run Minimizing Cost Function
                        PQ_Flag=2; %When PQ_Flag is 2 then that means to use P and Q for residual calculations.
%             PQ_Flag=1;
            k
            opts=optimoptions(@lsqnonlin,'TolFun',1e-12,'Display','iter','Diagnostics','off','Tolx',1e-3,'MaxFunEvals',50,'SpecifyObjectiveGradient',true);
%                                                 opts=optimoptions(@lsqnonlin,'TolFun',1e-12,'Display','iter','Diagnostics','off','Tolx',1e-12,'MaxFunEvals',0,'MaxIterations',0,'SpecifyObjectiveGradient',true);
            
            residual = @(theta) residual_Jacobian_PowerWorld_RealPMU_CHJ1(theta,theta_indicies,index,datacsv,filenamedyd,gentpj,exst1,hyg3,PQ_Flag,SimAuto,percentnominal,filename_RunAux,filename_PlayInCase,filename_SetupAux,Ipmu,Vpmu,XFMR2,XFMR1,wsccst,XFMR3,GensOnList);
            
%                                     [final_theta(k,x),resnorm,residualout,exitflag,output,lambda,Jacobian] = lsqnonlin(residual,theta,lb,ub,opts);
            [final_theta(k,x),resnorm(k,x),residualout,exitflag,output(k,x),lambda,Jacobian] = lsqnonlin(residual,theta,lb,ub,opts);
            %                                                             [final_theta(k,:),resnorm(k,:),residualout,exitflag,output(k,:),lambda,Jacobian] = lsqnonlin(residual,theta,lb,ub,opts);
            %                                     residual_save(k,:)=residualout;
%             rtest(m,k)=mean(abs(residualout));
            
            
            x
            
            %% Run Simulation with newly found theta
            
            %             %Put thetas into model
%             for m=1:size(theta_indicies,1)
%                 if theta_indicies(m,1)==1
%                     gentpj(theta_indicies(m,3),index.gentpj(theta_indicies(m,2)))=final_theta(k,m);
%                 elseif theta_indicies(m,1)==2
%                     exst1(theta_indicies(m,3),index.exst1(theta_indicies(m,2)))=final_theta(k,m);
%                 elseif theta_indicies(m,1)==3
%                     wsccst(theta_indicies(m,3),index.wsccst(theta_indicies(m,2)))=final_theta(k,m);
%                 elseif theta_indicies(m,1)==4
%                     hyg3(theta_indicies(m,3),index.hyg3(theta_indicies(m,2)))=final_theta(k,m);
%                 elseif theta_indicies(m,1)==5
%                     XFMR1(index.XFMR1(theta_indicies(m,2)))=final_theta(k,m);
%                 elseif theta_indicies(m,1)==6
%                     XFMR2(index.XFMR2(theta_indicies(m,2)))=final_theta(k,m);
%                 elseif theta_indicies(m,1)==7
%                     XFMR3(index.XFMR3(theta_indicies(m,2)))=final_theta(k,m);
%                 end
%             end
%             %Run Simulation w final theta in model
%             [data(k,x)] = PowerWorld_WriteDYD_Run_CHJ1_RealPMU(filenamedyd,gentpj,exst1,hyg3,SimAuto,filename_RunAux,filename_PlayInCase,filename_SetupAux,Ipmu,Vpmu,XFMR2,XFMR1,wsccst,XFMR3,GensOnList);
%             
%             %Set Models to Original
%             gentpj=gentpj_original;
%             exst1=exst1_original;
%             wsccst=wsccst_original;
%             hyg3=hyg3_original;
%             XFMR1=XFMR1_original;
%             XFMR2=XFMR2_original;
%             XFMR3=XFMR3_original;
            
            toc
            %         %% Save Fitting Data
            %         %         %         %         %save(filename_SaveLocation,'final_theta','resnorm','output','list')
            %         %         %         %         %save(filename_SaveLocation,'final_theta','resnorm','output','list','data')
            %         %         %         %
%             datacsv_save(k,x)=datacsv;
            %
            %
%             save(filename_SaveLocation,'final_theta','resnorm','output','list','data','data_orig','datacsv','datacsv_save','paramlist','GensOnList','rtest')
            %             save(filename_SaveLocation,'list','data_orig','datacsv','datacsv_save')
            %
            if(mod(x,10)==0)
%             save(filename_SaveLocation,'final_theta','resnorm','output','list','paramlist')
            end
            %                                                 save(filename_SaveLocation,'final_theta','list','paramlist')
            
            %             save(filename_SaveLocation,'rtest','list')
            %                                     save(filename_SaveLocation,'Jacobian','residualout','theta')
            
            %         %
        end
        
        %% Plot Check
        list_title2017=[...
            "2017 125 MW Square-wave Pulse";...
            "2017 CJ Brake Pulse";...
            "2017 CJ Brake Pulse";...
            "2017 125 MW Square-wave Pulse";...
            "2017 125 MW Square-wave Pulse";...
            "2017 CJ Brake Pulse";...
            "2017 CJ Brake Pulse";...
            "2017 125 MW Square-wave Pulse";...
            "2017 125 MW Square-wave Pulse";...
            "2017 125 MW Square-wave Pulse";...
            "2017 125 MW Square-wave Pulse";...
            "2017 125 MW Square-wave Pulse";...
            ];
        
        list_title2018=[...
            "2018 125 MW Square-wave Pulse";...
            "2018 CJ Brake Pulse";...
            "2018 CJ Brake Pulse";...
            "2018 125 MW Square-wave Pulse";...
            "2018 125 MW Square-wave Pulse";...
            "2018 CJ Brake Pulse";...
            "2018 CJ Brake Pulse";...
            "2018 125 MW Square-wave Pulse";...
            "2018 125 MW Square-wave Pulse";...
            "2018 125 MW Square-wave Pulse";...
            "2018 125 MW Square-wave Pulse";...
            "2018 125 MW Square-wave Pulse";...
            "2018 125 MW Square-wave Pulse";...
            ];
        
        
        
%                 figure
%                 ndxP=PWFind(data_orig(k),'Branch ',' 44162 44155 1 ','MW From');
%                 ndxQ=PWFind(data_orig(k),'Branch ',' 44162 44155 1 ','Mvar From');
%                 subplot(3,1,1)
%                 hold on
%                 plot(datacsv.t1,datacsv.P,'LineWidth',1,'DisplayName','Event')
%                 plot(data_orig(k,1).Data(:,1),data_orig(k,1).Data(:,ndxP),'LineWidth',1,'DisplayName','PlayIn Orig')
%                 plot(data(k,1).Data(:,1),data(k,1).Data(:,ndxP),'LineWidth',1,'DisplayName','PlayIn Fitted')
%                 hold off
% %                 if size(list2017,1)==size(list,1)
% %                     title(['k=',num2str(k),' ',char(list_title2017(k,:)),' P Plot'])
% %                 elseif size(list2018,1)==size(list,1)
% %                     title(['k=',num2str(k),' ',char(list_title2018(k,:)),' P Plot'])
% %                 end
%                             title(char(list(k,:)))
% %                 title(['Param #',num2str(k)])
%                 legend('Location','Best')
%                 grid
%                 xlabel('Seconds')
%                 ylabel('MW')
%                 %     xlim([10,30])
%         
%                 subplot(3,1,2)
%                 hold on
%                 plot(datacsv.t1,datacsv.Q,'LineWidth',1,'DisplayName','Event')
%                 plot(data_orig(k,1).Data(:,1),data_orig(k,1).Data(:,ndxQ),'LineWidth',1,'DisplayName','PlayIn Orig')
%                 plot(data(k,1).Data(:,1),data(k,1).Data(:,ndxQ),'LineWidth',1,'DisplayName','PlayIn Fitted')
%                 hold off
% %                 if size(list2017,1)==size(list,1)
% %                     title(['k=',num2str(k),' ',char(list_title2017(k,:)),' Q Plot'])
% %                 elseif size(list2018,1)==size(list,1)
% %                     title(['k=',num2str(k),' ',char(list_title2018(k,:)),' Q Plot'])
% %                 end
%                 title(char(list(k,:)))
%                 legend('Location','Best')
%                 grid
%                 xlabel('Seconds')
%                 ylabel('MVAR')
%                 %         xlim([10,30])
%                 %         savefig(['F:\Grad School Research\State Plots\PQ Plots\PQPlot_Event',num2str(k),'.fig'])
%         
%                 % subplot(3,1,3)
%                 %     hold on
%                 %     plot(data_orig(k).Data(:,1),data_orig(k).Data(:,11),'LineWidth',1,'DisplayName','PlayIn Orig')
%                 %     hold off
%                 %     if size(list2017,1)==size(list,1)
%                 %         title(['k=',num2str(k),' ',char(list_title2017(k,:)),' Vref State Plot'])
%                 %     elseif size(list2018,1)==size(list,1)
%                 %         title(['k=',num2str(k),' ',char(list_title2018(k,:)),' Vref Plot'])
%                 %     end
%                 %     legend();
%                 %     ylim([1,1.01])
%                 %     yticks([1:.001:1.01])
%                 %     grid
%                 %     xlabel('Seconds')
%                 %     ylabel('Pu')
%         
%                 % subplot(3,1,3)
%                 %     hold on
%                 %     plot(data_orig(k).Data(:,1),data_orig(k).Data(:,21),'LineWidth',1,'DisplayName','PlayIn Orig')
%                 %     hold off
%                 %     if size(list2017,1)==size(list,1)
%                 %         title(['k=',num2str(k),' ',char(list_title2017(k,:)),' ',data_orig(k).Header{21-1,6}])
%                 %     elseif size(list2018,1)==size(list,1)
%                 %         title(['k=',num2str(k),' ',char(list_title2018(k,:)),' ',data_orig(k).Header{21-1,6}])
%                 %     end
%                 %     legend();
%                 %     grid
%                 %     xlabel('Seconds')
%                 %     ylabel('Pu')
%                 %
%                 %
%                 %         subplot(3,1,3)
%                 %         hold on
%                 %         % plot(residual,'DisplayName',['Parameter=',num2str(theta)])
%                 %         plot(residual,'DisplayName',['Parameter='])
%                 %         hold off
%                 %         title('Residual')
%                 %         legend();
%                 %             %
%                 subplot(3,1,3)
%                 hold on
%                 plot(abs([data_orig(k,1).Data([1:5:9002],ndxP)-datacsv.P;data_orig(k,1).Data([1:5:9002],ndxQ)-datacsv.Q]),'DisplayName','PlayIn Orig')
%                 plot(abs([data(k,1).Data([1:5:9002],ndxP)-datacsv.P;data(k,1).Data([1:5:9002],ndxQ)-datacsv.Q]),'DisplayName','PlayIn Fitted')
%                 hold off
%                 title('Residual')
%                 %     xlim([10,30])
%                 legend('Location','NorthWest')
%                 grid
        
        %     rtest(k,:)=abs([data_orig(k,1).Data([1:5:9002],ndxP)-datacsv.P;data_orig(k,1).Data([1:5:9002],ndxQ)-datacsv.Q]);
        
        %
        %
        %
        %
        %
        %
        %             ndxV=PWFind(data_orig(k),'Bus ',' 40287 ','V pu');
        %         ndxV=4
        %         figure
        %         subplot(3,1,1)
        %         hold on
        %         plot(datacsv.t1,abs(datacsv.Vt)*sqrt(3)/230e3,'LineWidth',1,'DisplayName','Event')
        %         plot(data_orig(k).Data(:,1),data_orig(k).Data(:,ndxV),'LineWidth',1,'DisplayName','PlayIn Orig')
        %         plot(data(k).Data(:,1),data(k).Data(:,ndxV),'LineWidth',1,'DisplayName','PlayIn Fitted')
        %         hold off
        %         if size(list2017,1)==size(list,1)
        %             title(['k=',num2str(k),' ',char(list_title2017(k,:)),' V Plot'])
        %         elseif size(list2018,1)==size(list,1)
        %             title(['k=',num2str(k),' ',char(list_title2018(k,:)),' V Plot'])
        %         end
        %         legend();
        %         grid
        %
        %
        %         %             ndxF=PWFind(data_orig(k),'Bus ',' 40287 ','Frequency in PU');
        %         ndxF=2;
        %         subplot(3,1,2)
        %         hold on
        %         plot(datacsv.t1,datacsv.f1/60,'LineWidth',1,'DisplayName','Event')
        %         plot(data_orig(k).Data(:,1),data_orig(k).Data(:,ndxF),'LineWidth',1,'DisplayName','PlayIn Orig')
        %         plot(data(k).Data(:,1),data(k).Data(:,ndxF),'LineWidth',1,'DisplayName','PlayIn Fitted')
        %         hold off
        %         if size(list2017,1)==size(list,1)
        %             title(['k=',num2str(k),' ',char(list_title2017(k,:)),' F Plot'])
        %         elseif size(list2018,1)==size(list,1)
        %             title(['k=',num2str(k),' ',char(list_title2018(k,:)),' F Plot'])
        %         end
        %         legend();
        %         grid
        %
        %         % %             ndxVang=PWFind(data_orig(k),'Bus ',' 41744 ','V angle No shift');
        %         ndxVang=3;
        %         subplot(3,1,3)
        %         hold on
        %         plot(datacsv.t1,datacsv.Vang1-datacsv.Vang1(1),'LineWidth',1,'DisplayName','Event')
        %         plot(data_orig(k).Data(:,1),unwrap((data_orig(k).Data(:,ndxVang)-data_orig(k).Data(1,ndxVang))*pi/180)*180/pi,'LineWidth',1,'DisplayName','PlayIn Orig')
        %
        %                 plot(data(k).Data(:,1),unwrap((data(k).Data(:,ndxVang)-data(k).Data(1,ndxVang))*pi/180)*180/pi,'LineWidth',1,'DisplayName','PlayIn Fitted')
        %         hold off
        %         title('Vang Plot')
        %         legend();
        %         grid
        
        % %Plot Exciter
        %     x=1;
        %     b=1;
        %     for z=9:20
        %         if(x>3)
        %             x=1;
        %             b=b+1;
        %         end
        %         if(x==1)
        %             figure
        %         end
        %         subplot(3,1,x)
        %         hold on
        %         plot(data_orig(k).Data(:,1),data_orig(k).Data(:,z),'LineWidth',1,'DisplayName','PlayIn Orig')
        %         %     plot(data(k).Data(:,1),data(k).Data(:,ndxP),'LineWidth',1,'DisplayName','PlayIn Fitted')
        %         hold off
        %         if size(list2017,1)==size(list,1)
        %             title(['k=',num2str(k),' ',char(list_title2017(k,:)),' ',data_orig(k).Header{z-1,6}])
        %         elseif size(list2018,1)==size(list,1)
        %             title(['k=',num2str(k),' ',char(list_title2018(k,:)),' ',data_orig(k).Header{z-1,6}])
        %         end
        %         legend();
        %         grid
        %         xlabel('Seconds')
        %
        %         x=x+1;
        %     end
        %     savefig(['F:\Grad School Research\State Plots\Exciter State Plots\ExciterStates_Event',num2str(k),'_Plot',num2str(b),'hyg3OFF.fig'])
        %
        % %Plot Stabilizer
        %     x=1;
        %     b=1;
        %     for z=21:31
        %         if(x>3)
        %             x=1;
        %             b=b+1;
        %         end
        %         if(x==1)
        %             figure
        %         end
        %         subplot(3,1,x)
        %         hold on
        %         plot(data_orig(k).Data(:,1),data_orig(k).Data(:,z),'LineWidth',1,'DisplayName','PlayIn Orig')
        %         %     plot(data(k).Data(:,1),data(k).Data(:,ndxP),'LineWidth',1,'DisplayName','PlayIn Fitted')
        %         hold off
        %         if size(list2017,1)==size(list,1)
        %             title(['k=',num2str(k),' ',char(list_title2017(k,:)),' ',data_orig(k).Header{z-1,6}])
        %         elseif size(list2018,1)==size(list,1)
        %             title(['k=',num2str(k),' ',char(list_title2018(k,:)),' ',data_orig(k).Header{z-1,6}])
        %         end
        %         legend();
        %         grid
        %         xlabel('Seconds')
        %
        %         x=x+1;
        %     end
        %
        % %Plot Governor
        %     x=1;
        %     b=1;
        %     for z=32:43
        %         if(x>3)
        %             x=1;
        %             b=b+1;
        %         end
        %         if(x==1)
        %             figure
        %         end
        %         subplot(3,1,x)
        %         hold on
        %         plot(data_orig(k).Data(:,1),data_orig(k).Data(:,z),'LineWidth',1,'DisplayName','PlayIn Orig')
        %         %     plot(data(k).Data(:,1),data(k).Data(:,ndxP),'LineWidth',1,'DisplayName','PlayIn Fitted')
        %         hold off
        %         if size(list2017,1)==size(list,1)
        %             title(['k=',num2str(k),' ',char(list_title2017(k,:)),' ',data_orig(k).Header{z-1,6}])
        %         elseif size(list2018,1)==size(list,1)
        %             title(['k=',num2str(k),' ',char(list_title2018(k,:)),' ',data_orig(k).Header{z-1,6}])
        %         end
        %         legend();
        %         grid
        %         xlabel('Seconds')
        %
        %         x=x+1;
        %     end
        %
        % %Plot Machine
        %     x=1;
        %     b=1;
        %     for z=44:51
        %         if(x>3)
        %             x=1;
        %             b=b+1;
        %         end
        %         if(x==1)
        %             figure
        %         end
        %         subplot(3,1,x)
        %         hold on
        %         plot(data_orig(k).Data(:,1),data_orig(k).Data(:,z),'LineWidth',1,'DisplayName','PlayIn Orig')
        %         %     plot(data(k).Data(:,1),data(k).Data(:,ndxP),'LineWidth',1,'DisplayName','PlayIn Fitted')
        %         hold off
        %         if size(list2017,1)==size(list,1)
        %             title(['k=',num2str(k),' ',char(list_title2017(k,:)),' ',data_orig(k).Header{z-1,6}])
        %         elseif size(list2018,1)==size(list,1)
        %             title(['k=',num2str(k),' ',char(list_title2018(k,:)),' ',data_orig(k).Header{z-1,6}])
        %         end
        %         legend();
        %         grid
        %         xlabel('Seconds')
        %
        %         x=x+1;
        %     end
        %
        %
        %
        %     %         figure
        %     %     subplot(2,1,1)
        %     %     hold on
        %     %     plot(data_orig(k).Data(:,1),data_orig(k).Data(:,11),'LineWidth',1,'DisplayName','PlayIn Orig')
        %     %     %     plot(data(k).Data(:,1),data(k).Data(:,ndxP),'LineWidth',1,'DisplayName','PlayIn Fitted')
        %     %     hold off
        %     %     if size(list2017,1)==size(list,1)
        %     %         title(['k=',num2str(k),' ',char(list_title2017(k,:)),' VOEL'])
        %     %     elseif size(list2018,1)==size(list,1)
        %     %         title(['k=',num2str(k),' ',char(list_title2018(k,:)),' VOEL'])
        %     %     end
        %     %     legend();
        %     %     grid
        %     %     xlabel('Seconds')
        %     %
        %     %
        %     %     subplot(2,1,2)
        %     %     hold on
        %     %     plot(data_orig(k).Data(:,1),data_orig(k).Data(:,12),'LineWidth',1,'DisplayName','PlayIn Orig')
        %     %     %     plot(data(k).Data(:,1),data(k).Data(:,ndxQ),'LineWidth',1,'DisplayName','PlayIn Fitted')
        %     %     hold off
        %     %     if size(list2017,1)==size(list,1)
        %     %         title(['k=',num2str(k),' ',char(list_title2017(k,:)),'VUEL'])
        %     %     elseif size(list2018,1)==size(list,1)
        %     %         title(['k=',num2str(k),' ',char(list_title2018(k,:)),'VUEL'])
        %     %     end
        %     %     legend();
        %     %     grid
        %     %     xlabel('Seconds')
        %
        
    end
end
