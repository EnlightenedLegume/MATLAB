function chnk = chunk(data,num)

ln = floor(length(data)/num);
data = data(1:num*ln);
chnk = reshape(data,num,ln);


