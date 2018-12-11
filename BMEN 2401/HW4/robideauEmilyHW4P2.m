a1=input('Is the tumor well-differentiated? (1 = yes, 0 = no)');
if (a1 == 1)
    a2=input('Classify the tumor as (1) resectable, (2) locally advanced, or (3) metastatic');
    if (a2 == 1)
        disp('surgery');
    elseif (a2 == 2)
        disp('chemotherapy (temozolomide- or streptozocin-based), targeted therapies (?), or PRRT(?) SSA');
    else
        a4=input('Are the metastases confined to the liver (1=yes, 0=no)');
            if (a4 == 0)
                disp('chemotherapy (temozolomide- or streptozocin-based), targeted therapies (?), or PRRT(?) SSA, RFA, and/or TAE/TACE');
            else
                disp('surgery');
            end
    end
else
    ab=input('Is the tumor resectable? (1 = yes, 0 = no)');
    if (ab == 1)
        disp('surgery, evaluate adjuvant chemotherapy, especially in N* patients');
    else
        disp('chemotherapy');
        a3=input('What is the ki67 index (%)?');
        if (a3 >= 55)
            disp('Platinum-based chemotherapy (i.e. cisplatin + etoposide)');
        else
            disp('Consider alternative regimens to platinum-based chemotherapy (i.e. temozolomide + capecitabine)');
        end
    end
end