function [data] = PowerWorld_WriteDYD_Run_CHJ1_RealPMU(filenamedyd,gentpj,exst1,hyg3,SimAuto,filename_RunAux,filename_PlayInCase,filename_SetupAux,Ipmu,Vpmu,XFMR2,XFMR1,wsccst,XFMR3,GensOnList);
%PowerWorld_WriteDYD This function uses a series of other functions to write a
%PSLF dyd file which is later used by a PowerWorld simulation which is ran by
%using the SimAuto Add-on. An aux file is written to 

%% Setup PowerWorld Case  
SetupCase_CHJ1(filename_SetupAux,filename_PlayInCase,Ipmu,Vpmu,SimAuto,XFMR1,XFMR2,XFMR3,GensOnList)

%% Open dyd File
fileID=fopen(filenamedyd,'w+');    %Open/create file for reading and writing.
%Discards previous contents.

%% Call Functions to Add Models to dyd File
fprintf(fileID,'models\n');

% 1st Generator
gentpj_dyd(fileID,'44141','CHJ 0102','13.80','01','mva=92.92',num2str(gentpj(1,1),10),num2str(gentpj(1,2),10),num2str(gentpj(1,3),10),num2str(gentpj(1,4),10),num2str(gentpj(1,5),10),num2str(gentpj(1,6),10),num2str(gentpj(1,7),10),num2str(gentpj(1,8),10),num2str(gentpj(1,9),10),num2str(gentpj(1,10),10),num2str(gentpj(1,11),10),num2str(gentpj(1,12),10),num2str(gentpj(1,13),10),num2str(gentpj(1,14),10),num2str(gentpj(1,15),10),num2str(gentpj(1,16),10),num2str(gentpj(1,17),10),num2str(gentpj(1,18),10),num2str(gentpj(1,19),10),num2str(gentpj(1,20),10));
exst1_dyd(fileID,'44141','CHJ 0102','13.80','01',num2str(exst1(1,1),10),num2str(exst1(1,2),10),num2str(exst1(1,3),10),num2str(exst1(1,4),10),num2str(exst1(1,5),10),num2str(exst1(1,6),10),num2str(exst1(1,7),10),num2str(exst1(1,8),10),num2str(exst1(1,9),10),num2str(exst1(1,10),10),num2str(exst1(1,11),10),num2str(exst1(1,12),10),num2str(exst1(1,13),10),num2str(exst1(1,14),10),num2str(exst1(1,15),10),num2str(exst1(1,16),10),num2str(exst1(1,17),10),num2str(exst1(1,18),10),num2str(exst1(1,19),10));
wsccst_dyd(fileID,'44141','CHJ 0102','13.80','01',num2str(wsccst(1,1),10),num2str(wsccst(1,2),10),num2str(wsccst(1,3),10),num2str(wsccst(1,4),10),num2str(wsccst(1,5),10),num2str(wsccst(1,6),10),num2str(wsccst(1,7),10),num2str(wsccst(1,8),10),num2str(wsccst(1,9),10),num2str(wsccst(1,10),10),num2str(wsccst(1,11),10),num2str(wsccst(1,12),10),num2str(wsccst(1,13),10),num2str(wsccst(1,14),10),num2str(wsccst(1,15),10),num2str(wsccst(1,16),10),num2str(wsccst(1,17),10),num2str(wsccst(1,18),10),num2str(wsccst(1,19),10),num2str(wsccst(1,20),10),num2str(wsccst(1,21),10),num2str(wsccst(1,22),10),num2str(wsccst(1,23),10),num2str(wsccst(1,24),10),num2str(wsccst(1,25),10),num2str(wsccst(1,26),10),num2str(wsccst(1,27),10),num2str(wsccst(1,28),10),num2str(wsccst(1,29),10));
hyg3_dyd(fileID,'44141','CHJ 0102','13.80','01','mwcap=89.0',num2str(hyg3(1,1),10),num2str(hyg3(1,2),10),num2str(hyg3(1,3),10),num2str(hyg3(1,4),10),num2str(hyg3(1,5),10),num2str(hyg3(1,6),10),num2str(hyg3(1,7),10),num2str(hyg3(1,8),10),num2str(hyg3(1,9),10),num2str(hyg3(1,10),10),num2str(hyg3(1,11),10),num2str(hyg3(1,12),10),num2str(hyg3(1,13),10),num2str(hyg3(1,14),10),num2str(hyg3(1,15),10),num2str(hyg3(1,16),10),num2str(hyg3(1,17),10),num2str(hyg3(1,18),10),num2str(hyg3(1,19),10),num2str(hyg3(1,20),10),num2str(hyg3(1,21),10),num2str(hyg3(1,22),10),num2str(hyg3(1,23),10),num2str(hyg3(1,24),10),num2str(hyg3(1,25),10),num2str(hyg3(1,26),10),num2str(hyg3(1,27),10),num2str(hyg3(1,28),10),num2str(hyg3(1,29),10),num2str(hyg3(1,30),10),num2str(hyg3(1,31),10),num2str(hyg3(1,32),10),num2str(hyg3(1,33),10),num2str(hyg3(1,34),10),num2str(hyg3(1,35),10));

