function v2 = MyQS2(v, i0, i1)

v2 = v; 

if (i0 < i1)
     [v2, p] = MyQS_Partition(v, i0, i1);
     v2 = MyQS2 (v2, i0, p-1);
     v2 = MyQS2 (v2, p+1, i1);
end


