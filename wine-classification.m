annInputs = xlsread('crazy2.xlsx', 'input');
annOutputs = xlsread('crazy2.xlsx', 'output');

annInputs = annInputs';
annOutputs = annOutputs';

size(annInputs);
size(annOutputs);
arch = 10;


ann  = patternnet(arch);

[ann, tr]= train(ann, annInputs, annOutputs);
