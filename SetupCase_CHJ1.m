function [] = SetupCase_CHJ1(filename_SetupAux,filename_PlayInCase,Ipmu,Vpmu,SimAuto,XFMR1,XFMR2,XFMR3,GensOnList)
%SetupCase_CHJ1 This funciton will be used to write and run an Aux file
% to setup a case file from PMU Data. It takes the PMU voltage at the
% PlayIn bus then performs a calcuation to find the voltage and power at
% the generator bus so that the P,Q, and V measurements for the PMU match
% match the setup case.

%% Calculate Vm and Pm for Bus with CHJ1 Generator
% Known Quantities
Sbase=100e6;
Vbase=230e3/sqrt(3);
Ibase=Sbase/(Vbase);
XfmrTap1=1.00;
XfmrTap2=1.04548;
XfmrTap3=1.04548;

Vt=Vpmu/Vbase;
Iorig=-Ipmu*3/Ibase;

% abs(Vt)
Pinit=real(Vt*conj(Iorig))*Sbase/1e6;
Qinit=imag(Vt*conj(Iorig))*Sbase/1e6;

%% Voltage over Xfmr1 Bus CHJ PH1 to CHJ TX1
ZXfmr1=XFMR1(1)+j*XFMR1(2);


Ymagnetizing1=XFMR1(3)+j*XFMR1(4);
Imagnetizing1=Vt*Ymagnetizing1;


I=Iorig+Imagnetizing1;


abs(I*Ibase/3);

Vm1=I*ZXfmr1*XfmrTap1+Vt/XfmrTap1; %Solve Vm then plug in for I.

Pm1=real(Vm1*conj(I))*XfmrTap1*Sbase/1e6;
Qm1=imag(Vm1*conj(I))*XfmrTap1*Sbase/1e6;
% abs(Vm)

%% Voltage over Xfmr2 Bus CHJ TX1 to CHJ 0102
I2=I*XfmrTap1*length(find(GensOnList<=2))/length(GensOnList);
ZXfmr2=(XFMR2(1)+j*XFMR2(2));

Vm2=I2*ZXfmr2*XfmrTap2+Vm1/(XfmrTap2); %Solve Vm then plug in for I.

if length(find(GensOnList<=2))==2
    Pm2=real(Vm2*conj(I2))*XfmrTap2*Sbase/1e6/2;
    Qm2=imag(Vm2*conj(I2))*XfmrTap2*Sbase/1e6/2;
else
    Pm2=real(Vm2*conj(I2))*XfmrTap2*Sbase/1e6;
    Qm2=imag(Vm2*conj(I2))*XfmrTap2*Sbase/1e6;
end

%% Voltage over Xfmr3 Bus CHJ TX1 to CHJ 0304
I3=I*XfmrTap1*length(find(GensOnList>=3))/length(GensOnList);
ZXfmr3=(XFMR3(1)+j*XFMR3(2));

Vm3=I3*ZXfmr3*XfmrTap3+Vm1/(XfmrTap3); %Solve Vm then plug in for I.

if length(find(GensOnList>=3))==2
    Pm3=real(Vm3*conj(I3))*XfmrTap3*Sbase/1e6/2;
    Qm3=imag(Vm3*conj(I3))*XfmrTap3*Sbase/1e6/2;
else
    Pm3=real(Vm3*conj(I3))*XfmrTap3*Sbase/1e6;
    Qm3=imag(Vm3*conj(I3))*XfmrTap3*Sbase/1e6;
end



%% Setup Aux file
Gen1status='Open';
Gen2status='Open';
Gen3status='Open';
Gen4status='Open';

Transformer2status='Open';
Transformer3status='Open';


fileID = fopen(filename_SetupAux,'w');
fprintf(fileID,['SCRIPT\n']);
fprintf(fileID,['{\n']);
% fprintf(fileID,['//Load Case\n']);

fprintf(fileID,['OpenCase("%s",PWB);\n'],filename_PlayInCase);
% fprintf(fileID,['//Enter Edit Mode\n']);
fprintf(fileID,['EnterMode(EDIT);\n']);
fprintf(fileID,['}\n\n']);

% fprintf(fileID,['//Add Transformer 1 Parameters for PlayIn\n']);
fprintf(fileID,['DATA (Branch, [BusNum,BusName,BusNum:1,BusName:1,LineCircuit,LineR,LineX])\n']);
fprintf(fileID,['{\n']);
fprintf(fileID,['44162 "CHJ PH1" 44155 "CHJ TX1" 1 ',num2str(XFMR1(1),12),' ',num2str(XFMR1(2),12),'\n']);
fprintf(fileID,['}\n\n']);

% Transformer 2
if find(GensOnList==1)
    Transformer2status='Closed';
end
if find(GensOnList==2)
    Transformer2status='Closed';
