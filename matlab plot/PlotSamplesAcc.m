
y1=[85.78	91.76	95.63	97.45	97.87	97.72]
y2=[80.63	89.41	95.53	97.28	96.99	96.79]
plot(y1,'--*r','linewidth',2)
hold on
plot(y2,'-.<b','linewidth',2)
set(gca,'xtick',1:1:7);
set(gca,'xticklabel',{'2','6','10','15','20','25.4'});
axis([0.8 6.2 70 100])
set(gca,'FontSize',15);
xlabel('Samples(x10^5),Timestep=400,Scale=4','FontSize',15)
ylabel('Accuracy(%)','FontSize',15)
legh=legend('Train accuracy','Validation  accuracy')
set(legh,'position',[0.68 0.16 0.1 0.05],'FontSize',15)
set(gcf,'PaperUnits','inches','PaperPosition',[0 0 8 5])
saveas(gcf,'E:\workspace\matlab\Result\sampleNum\timestep500acc1','tif');