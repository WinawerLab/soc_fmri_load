function data = load_subj004_2015_04_07()
% Combines the fMRI data with stimulus and plotting information, for 
% ease of use

%% Get current data
fmri_fname = 'wl_subj004_2015_04_07';
load(fullfile(soc_fmripath, fmri_fname, 'GLMdenoised', 'roiBetas.mat'));
data = roiBetas;
data.fmri_fname = fmri_fname;

data.stimuli_fname = 'stimuli-2015-04-06.mat';
load(fullfile(soc_stimpath, data.stimuli_fname), 'stimuli');
data.stimuli = stimuli;

data.title = 'Pilot: waves, noisebars';

%% Plotting details - not as complicated as full experiment, fortunately =)
data.plotNames = {'gratings', 'gratings', 'gratings', ...
                  'noisebars', 'noisebars', 'noisebars', ...
                  'waves', 'waves', 'waves', ...
                  'patterns', 'patterns', 'patterns'};
              
data.plotOrder = 1:length(data.plotNames); % no reordering or interleaving

%% Assign bar colors
gratingsColor = [80, 130, 220] ./ 255; % blue
noisebarsColor = [120, 98, 86] ./ 255; % brown
wavesColor = [0, 115, 130] ./ 255; % green
patternsColor = [80, 40, 140] ./ 255; % purple

data.catColors = zeros(length(data.plotNames), 3);

gratingRows = ~cellfun(@isempty, strfind(data.plotNames, 'grating'));
data.catColors(gratingRows, :) = repmat(gratingsColor, length(find(gratingRows)), 1);

noiseRows = ~cellfun(@isempty, strfind(data.plotNames, 'noise'));
data.catColors(noiseRows, :) = repmat(noisebarsColor, length(find(noiseRows)), 1);

wavesRows = ~cellfun(@isempty, strfind(data.plotNames, 'waves'));
data.catColors(wavesRows, :) = repmat(wavesColor, length(find(wavesRows)), 1);

patternRows = ~cellfun(@isempty, strfind(data.plotNames, 'pattern'));
data.catColors(patternRows, :) = repmat(patternsColor, length(find(patternRows)), 1);

end