% 2nd Generator
gentpj_dyd(fileID,'44141','CHJ 0102','13.80','02','mva=92.92',num2str(gentpj(2,1),10),num2str(gentpj(2,2),10),num2str(gentpj(2,3),10),num2str(gentpj(2,4),10),num2str(gentpj(2,5),10),num2str(gentpj(2,6),10),num2str(gentpj(2,7),10),num2str(gentpj(2,8),10),num2str(gentpj(2,9),10),num2str(gentpj(2,10),10),num2str(gentpj(2,11),10),num2str(gentpj(2,12),10),num2str(gentpj(2,13),10),num2str(gentpj(2,14),10),num2str(gentpj(2,15),10),num2str(gentpj(2,16),10),num2str(gentpj(2,17),10),num2str(gentpj(2,18),10),num2str(gentpj(2,19),10),num2str(gentpj(2,20),10));
exst1_dyd(fileID,'44141','CHJ 0102','13.80','02',num2str(exst1(2,1),10),num2str(exst1(2,2),10),num2str(exst1(2,3),10),num2str(exst1(2,4),10),num2str(exst1(2,5),10),num2str(exst1(2,6),10),num2str(exst1(2,7),10),num2str(exst1(2,8),10),num2str(exst1(2,9),10),num2str(exst1(2,10),10),num2str(exst1(2,11),10),num2str(exst1(2,12),10),num2str(exst1(2,13),10),num2str(exst1(2,14),10),num2str(exst1(2,15),10),num2str(exst1(2,16),10),num2str(exst1(2,17),10),num2str(exst1(2,18),10),num2str(exst1(2,19),10));
wsccst_dyd(fileID,'44141','CHJ 0102','13.80','02',num2str(wsccst(2,1),10),num2str(wsccst(2,2),10),num2str(wsccst(2,3),10),num2str(wsccst(2,4),10),num2str(wsccst(2,5),10),num2str(wsccst(2,6),10),num2str(wsccst(2,7),10),num2str(wsccst(2,8),10),num2str(wsccst(2,9),10),num2str(wsccst(2,10),10),num2str(wsccst(2,11),10),num2str(wsccst(2,12),10),num2str(wsccst(2,13),10),num2str(wsccst(2,14),10),num2str(wsccst(2,15),10),num2str(wsccst(2,16),10),num2str(wsccst(2,17),10),num2str(wsccst(2,18),10),num2str(wsccst(2,19),10),num2str(wsccst(2,20),10),num2str(wsccst(2,21),10),num2str(wsccst(2,22),10),num2str(wsccst(2,23),10),num2str(wsccst(2,24),10),num2str(wsccst(2,25),10),num2str(wsccst(2,26),10),num2str(wsccst(2,27),10),num2str(wsccst(2,28),10),num2str(wsccst(2,29),10));
hyg3_dyd(fileID,'44141','CHJ 0102','13.80','02','mwcap=89.0',num2str(hyg3(2,1),10),num2str(hyg3(2,2),10),num2str(hyg3(2,3),10),num2str(hyg3(2,4),10),num2str(hyg3(2,5),10),num2str(hyg3(2,6),10),num2str(hyg3(2,7),10),num2str(hyg3(2,8),10),num2str(hyg3(2,9),10),num2str(hyg3(2,10),10),num2str(hyg3(2,11),10),num2str(hyg3(2,12),10),num2str(hyg3(2,13),10),num2str(hyg3(2,14),10),num2str(hyg3(2,15),10),num2str(hyg3(2,16),10),num2str(hyg3(2,17),10),num2str(hyg3(2,18),10),num2str(hyg3(2,19),10),num2str(hyg3(2,20),10),num2str(hyg3(2,21),10),num2str(hyg3(2,22),10),num2str(hyg3(2,23),10),num2str(hyg3(2,24),10),num2str(hyg3(2,25),10),num2str(hyg3(2,26),10),num2str(hyg3(2,27),10),num2str(hyg3(2,28),10),num2str(hyg3(2,29),10),num2str(hyg3(2,30),10),num2str(hyg3(2,31),10),num2str(hyg3(2,32),10),num2str(hyg3(2,33),10),num2str(hyg3(2,34),10),num2str(hyg3(2,35),10));

