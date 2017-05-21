clc;
clear all;
data200acc = xlsread('E:\workspace\matlab\data\timestep\accInfo_Timestep200.csv'); 
data300acc = xlsread('E:\workspace\matlab\data\timestep\accInfo_Timestep300.csv');  
data400acc = xlsread('E:\workspace\matlab\data\timestep\accInfo_Timestep400.csv');  
data500acc = xlsread('E:\workspace\matlab\data\timestep\accInfo_Timestep500.csv'); 

fontslabel=29
fonts=23

subplot(2,2,4)
plot(data200acc,'linewidth',0.5)
ylabel('Accuracy','FontSize',fontslabel)
set(gca,'xtick',0:10000:116000);
set(gca,'FontSize',fonts);
axis([0 116000 0 1])
set(gca,'xticklabel',{'0','1','2','3','4','5','6','7','8','9','10','11'});
xlabel('Iterations(x10^4),timstep = 200','FontSize',fontslabel)

subplot(2,2,3)
plot(data300acc,'linewidth',0.5)
ylabel('Accuracy','FontSize',fontslabel)
set(gca,'xtick',0:3868:38685);
set(gca,'FontSize',fonts);
axis([0 38685 0 1])
set(gca,'xticklabel',{'0','0.4','0.8','1.2','1.6','2','2.4','2.8','3.2','3.6','4'});
xlabel('Iterations(x10^4),timstep = 300','FontSize',fontslabel)

subplot(2,2,2)
csvwrite('E:\workspace\matlab\data\accInfo_Timestep400.csv',data400acc')
plot(data400acc,'linewidth',0.5)
ylabel('Accuracy','FontSize',fontslabel)
set(gca,'xtick',0:2900:29015);
set(gca,'FontSize',fonts);
axis([0 29015 0 1])
set(gca,'xticklabel',{'0','0.3','0.6','0.9','1.2','1.5','1.8','2.1','2.4','2.7','3'});
xlabel('Iterations(x10^4),timstep = 400','FontSize',fontslabel)

subplot(2,2,1)
csvwrite('E:\workspace\matlab\data\accInfo_Timestep500.csv',data500acc')
plot(data500acc,'linewidth',0.5)
ylabel('Accuracy','FontSize',fontslabel)
set(gca,'xtick',0:2321:23210);
set(gca,'FontSize',fonts);
axis([0 23210 0 1])
set(gca,'xticklabel',{'0','0.25','0.5','0.75','1','1.25','1.5','1.75','2','2.25','2.5'});
xlabel('Iterations(x10^4),timstep = 500','FontSize',fontslabel)
set(gcf,'PaperUnits','inches','PaperPosition',[0 0 19 13])