%  Source codes demo version 1.0 using matlab2023b 
% 
%  Author and programmer: Shengwei Fu  e-Mail: shengwei_fu@163.com 
%                                                                                                     
%  Paper : Modified LSHADE-SPACMA with new mutation strategy and external archive mechanism for numerical optimization and point cloud registration
% 
%  Journal : Artificial Intelligence Review
%
% If the code is useful to you, please cite our paper, thanks！
%_______________________________________________________________________________________________
% You can simply define your cost function in a seperate file and load its handle to fobj 
% The initial parameters that you need are:
%__________________________________________
% fobj = @YourCostFunction
% dim = number of your variables
% Max_iteration = maximum number of evaluations
% lb is the lower bound
% ub is the upper bound
% Function_name is Function Index (F1-F30)
%_______________________________________________________________________________________________


clear;clc;close all

Function_name = 1 ;
dim = 10 ;
lb = -100 ;  
ub = 100 ;
Max_iteration = 10000*dim; 

fobj = str2func('cec14_func');
% fobj = str2func('cec17_func');

Optimal_value = Function_name*100 ;

[sBest_mLSHADE_SPACMA, pBest_mLSHADE_SPACMA, conv_mLSHADE_SPACMA] = mLSHADE_SPACMA (Max_iteration,lb,ub,dim,fobj,Function_name);

display(['mLSHADE_SPACMA (Error) : ', num2str((sBest_mLSHADE_SPACMA-Optimal_value))]);

semilogy(conv_mLSHADE_SPACMA-Optimal_value, 'Color', [1, 0, 0], 'LineWidth', 2);
title(['CEC2014-F',num2str(Function_name),' (Dim=',num2str(dim),')'])
xlabel('FEs');
ylabel(['F',num2str(Function_name),' Error']);
axis tight
grid off
box on
legend('mLSHADE\_SPACMA')
set(gca,'looseInset',[0 0 0 0],'FontSize',12,'Fontname', 'Times New Roman');


