clear();
num = 100;
tosses = getTosses(num, .55); # 0=Heads, 1=Tails

disp(sum(1-tosses)/length(tosses));
numHeads = [0, cumsum(1-tosses)];
beliefs = zeros(1, size(tosses, 2));
beliefs(1) = 1;
for k=2:size(beliefs, 2)+1
  N = k-2;
  K = numHeads(k-1);
  if (tosses(k-1) == 0)
  beliefs(k) = 1/2*(N+2)/(K+1)*beliefs(k-1);
  else
  beliefs(k) = 1/2*(N+2)/(N+1-K)*beliefs(k-1);
  end
  #beliefs(k) = 1/2*(N+2)*(tosses(k-1)/(N+1-K)+(1-tosses(k-1))/(K+1))*beliefs(k-1);
end
prob0 = beliefs./(1+beliefs);
prob0(end)
hold off;
plot(prob0);
ylim([0 1])
