annInputs = xlsread('auto-mpg-better.xlsx', 'input');
annOutputs = xlsread('auto-mpg-better.xlsx', 'output');

annInputs = annInputs';
annOutputs = annOutputs';

disp(size(annInputs));
disp(size(annOutputs));



meanError = [];
stdError = [];

trainError = []; 
validationError = [];
testError = [];  
for k=1:2
    for i=1:3 
            ann = feedforwardnet(k); 
            ann.trainParam.showWindow = true;  
            [ann, tr] = train(ann, annInputs, annOutputs); 
            trainError(end+1)  = tr.best_perf;  
            validationError(end+1) = tr.best_vperf; 
            testError(end+1)  = tr.best_tperf; 
    end


meanError(end+1) = mean(testError);
   
stdError(end+1) = std(testError);

end

disp(stdError);

disp(meanError);

figure;plot(stdError(end,:));

figure;plot(meanError(end,:));