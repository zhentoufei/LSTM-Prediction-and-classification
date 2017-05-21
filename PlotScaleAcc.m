
y1=[78.21 86.97	93.32	95.24	97.30]
y2=[64.2 65.01	85.73	90.22	93.43]

y3=[79.91 83.31	84.33	85.24	85.30]
y4=[72.2 75.01	81.23	82.31	83.43]
plot(y1,'--*r','linewidth',2.5)
hold on
plot(y2,'-+r','linewidth',2.5)
hold on
plot(y3,'--*k','linewidth',2.5)
hold on
plot(y4,'-+k','linewidth',2.5)
set(gca,'xtick',1:1:5);

set(gca,'xticklabel',{'0','1','2','3','4'});
axis([0.9 5.1 45 100])

set(gca,'FontSize',15,'Fontname','Times New Roman');
xlabel('Scale,Sample=2549698,Timestep=400','FontSize',15)
ylabel('Accuracy(%)','FontSize',15)
legh=legend('Train accuracy','Validation  accuracy')
set(legh,'position',[0.66 0.16 0.1 0.05],'FontSize',15)
set(gcf,'PaperUnits','inches','PaperPosition',[0 0 8 5])
saveas(gcf,'E:\workspace\matlab\Result\sampleNum\timestep500acc1','tif');