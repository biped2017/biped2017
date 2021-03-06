clear all
close all

LnWidth = 4;
MrkrSize = 12;
FontSizeT = 14;
FontSize = 12;
FontSize2 = 10;
FitLabels = {
    'Normalized Velocity fitness',...
    'Energy fitness',...
    'Stability fitness',...
    'Normalized Slope fitness',...
    'Uphill fitness',...
    'Downhill fitness'};
load('GA_11_24_10_25');
% load('GA_Final2');
SelectedGen = 4;

% Normalize fitness
% max(max(GA.Fit(:,1,:)))
GA.Fit(:,1,:) = GA.Fit(:,1,:)/max(max(GA.Fit(:,1,:)));
% max(max(GA.Fit(:,4,:)))
GA.Fit(:,4,:) = GA.Fit(:,4,:)/max(max(GA.Fit(:,4,:)));

%%%%%%%%%%%%%%%%%%%%%%%%%%% First Plot %%%%%%%%%%%%%%%%%%%%%%%%%%%
Fits = [1 2];
Fi = [1, 10, 20];
NF = length(Fi);

figure('units','normalized','Position',[0.0953, 0.3870, 0.3161, 0.3139])
Data = [GA.Fit(:,Fits,GA.Progress),(1:GA.Population)'];
Fronts = GA.Pareto(Data);
subplot(1,2,1);
hold on
for f = 1:NF
    FrData = sortrows(Data(Fronts{Fi(f)},:));
    x = FrData(:,1);
    y = FrData(:,2);
    Color = f/NF*[1, 0, 0] + (1-f/NF)*[0, 0.8, 0];
    plot(x,y,'-x','Color',Color,'LineWidth',3,'MarkerSize',12);
end
% Add the selected genome
GenFit = GA.Fit(SelectedGen,Fits,GA.Progress);
plot(GenFit(1),GenFit(2),'ko','MarkerSize',12,...
    'MarkerFaceColor',[0 0 0]);
xlabel(FitLabels{Fits(1)},'FontSize',FontSize)
ylabel(FitLabels{Fits(2)},'FontSize',FontSize)
set(gca,'FontSize',FontSize2,'LineWidth',LnWidth/2)
title('A','FontSize',FontSizeT);

%%%%%%%%%%%%%%%%%%%%%%%%%%% Second Plot %%%%%%%%%%%%%%%%%%%%%%%%%%%
Fits = [1 4];
Fi = [1, 10, 20];
NF = length(Fi);

Data = [GA.Fit(:,Fits,GA.Progress),(1:GA.Population)'];
Fronts = GA.Pareto(Data);
subplot(1,2,2);
hold on
for f = 1:NF
    FrData = sortrows(Data(Fronts{Fi(f)},:));
    x = FrData(:,1);
    y = FrData(:,2);
    Color = f/NF*[1, 0, 0] + (1-f/NF)*[0, 0.8, 0];
    plot(x,y,'-x','Color',Color,'LineWidth',3,'MarkerSize',12);
end
% Add the selected genome
GenFit = GA.Fit(SelectedGen,Fits,GA.Progress);
plot(GenFit(1),GenFit(2),'ko','MarkerSize',12,...
    'MarkerFaceColor',[0 0 0]);
xlabel(FitLabels{Fits(1)},'FontSize',FontSize)
ylabel(FitLabels{Fits(2)},'FontSize',FontSize)
set(gca,'FontSize',FontSize2,'LineWidth',LnWidth/2)
title('B','FontSize',FontSizeT);

% Data = [GA.Fit(:,[7 8],GA.Progress),(1:GA.Population)'];
% Fronts = GA.Pareto(Data);
% subplot(1,3,3);
% hold on
% for f = 1:NF
%     FrData = sortrows(Data(Fronts{Fi(f)},:));
%     x = FrData(:,1);
%     y = FrData(:,2);
%     Color = f/NF*[1, 0, 0] + (1-f/NF)*[0, 0.8, 0];
%     plot(x,y,'-x','Color',Color,'LineWidth',3,'MarkerSize',12);
% end
% xlabel('Downhill slope fitness','FontSize',FontSize)
% ylabel('ZMP fitness','FontSize',FontSize)
% set(gca,'FontSize',FontSize2)
% title('C','FontSize',FontSizeT);