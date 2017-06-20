set(0,'DefaultLineLineWidth',2);set(0,'DefaultAxesFontSize',13);
Colors = linspecer(3);
figure;grid on;axis tight;hold on;
fplot(@(x) 2*x,[0,1.5],'LineWidth',2,'Color',Colors(1,:));
fplot(@(x) (2 + 7*exp(-3*x+4.5))/3,[1.5 4],'LineWidth',2,'Color',Colors(1,:));
set(gca,'TickDir','out');ylim(ylim*1.05);
line(xlim,[2/3 2/3],'Color',Colors(2,:),'LineStyle','--');
line([1.5,1.5],ylim,'Color',Colors(3,:),'LineStyle','--');
xlabel('Time (s)');ylabel('Q(t) (C)');
title('18.5: Charge over time for the circuit')
