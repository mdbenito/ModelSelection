clear();
N = 1002
for K=0:N

rML = K/N;

prefH0 = nchoosek(N, K)*(N+1)*2^(-N);

p0(K+1) = prefH0/(1+prefH0);
end
hold off;
plot(0:K, p0)
hold on;
plot(0:K, 0.5*ones(1, K+1))
