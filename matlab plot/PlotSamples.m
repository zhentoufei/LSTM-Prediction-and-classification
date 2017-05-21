clc;
clear all;
data100acc = xlsread('E:\workspace\matlab\data\samples\accInfo200000.csv'); 
data200acc = xlsread('E:\workspace\matlab\data\samples\accInfo600000.csv');  
data300acc = xlsread('E:\workspace\matlab\data\samples\accInfo1000000.csv');  
data400acc = xlsread('E:\workspace\matlab\data\samples\accInfo1500000.csv'); 
data500acc = xlsread('E:\workspace\matlab\data\samples\accInfo2000000.csv');  
data600acc = xlsread('E:\workspace\matlab\data\samples\accInfo2540000.csv'); 

fontslabel=29
fonts=21

subplot(3,2,1)
plot(data100acc,'linewidth',0.5)
ylabel('Accuracy','FontSize',fontslabel)
set(gca,'xtick',0:300:2500);
axis([0 2500 0 1])
set(gca,'FontSize',fonts);
set(gca,'xticklabel',{'0','3','6','9','12','15','18','21','24'});
xlabel('Iterations(x100),sample = 2x10^5','FontSize',fontslabel)

subplot(3,2,2)
plot(data200acc,'linewidth',0.5)
ylabel('Accuracy','FontSize',fontslabel)
set(gca,'xtick',0:800:7500);
axis([0 7500 0 1])
set(gca,'FontSize',fonts);
set(gca,'xticklabel',{'0','8','16','24','32','40','48','56','64','72'});
xlabel('Iterations(x100),sample = 6x10^5','FontSize',fontslabel)

subplot(3,2,3)
plot(data300acc,'linewidth',0.5)
ylabel('Accuracy','FontSize',fontslabel)
set(gca,'xtick',0:1300:12500);
axis([0 12500 0 1])
set(gca,'FontSize',fonts);
set(gca,'xticklabel',{'0','1.3','2.6','3.9','5.2','6.5','7.8','9.1','10.4','11.7'});
xlabel('Iterations(x10^3),sample = 1x10^6','FontSize',fontslabel)

subplot(3,2,4)
plot(data400acc,'linewidth',0.5)
ylabel('Accuracy','FontSize',fontslabel)
axis([0 18750 0 1])
set(gca,'FontSize',fonts);
set(gca,'xtick',0:2000:18750);
set(gca,'xticklabel',{'0','2','4','6','8','10','12','14','16','18'});
xlabel('Iterations(x10^3),sample = 1.5x10^6','FontSize',fontslabel)

subplot(3,2,5)
plot(data500acc,'linewidth',0.5)
ylabel('Accuracy','FontSize',fontslabel)
set(gca,'xtick',0:3000:25000);
axis([0 25000 0 1])
set(gca,'FontSize',fonts);
set(gca,'xticklabel',{'0','0.3','0.6','0.9','1.2','1.5','1.8','2.1','2.4'});
xlabel('Iterations(x10^4),sample = 2x10^6','FontSize',fontslabel)

subplot(3,2,6)
plot(data600acc,'linewidth',0.5)
ylabel('Accuracy','FontSize',fontslabel)
set(gca,'xtick',0:2900:29015);
axis([0 29015 0 1])
set(gca,'FontSize',fonts);
set(gca,'xticklabel',{'0','0.3','0.6','0.9','1.2','1.5','1.8','2.1','2.4','2.7','3'});
xlabel('Iterations(x10^4),sample = 2.32x10^6','FontSize',fontslabel)
set(gcf,'PaperUnits','inches','PaperPosition',[0 0 19 20])
