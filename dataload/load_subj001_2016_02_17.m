function data = load_subj001_2016_02_17()
% Combines the fMRI data with stimulus and plotting information, for 
% ease of use

%% Get current data
fmri_fname = 'wl_subj001_2016_02_17';
load(fullfile(soc_fmripath, fmri_fname, 'GLMdenoised', 'roiBetas.mat'));
data = roiBetas;
data.fmri_fname = fmri_fname;

data.stimuli_fname = 'stimuli-2016-02-17-patterns.mat';
load(fullfile(soc_stimpath, data.stimuli_fname), 'stimuli');
data.stimuli = stimuli;

data.title = 'Spatial frequency pilot';

%% Plotting details
data.plotNames = {'highSF', 'highSF', 'highSF', ...
                  'midSF', 'midSF', 'midSF', ...
                  'lowSF', 'lowSF', 'lowSF'};
data.plotOrder = 1:length(data.plotNames); % no reordering or interleaving

colors = flipud(parula); % yellow = high SF, blue = low SF
data.catColors = colors(round(linspace(1, size(colors,1), length(data.plotNames))), :);

end