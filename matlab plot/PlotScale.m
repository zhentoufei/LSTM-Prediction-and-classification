clc;
clear all;
data100acc = xlsread('E:\workspace\matlab\data\scale\accInfo_Scale0.csv'); 
data200acc = xlsread('E:\workspace\matlab\data\scale\accInfo_Scale1.csv'); 
data300acc = xlsread('E:\workspace\matlab\data\scale\accInfo_Scale2.csv');  
data400acc = xlsread('E:\workspace\matlab\data\scale\accInfo_Scale3.csv');  
data500acc = xlsread('E:\workspace\matlab\data\scale\accInfo_Scale4.csv'); 

%设置字体的大小
fontslabel=35
fonts=29
%画Scale = 4
subplot(2,2,1)
plot(data500acc,'linewidth',0.5)
set(gca,'FontSize',fonts,'Fontname','Times New Roman');
ylabel('Accuracy','FontSize',fontslabel)
set(gca,'xtick',0:3000:29015);
set(gca,'xticklabel',{'0','1','2','3','4','5','6','7','8','9','10'});
xlabel('Iterations(x10^4),Scale = 4','FontSize',fontslabel)

%画Scale = 3
subplot(2,2,2)
plot(data400acc,'linewidth',0.5)
set(gca,'FontSize',fonts,'Fontname','Times New Roman');
ylabel('Accuracy','FontSize',fontslabel)
set(gca,'xtick',0:3000:29015);
set(gca,'xticklabel',{'0','1','2','3','4','5','6','7','8','9','10'});
xlabel('Iterations(x10^4),Scale = 3','FontSize',fontslabel)

%画Scale = 2
subplot(2,2,3)
plot(data300acc,'linewidth',0.5)
set(gca,'FontSize',fonts,'Fontname','Times New Roman');
ylabel('Accuracy','FontSize',fontslabel)
set(gca,'xtick',0:3000:29015);
set(gca,'xticklabel',{'0','1','2','3','4','5','6','7','8','9','10'});
xlabel('Iterations(x10^4),Scale = 2','FontSize',fontslabel)

%画Scale = 1
subplot(2,2,4)
plot(data200acc,'linewidth',0.5)
set(gca,'FontSize',fonts,'Fontname','Times New Roman');
ylabel('Accuracy','FontSize',fontslabel)
set(gca,'xtick',0:3000:31875);
set(gca,'xticklabel',{'0','1','2','3','4','5','6','7','8','9','10'});
xlabel('Iterations(x10^4),Scale = 1','FontSize',fontslabel)
set(gcf,'PaperUnits','inches','PaperPosition',[0 0 19 13])
% saveas(gcf,'E:\workspace\matlab\Result\scale\scale500acc','tif');