function [flag] = hyg3_dyd(fileID,n,name,kv,id,mva,Pmax,Pmin,Cflag,Rgate,Relec,Td,Tf,Tp,Velop,Velcl,K1,K2,Ki,Kg,Tt,db1,eps,db2,Tw,At,Dturb,qnl,H0,Gv1,Pgv1,Gv2,Pgv2,Gv3,Pgv3,Gv4,Pgv4,Gv5,Pgv5,Gv6,Pgv6)
%hyg3_dyd This function will write the PSLF hyg3 model to a dyd file.
%   fileID must be created before calling function.
%   All input arguments must be strings besides fileID.
%   flag=0 if complete, flag=1 if not complete 
%   Parameters:
%   Variable: Default Data:   Description:
% Pmin	0	Minimum	gate	opening,	p.u.	of	mwcap	
% Cflag	1	Governor	control	flag,	1:PID,	-1:Double	Derivative	
% Rgate	0	Steady-state	droop,	p.u.,	for	governor	output	feedback
% Relec	0.05	Steady-state	droop,	p.u.,	for	electrical	power	feedback
% Td	0.05	Input	filter	time	constant,	sec.		
% Tf	0.1	Washout	time	constant,	sec.			
% Tp	0.05	Gate	servo	time	constant,	sec.		
% Velop	0.2	Maximum	gate	opening	velocity,	p.u./sec		
% Velcl	-0.2	Maximum	gate	closing	velocity,	p.u./sec	(<	0.)
% K1	0.01	Derivative	gain,	p.u.				
% K2	2.5	Double	derivative	gain,	p.u.,	if	Cflag	=
% Ki	0.5	Integral	gain,	p.u.				
% Kg	2	Gate	servo	gain,	p.u.			
% Tt	0.2	Power	feedback	time	constant,	sec.		
% db1	0	Intentional	dead-band	width,	Hz.			
% eps	0	Intentional	db	hysteresis,	Hz.			
% db2	0	Unintentional	dead-band,	MW				
% Tw	1	Water	inertia	time	constant,	sec.		
% At	1.2	Turbine	gain,	p.u.				
% Dturb	0.2	Turbine	damping	factor,	p.u.			
% qnl	0.08	No-load	turbine	flow	at	nominal	head,	p.u.
% H0	1	Turbine	nominal	head,	p.u.			
% Gv1	0	Nonlinear	gain	point	1,	p.u.	gv	
% Pgv1	0	Nonlinear	gain	point	1,	p.u.	power	
% Gv2	0	Nonlinear	gain	point	2,	p.u.	gv	
% Pgv2	0	Nonlinear	gain	point	2,	p.u.	power	
% Gv3	0	Nonlinear	gain	point	3,	p.u.	gv	
% Pgv3	0	Nonlinear	gain	point	3,	p.u.	power	
% Gv4	0	Nonlinear	gain	point	4,	p.u.	gv	
% Pgv4	0	Nonlinear	gain	point	4,	p.u.	power	
% Gv5	0	Nonlinear	gain	point	5,	p.u.	gv	
% Pgv5	0	Nonlinear	gain	point	5,	p.u.	power	
% Gv6	0	Nonlinear	gain	point	6,	p.u.	gv	
% Pgv6	0	Nonlinear	gain	point	6,	p.u.	power	

flag=1;
fprintf(fileID,'hyg3     %s "%s" %s "%s" : #0 %s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s\n',...
    n,name,kv,id,mva,Pmax,Pmin,Cflag,Rgate,Relec,Td,Tf,Tp,Velop,Velcl,K1,K2,Ki,...
    Kg,Tt,db1,eps,db2,Tw,At,Dturb,qnl,H0,Gv1,Pgv1,Gv2,Pgv2,Gv3,Pgv3,Gv4,Pgv4,Gv5,Pgv5,Gv6,Pgv6);
flag=0;
end