% 3rd Generator
gentpj_dyd(fileID,'44142','CHJ 0304','13.80','03','mva=92.92',num2str(gentpj(3,1),10),num2str(gentpj(3,2),10),num2str(gentpj(3,3),10),num2str(gentpj(3,4),10),num2str(gentpj(3,5),10),num2str(gentpj(3,6),10),num2str(gentpj(3,7),10),num2str(gentpj(3,8),10),num2str(gentpj(3,9),10),num2str(gentpj(3,10),10),num2str(gentpj(3,11),10),num2str(gentpj(3,12),10),num2str(gentpj(3,13),10),num2str(gentpj(3,14),10),num2str(gentpj(3,15),10),num2str(gentpj(3,16),10),num2str(gentpj(3,17),10),num2str(gentpj(3,18),10),num2str(gentpj(3,19),10),num2str(gentpj(3,20),10));
exst1_dyd(fileID,'44142','CHJ 0304','13.80','03',num2str(exst1(3,1),10),num2str(exst1(3,2),10),num2str(exst1(3,3),10),num2str(exst1(3,4),10),num2str(exst1(3,5),10),num2str(exst1(3,6),10),num2str(exst1(3,7),10),num2str(exst1(3,8),10),num2str(exst1(3,9),10),num2str(exst1(3,10),10),num2str(exst1(3,11),10),num2str(exst1(3,12),10),num2str(exst1(3,13),10),num2str(exst1(3,14),10),num2str(exst1(3,15),10),num2str(exst1(3,16),10),num2str(exst1(3,17),10),num2str(exst1(3,18),10),num2str(exst1(3,19),10));
wsccst_dyd(fileID,'44142','CHJ 0304','13.80','03',num2str(wsccst(3,1),10),num2str(wsccst(3,2),10),num2str(wsccst(3,3),10),num2str(wsccst(3,4),10),num2str(wsccst(3,5),10),num2str(wsccst(3,6),10),num2str(wsccst(3,7),10),num2str(wsccst(3,8),10),num2str(wsccst(3,9),10),num2str(wsccst(3,10),10),num2str(wsccst(3,11),10),num2str(wsccst(3,12),10),num2str(wsccst(3,13),10),num2str(wsccst(3,14),10),num2str(wsccst(3,15),10),num2str(wsccst(3,16),10),num2str(wsccst(3,17),10),num2str(wsccst(3,18),10),num2str(wsccst(3,19),10),num2str(wsccst(3,20),10),num2str(wsccst(3,21),10),num2str(wsccst(3,22),10),num2str(wsccst(3,23),10),num2str(wsccst(3,24),10),num2str(wsccst(3,25),10),num2str(wsccst(3,26),10),num2str(wsccst(3,27),10),num2str(wsccst(3,28),10),num2str(wsccst(3,29),10));
hyg3_dyd(fileID,'44142','CHJ 0304','13.80','03','mwcap=89.0',num2str(hyg3(3,1),10),num2str(hyg3(3,2),10),num2str(hyg3(3,3),10),num2str(hyg3(3,4),10),num2str(hyg3(3,5),10),num2str(hyg3(3,6),10),num2str(hyg3(3,7),10),num2str(hyg3(3,8),10),num2str(hyg3(3,9),10),num2str(hyg3(3,10),10),num2str(hyg3(3,11),10),num2str(hyg3(3,12),10),num2str(hyg3(3,13),10),num2str(hyg3(3,14),10),num2str(hyg3(3,15),10),num2str(hyg3(3,16),10),num2str(hyg3(3,17),10),num2str(hyg3(3,18),10),num2str(hyg3(3,19),10),num2str(hyg3(3,20),10),num2str(hyg3(3,21),10),num2str(hyg3(3,22),10),num2str(hyg3(3,23),10),num2str(hyg3(3,24),10),num2str(hyg3(3,25),10),num2str(hyg3(3,26),10),num2str(hyg3(3,27),10),num2str(hyg3(3,28),10),num2str(hyg3(3,29),10),num2str(hyg3(3,30),10),num2str(hyg3(3,31),10),num2str(hyg3(3,32),10),num2str(hyg3(3,33),10),num2str(hyg3(3,34),10),num2str(hyg3(3,35),10));

