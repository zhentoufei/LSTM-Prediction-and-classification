y1=[85.67 90.23	96.76	97.63	97.01]
y2=[80.21 88.37	93.41	96.53	95.81]
plot(y1,'--*r','linewidth',2)
hold on
plot(y2,'-.<b','linewidth',2)
set(gca,'xtick',1:1:5);
set(gca,'xticklabel',{'100','200','300','400','500'});
axis([0.9 5.1 70 100])
set(gca,'FontSize',15);
xlabel('Timestep,Sample=2549698,Scale=4','FontSize',15)
ylabel('Accuracy(%)','FontSize',15)
legh=legend('Train accuracy','Validation  accuracy')
set(legh,'position',[0.68 0.16 0.1 0.05],'FontSize',15)
set(gcf,'PaperUnits','inches','PaperPosition',[0 0 8 5])