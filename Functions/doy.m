function dayofyear = doy(dtobj)
% Takes an input datetime object and returns the day of the year it
% corresponds to

[y,m,d] = ymd(dtobj);
dayofyear = nan(length(dtobj),1);
dayofyear(m==1) = d(m==1);
dayofyear(m~=1) = d(m~=1) + arrayfun(@(m,y) sum(eomday(y,1:m-1)),m(m~=1),y(m~=1));