% 4th Generator
gentpj_dyd(fileID,'44142','CHJ 0304','13.80','04','mva=92.92',num2str(gentpj(4,1),10),num2str(gentpj(4,2),10),num2str(gentpj(4,3),10),num2str(gentpj(4,4),10),num2str(gentpj(4,5),10),num2str(gentpj(4,6),10),num2str(gentpj(4,7),10),num2str(gentpj(4,8),10),num2str(gentpj(4,9),10),num2str(gentpj(4,10),10),num2str(gentpj(4,11),10),num2str(gentpj(4,12),10),num2str(gentpj(4,13),10),num2str(gentpj(4,14),10),num2str(gentpj(4,15),10),num2str(gentpj(4,16),10),num2str(gentpj(4,17),10),num2str(gentpj(4,18),10),num2str(gentpj(4,19),10),num2str(gentpj(4,20),10));
exst1_dyd(fileID,'44142','CHJ 0304','13.80','04',num2str(exst1(4,1),10),num2str(exst1(4,2),10),num2str(exst1(4,3),10),num2str(exst1(4,4),10),num2str(exst1(4,5),10),num2str(exst1(4,6),10),num2str(exst1(4,7),10),num2str(exst1(4,8),10),num2str(exst1(4,9),10),num2str(exst1(4,10),10),num2str(exst1(4,11),10),num2str(exst1(4,12),10),num2str(exst1(4,13),10),num2str(exst1(4,14),10),num2str(exst1(4,15),10),num2str(exst1(4,16),10),num2str(exst1(4,17),10),num2str(exst1(4,18),10),num2str(exst1(4,19),10));
wsccst_dyd(fileID,'44142','CHJ 0304','13.80','04',num2str(wsccst(4,1),10),num2str(wsccst(4,2),10),num2str(wsccst(4,3),10),num2str(wsccst(4,4),10),num2str(wsccst(4,5),10),num2str(wsccst(4,6),10),num2str(wsccst(4,7),10),num2str(wsccst(4,8),10),num2str(wsccst(4,9),10),num2str(wsccst(4,10),10),num2str(wsccst(4,11),10),num2str(wsccst(4,12),10),num2str(wsccst(4,13),10),num2str(wsccst(4,14),10),num2str(wsccst(4,15),10),num2str(wsccst(4,16),10),num2str(wsccst(4,17),10),num2str(wsccst(4,18),10),num2str(wsccst(4,19),10),num2str(wsccst(4,20),10),num2str(wsccst(4,21),10),num2str(wsccst(4,22),10),num2str(wsccst(4,23),10),num2str(wsccst(4,24),10),num2str(wsccst(4,25),10),num2str(wsccst(4,26),10),num2str(wsccst(4,27),10),num2str(wsccst(4,28),10),num2str(wsccst(4,29),10));
hyg3_dyd(fileID,'44142','CHJ 0304','13.80','04','mwcap=89.0',num2str(hyg3(4,1),10),num2str(hyg3(4,2),10),num2str(hyg3(4,3),10),num2str(hyg3(4,4),10),num2str(hyg3(4,5),10),num2str(hyg3(4,6),10),num2str(hyg3(4,7),10),num2str(hyg3(4,8),10),num2str(hyg3(4,9),10),num2str(hyg3(4,10),10),num2str(hyg3(4,11),10),num2str(hyg3(4,12),10),num2str(hyg3(4,13),10),num2str(hyg3(4,14),10),num2str(hyg3(4,15),10),num2str(hyg3(4,16),10),num2str(hyg3(4,17),10),num2str(hyg3(4,18),10),num2str(hyg3(4,19),10),num2str(hyg3(4,20),10),num2str(hyg3(4,21),10),num2str(hyg3(4,22),10),num2str(hyg3(4,23),10),num2str(hyg3(4,24),10),num2str(hyg3(4,25),10),num2str(hyg3(4,26),10),num2str(hyg3(4,27),10),num2str(hyg3(4,28),10),num2str(hyg3(4,29),10),num2str(hyg3(4,30),10),num2str(hyg3(4,31),10),num2str(hyg3(4,32),10),num2str(hyg3(4,33),10),num2str(hyg3(4,34),10),num2str(hyg3(4,35),10));
fclose(fileID);     %Closes file.

