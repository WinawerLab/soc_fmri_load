%%% DEMO SCRIPT for soc_fmri_load repository %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% co - 2016-06-16

%% Choose a dataset

%data = load_subj004_2015_04_07();
%whichRoi = 'BV2';
%useXlabels = true;

%data = load_subj022_2015_06_19();
%whichRoi = 'RV1_2to4deg';
%useXlabels = true;

%data = load_subj001_2015_10_22();
%whichRoi = 'RV1_2to4deg';
%useXlabels = true;

data = load_subj001_2016_02_17();
whichRoi = 'LV1';
useXlabels = false;

%% Get the data to plot
roiIdx = strInCellArray(whichRoi, data.roiNames);
roiAvgData = data.roiBetamn{roiIdx};

%% Plot it
setupBetaFig;
plotWithColors(roiAvgData, data.plotOrder, data.plotNames, data.catColors, useXlabels)
title([data.title, ' dataset --- ', strrep(whichRoi,'_', '\_')])

%% Make our own Xlabels for the SF dataset rather than using category blocks
if strcmp(data.fmri_fname, 'wl_subj001_2016_02_17')
    set(gca, 'XTick', 1:length(data.plotOrder), 'XTickLabel', arrayfun(@num2str, data.stimuli.cpd, 'UniformOutput', false))
    xlabel('Cycles per degree')
end