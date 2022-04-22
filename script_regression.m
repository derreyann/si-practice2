annInputs = xlsread('auto-mpg.xlsx', 'input');
annOutputs = xlsread('auto-mpg.xlsx', 'output');

annInputs = annInputs';
annOutputs = annOutputs';

size(annInputs);
size(annOutputs);

arch = 10;

ann  = feedforwardnet(arch);

[ann, tr]= train(ann, annInputs, annOutputs);