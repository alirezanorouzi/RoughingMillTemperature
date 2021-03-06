clc
clear
close all
%data=xlsread('\\Mac\Home\Desktop\Win desk\formatlabFur12.xls');
data=xlsread('\\Mac\Home\Documents\Courses\Foulad\prg\Matlab\formatlabFur1234.xls');
X=[data(:,1:2) data(:,5:15)];
X=round(X);
Y=data(:,4);

X=X(:,1:13);
%res=zeros(40,3);
inputs=X';
targets=Y';
i=7
%for i=1:40
    display(i)
    numHiddenNeurons = i;  % Adjust as desired
    net = newfit(inputs,targets,numHiddenNeurons);

    %net.layers{1}.size = 9;
    % hidden layer transfer function
    %net.layers{1}.transferFcn = 'logsig';

    net.divideParam.trainRatio = 70/100;  % Adjust as desired
    net.divideParam.valRatio = 15/100;  % Adjust as desired
    net.divideParam.testRatio = 15/100;  % Adjust as desired

    % Train and Apply Network
    [net,tr] = train(net,inputs,targets);
    outputs = sim(net,inputs);
    error=Y-outputs';
    mymse=mean(abs(error));
    outputs=round(outputs);
    res(i,1)=i;
    res(i,2)=mymse;
    res(i,3)=tr.perf(2);
%end
% Plot
plotperf(tr)
plotfit(net,inputs,targets)
plotregression(targets,outputs)

%round(sim(net,X(3,:)')),Y(3)
