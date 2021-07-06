function [sn sn2 Maxx Minx] = myNormSer(st,st2)
    Maxx = max(max(max(st)),max(max(st2)));
    Minx = min(min(min(st)),min(min(st2)));
    [z,k] = size(st);
for i = 1:k
  for j = 1:z
    sn(j,i) = 1-((Maxx - st(j,i))/(Maxx - Minx));
end;
end


[z,k] = size(st2);
for i = 1:k
  for j = 1:z
    sn2(j,i) = 1-((Maxx - st2(j,i))/(Maxx - Minx));
end;
end
