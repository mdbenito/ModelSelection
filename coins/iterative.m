clear();

Num = 50;
r = 0.8;

t = getTosses(Num, r);
numZerosUntil = [0, cumsum(1-t)];

ratio = ones(Num+2, 1);
prefH0 = ones(Num+2, 1);
for N=0:Num-1
  K = numZerosUntil(N+1);
  ratio(N+2) = ((N+2)/(2*(K+1))*(1-t(N+1)) + (N+2)/(2*(N+1-K))*t(N+1))*ratio(N+1);
  Kp = numZerosUntil(N+2);
  prefH0(N+2) = nchoosek(N+1, Kp)*(N+2)*2^(-(N+1));
end

figure(1);
clf();
hold on;
plot(ratio);
plot(prefH0, 'rs', 'MarkerSize', 20);
