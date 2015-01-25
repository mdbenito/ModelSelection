function t = getTosses(N, r)
  for k=1:N
    rnd = unifrnd(0, 1);
    if (rnd>=r)
      t(k) = 1;
    else 
      t(k) = 0;
    end
  end
end
    
