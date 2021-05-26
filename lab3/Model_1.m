clearvars ;

load('rec1_20kph_break0.mat');
file_data=iddata(rec1_013.speed',[],rec1_013.tsim.Delta);
model_based_on_data=armax(file_data,[1 1]);
A1=model_based_on_data.A;
bf1=(A1(2)+1)*350/rec1_013.tsim.Delta;
subplot(2,1,1);
compare(file_data,model_based_on_data);
title({["Porównanie modelu zidentyfikowanego na podstawie"]
       [" pliku rec1 20kph break0 z danymi tego pliku"]});

   
   
load('rec1_gas0-100.mat');
file_data=iddata(rec1_006.speed', rec1_006.force',rec1_006.tsim.Delta);
model_based_on_data=armax(file_data,[1 1 0 1]);
A2=model_based_on_data.A;
B2=model_based_on_data.B;
bf2=(A2(2)+1)*350/rec1_006.tsim.Delta;
ba2=B2(2)*350/rec1_006.tsim.Delta;
subplot(2,1,2);

compare(file_data,model_based_on_data);
title({["Porównanie modelu zidentyfikowanego na podstawie"]
       [" pliku rec1 gas0-100 z danymi tego pliku"]});