end
% fprintf(fileID,['//Add Transformer 2 Parameters for PlayIn\n']);
fprintf(fileID,['DATA (Branch, [BusNum,BusName,BusNum:1,BusName:1,LineCircuit,LineR,LineX,Status])\n']);
fprintf(fileID,['{\n']);
fprintf(fileID,['44155 "CHJ TX1" 44141 "CHJ 0102" 1 ',num2str(XFMR2(1),12),' ',num2str(XFMR2(2),12),' ',Transformer2status,'\n']);
fprintf(fileID,['}\n\n']);

% Transformer 3
if find(GensOnList==3)
    Transformer3status='Closed';
end
if find(GensOnList==4)
    Transformer3status='Closed';
end
% fprintf(fileID,['//Add Transformer 3 Parameters for PlayIn\n']);
fprintf(fileID,['DATA (Branch, [BusNum,BusName,BusNum:1,BusName:1,LineCircuit,LineR,LineX,Status])\n']);
fprintf(fileID,['{\n']);
fprintf(fileID,['44155 "CHJ TX1" 44142 "CHJ 0304" 1 ',num2str(XFMR3(1),12),' ',num2str(XFMR3(2),12),' ',Transformer3status,'\n']);
fprintf(fileID,['}\n\n']);

% fprintf(fileID,['//Add Generator Voltage for PlayIn Gen\n']);
fprintf(fileID,['DATA (GEN, [BusNum,BusName,GenID,VoltSet])\n']);
fprintf(fileID,['{\n']);
fprintf(fileID,['44162 "CHJ PH1" 1 ',num2str(abs(Vt),12),'\n']);
fprintf(fileID,['}\n\n']);

% fprintf(fileID,['//Add Bus Voltage and Angle for PlayIn Bus\n']);
fprintf(fileID,['DATA (Bus, [BusNum,BusName,BusPUVolt,BusAngle])\n']);
fprintf(fileID,['{\n']);
fprintf(fileID,['44162 "CHJ PH1" ',num2str(abs(Vt),12),' 0\n']);
fprintf(fileID,['}\n\n']);

%Generator 1
if find(GensOnList==1)
    Gen1status='Closed';
end
% fprintf(fileID,['//Add Generator Real Power and Voltage for Gen 1\n']);
fprintf(fileID,['DATA (GEN, [BusNum,BusName,GenID,VoltSet,GenMW,GenStatus])\n']);
fprintf(fileID,['{\n']);
fprintf(fileID,['44141 "CHJ 0102" 01 ',num2str(abs(Vm2),12),' ',num2str(Pm2,12),' ',Gen1status,'\n']);
fprintf(fileID,['}\n\n']);

%Generator 2
if find(GensOnList==2)
    Gen2status='Closed';
end
% fprintf(fileID,['//Add Generator Real Power and Voltage for Gen 1\n']);
fprintf(fileID,['DATA (GEN, [BusNum,BusName,GenID,VoltSet,GenMW,GenStatus])\n']);
fprintf(fileID,['{\n']);
fprintf(fileID,['44141 "CHJ 0102" 02 ',num2str(abs(Vm2),12),' ',num2str(Pm2,12),' ',Gen2status,'\n']);
fprintf(fileID,['}\n\n']);

%Generator 3
if find(GensOnList==3)
    Gen3status='Closed';
end
% fprintf(fileID,['//Add Generator Real Power and Voltage for Gen 1\n']);
fprintf(fileID,['DATA (GEN, [BusNum,BusName,GenID,VoltSet,GenMW,GenStatus])\n']);
fprintf(fileID,['{\n']);
fprintf(fileID,['44142 "CHJ 0304" 03 ',num2str(abs(Vm3),12),' ',num2str(Pm3,12),' ',Gen3status,'\n']);
fprintf(fileID,['}\n\n']);

%Generator 4
if find(GensOnList==4)
    Gen4status='Closed';
end
% fprintf(fileID,['//Add Generator Real Power and Voltage for Gen 1\n']);
fprintf(fileID,['DATA (GEN, [BusNum,BusName,GenID,VoltSet,GenMW,GenStatus])\n']);
fprintf(fileID,['{\n']);
fprintf(fileID,['44142 "CHJ 0304" 04 ',num2str(abs(Vm3),12),' ',num2str(Pm3,12),' ',Gen4status,'\n']);
fprintf(fileID,['}\n\n']);

fprintf(fileID,['SCRIPT\n']);
fprintf(fileID,['{\n']);
% fprintf(fileID,['//Enter Run Mode\n']);
fprintf(fileID,['EnterMode(RUN);\n']);
% fprintf(fileID,['//Solve Power Flow\n']);
fprintf(fileID,['SolvePowerFlow (RECTNEWT,"","");\n']);
% fprintf(fileID,['SaveCase("%s");\n'],filename_PlayInCase);
fprintf(fileID,['}\n\n']);
fclose(fileID);
end