%% Run Simulation

%% Process Aux File to Load and Run Simulation
%Setup Aux File to Run Simulation
fileID = fopen(filename_RunAux,'w');
fprintf(fileID,['SCRIPT LoadDYD_RunPlayIn\n']);
fprintf(fileID,['{\n']);
fprintf(fileID,['//Clear Log\n']);
fprintf(fileID,['LogClear;\n'],filename_PlayInCase);

fprintf(fileID,['//Load Case\n']);
fprintf(fileID,['OpenCase("%s",PWB);\n'],filename_PlayInCase);

fprintf(fileID,['//Load SetupAux Aux File\n']);
fprintf(fileID,['LoadAux("SetupAux.aux");\n']);

fprintf(fileID,['//Load Aux File with PlayInData\n']);
fprintf(fileID,['LoadAux("PlayInData.aux");\n']);

fprintf(fileID,['//Enter Edit Mode\n']);
fprintf(fileID,['EnterMode(EDIT);\n']);

fprintf(fileID,['//Load Dyd File\n']);
fprintf(fileID,['TSLoadGE("CHJ1_PlayIn.dyd", NO, YES);\n']);


fprintf(fileID,['//Enter Run Mode\n']);
fprintf(fileID,['EnterMode(RUN);\n']);

% fprintf(fileID,['//AutoCorrect\n']);
% fprintf(fileID,['TSAutoCorrect;\n']);
% 'Auto Correct On'

fprintf(fileID,['//Solve Dynamic Simulation\n']);
fprintf(fileID,['TSSolveAll;\n']);

fprintf(fileID,['//Save to Log\n']);
fprintf(fileID,['LogSave("Log_PowerWorld.txt");\n']);

fprintf(fileID,['}\n\n']);
fclose(fileID);

 
% Make the processAuxFile call
simOutput = SimAuto.ProcessAuxFile(filename_RunAux);

%% Load Results into Matlab via TSGetContingencyResults
% Here we get the results for all of the angles directly into Matlab via SimAuto
%%
newCtgName = 'My Transient Contingency';
objFieldList = {'"Plot ''PlayInData''"' };
simOutput = SimAuto.TSGetContingencyResults(newCtgName, objFieldList , '0.0', '30.0');
if ~(strcmp(simOutput{1},''))
disp(simOutput{1})
else
% disp('GetTSResultsInSimAuto successful')
 
%Get the results
data.Data = simOutput{3};
 
%Get the header variables to use for plot labels
data.Header = simOutput{2};

% Convert a matrix of strings into a matrix of numbers and plot them
data.Data = str2double(data.Data);
end



end

