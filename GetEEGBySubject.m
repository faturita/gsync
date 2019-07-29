% Signal Averaging x Selection g.Tec Dataset.

% Standard P300 Experiment [3,4,6,7];
% Passive P300 Experiment  [21,24,25,26]

globalsubjectrange = [ 24 ];
globalrandomdelay = false;
globalrandomamplitude = false;
globalsignalgain=2.2;

rng(396545);

% NN.NNNNN
% data.X(sample, channel)
% data.y(sample)  --> 0: no, 1:nohit, 2:hit
% data.y_stim(sample) --> 1-12, 1-6 cols, 7-12 rows

%     'Fz'    'Cz'    'Pz'    'Oz'    'P3'    'P4'    'PO7'    'PO8'

channels={ 'Fz'  ,  'Cz',    'P3' ,   'Pz'  ,  'P4'  , 'PO7'   , 'PO8',  'Oz'};


% Parameters ==========================
subjectRange=globalsubjectrange;
Fs=250;
windowsize=1;

downsize=15;
    
randomdelay=globalrandomdelay;
randomamplitude=globalrandomamplitude;

% =====================================

% EEG(subject,trial,flash)
if (subjectRange(1)<20)
    EEG = prepareEEG(Fs,windowsize,downsize,120,subjectRange,1:8,globalsignalgain,true,false,0,randomdelay,randomamplitude);
    EEG = DrugEEG(subjectRange,globalsignalgain,EEG,globalrandomdelay,globalrandomamplitude);
else
    EEG = prepareEEG(Fs,windowsize,downsize,120,subjectRange,1:8,globalsignalgain,true,true,0,randomdelay,randomamplitude);    
end

% EEG contains the epoched data.