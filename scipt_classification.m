annInputs = xlsread('crazy2.xlsx', 'input');
annOutputs = xlsread('crazy2.xlsx', 'output');

annInputs = annInputs';
annOutputs = annOutputs';

disp(size(annInputs));
disp(size(annOutputs));


meanError = [];
stdError = [];

Trainprecision = [];
Validationprecision = [];
Testprecision = []; 
for k=1:3
    
    for i=1:2
            ann = patternnet(k); 
            ann.trainParam.showWindow = true;  
            [ann, tr] = train(ann, annInputs, annOutputs); 
            CalcOutput = sim(ann, annInputs);
            Trainprecision(end+1) = 1-confusion(annOutputs(:,tr.trainInd),CalcOutput(:,tr.trainInd));
            Validationprecision(end+1)=1-confusion(annOutputs(:,tr.valInd),CalcOutput(:,tr.valInd));
            Testprecision(end+1)=1-confusion(annOutputs(:,tr.testInd),CalcOutput(:,tr.testInd));

    end 
   
    meanError(end+1) = mean(Testprecision);
    stdError(end+1) = std(Testprecision);

end

disp(stdError);

disp(meanError);

figure;plot(stdError(end,:));

figure;plot(meanError(end,:));