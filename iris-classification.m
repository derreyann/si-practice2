annInputs = xlsread('iris.xlsx', 'AAN input');
annOutputs = xlsread('iris.xlsx', 'ANN output');

annInputs = annInputs';
annOutputs = annOutputs';

arch = 3;
%arch = [4, 5]

ann  = patternnet(arch);

[ann, tr]= train(ann, annInputs, annOutputs);