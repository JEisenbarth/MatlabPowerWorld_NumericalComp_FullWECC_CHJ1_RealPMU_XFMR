function [flag] = wsccst_dyd(fileID,n,name,kv,id,J,Kqv,Tqv,Kqs,Tqs,Tq,Tq1,Tpq1,Tq2,Tpq2,Tq3,Tpq3,Vsmax,Vcutoff,Vslow,T1,T2,T3,Kboost,Dw1,Dw2,Ddwt,Tdelay,T4,Sw1,Td1,Td2,Vtl,Vk)
%wsccst_dyd This function will write the PSLF wsccst model to a dyd file.
%   fileID must be created before calling function.
%   All input arguments must be strings besides fileID.
%   flag=0 if complete, flag=1 if not complete 
%   Parameters:
%   Variable: Default Data:   Description:
% J	    0	Input	signal	code:	1	for	shaft	speed	2	for	accelerating	power	3	for	bus	frequency
% Kqv	0	Voltage	deviation	gain												
% Tqv	0	Voltage	transducer	time	constant,	sec.										
% Kqs	0	Main	input	signal	gain											
% Tqs	0	Main	input	signal	transducer	time	constant,	sec.								
% Tq	0	Stabilizer	washout	time	constant,	sec.										
% Tq1	0	Lag	time	constant,	sec.											
% Tpq1	0	Lead	time	constant,	sec.											
% Tq2	0	Lag	time	constant,	sec.											
% Tpq2	0	Lead	time	constant,	sec.											
% Tq3	0	Lag	time	constant,	sec.											
% Tpq3	0	Lead	time	constant,	sec.											
% Vsmax	0	Maximum	output	signal,	p.u.											
% Vcutoff	0	Voltage	deviation	level	for	stabilizer	cutout,	p.u.	(see	note	g)					
% Vslow	0	Minimum	output	signal,	sec.	(see	note	f)								
% T1	0	Not	used	(see	note	c)										
% T2	0	Not	used													
% T3	0	Not	used.													
% Kboost	0	Not	used													
% Dw1	0	Not	used													
% Dw2	0	Not	used													
% Ddwt	0	Not	used													
% Tdelay	0	Not	used													
% T4	0	Not	used													
% Sw1	0	Voltage	boost	signal	transient	stabilizer	manual	switch								
% Td1	0	Voltage	boost	signal	transient	stabilizer	lag,	sec.								
% Td2	0	Voltage	boost	signal	transient	stabilizer	washout	time	constant,	sec.						
% Vtl	0	Voltage	boost	signal	transient	stabilizer	terminal	voltage	limit.							
% Vk	0	Voltage	boost	signal	transient	stabilizer	boost	signal	magnitude,	p.u.						
flag=1;
fprintf(fileID,'wsccst     %s "%s" %s "%s" : #9 %s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s\n',...
    n,name,kv,id,J,Kqv,Tqv,Kqs,Tqs,Tq,Tq1,Tpq1,Tq2,Tpq2,Tq3,Tpq3,Vsmax,Vcutoff,Vslow,T1,T2,T3,Kboost,Dw1,Dw2,Ddwt,Tdelay,T4,Sw1,Td1,Td2,Vtl,Vk);
flag=0;
end