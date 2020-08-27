close all;
clear all;


% Input DC motor sounds
[faulty,fs1]=audioread('faulty.wav');
[non_faulty,fs2]=audioread('non_faulty.wav');


% Segmentation process for faulty motor(deffining size of frames and overlap)

niz = faulty;
frame_faulty=(length(faulty)/800)*2-1;
frame_faulty=floor(frame_faulty);

for j = 1:frame_faulty
    for i = 1:800
        a(i,j) = niz(400*(j-1)+i);
    end
end

% Segmentation process for non_faulty motor(deffining size of frames and overlap)

niz1 = non_faulty;
frame_non_faulty=(lengthnon_faulty)/800)*2-1;
frame_non_faulty=floor(frame_non_faulty);

for j = 1:frame_non_faulty
    for i = 1:800
        a1(i,j) = niz1(400*(j-1)+i);
    end
end

% Wavelet decomposition for each frame of faulty motor
% db2 - Daubechies 2 wavelet, 8 - 8 levels of decomposition, approx_faulty
% - approximation coeficients, d_faulty - detail coeficients

for j = 1:frame_faulty
[c_faulty(:,j),L] = wavedec(a(:,j),8,'db2');
approx_faulty(:,j) = appcoef(c_faulty(:,j),L,'db2');
[d_faulty1(:,j),d_faulty2(:,j),d_faulty3(:,j),d_faulty4(:,j),d_faulty5(:,j),d_faulty6(:,j),d_faulty7(:,j),d_faulty8(:,j)] = detcoef(c_faulty(:,j),L,[1 2 3 4 5 6 7 8]);
end

% Wavelet decomposition for each frame of non_faulty motor

for j = 1:frame_ok
[c_non_faulty(:,j),L] = wavedec(a1(:,j),8,'db2');
approx_non_faulty = appcoef(c_non_faulty(:,j),L,'db2');
[d_non_faulty1(:,j),d_non_faulty2(:,j),d_non_faulty3(:,j),d_non_faulty4(:,j),d_non_faulty5(:,j),d_non_faulty6(:,j),d_non_faulty(:,j),d_non_faulty8(:,j)] = detcoef(c_non_faulty(:,j),L,[1 2 3 4 5 6 7 8]);
end

% Absolute mean values of detail coefficients

d_faulty1_mean=mean(abs(d_faulty1));
d_non_faulty1_mean=mean(abs(d_non_faulty1));

d_faulty2_mean=mean(abs(d_faulty2));
d_non_faulty2_mean=mean(abs(d_non_faulty2));

d_faulty3_mean=mean(abs(d_faulty3));
d_non_faulty3_mean=mean(abs(d_non_faulty3));

d_faulty4_mean=mean(abs(d_faulty4));
d_non_faulty4_mean=mean(abs(d_non_faulty4));

d_faulty5_mean=mean(abs(d_faulty5));
d_non_faulty5_mean=mean(abs(d_non_faulty5));

d_faulty6_mean=mean(abs(d_faulty6));
d_non_faulty6_mean=mean(abs(d_non_faulty6));

d_faulty7_mean=mean(abs(d_faulty7));
d_non_faulty7_mean=mean(abs(d_non_faulty7));

d_faulty8_mean=mean(abs(d_faulty8));
d_non_faulty8_mean=mean(abs(d_non_faulty8));

d13=mean([d_nok4_mean d_ok4_mean]);
diff_ind=mean(abs(d_nok4_mean-d_ok4_mean))/d13;


% Absolute values of standard deviation of detail coefficients

Std_faulty1=std(abs(d_faulty1));
Std_non_faulty1=std(abs(d_non_faulty1));

Std_faulty2=std(abs(d_faulty2));
Std_non_faulty2=std(abs(d_non_faulty2));

Std_faulty3=std(abs(d_faulty3));
Std_non_faulty3=std(abs(d_non_faulty3));

Std_faulty4=std(abs(d_faulty4));
Std_non_faulty4=std(abs(d_non_faulty4));

Std_faulty5=std(abs(d_faulty5));
Std_non_faulty5=std(abs(d_non_faulty5));

Std_faulty6=std(abs(d_faulty6));
Std_non_faulty6=std(abs(d_non_faulty6));

Std_faulty7=std(abs(d_faulty7));
Std_non_faulty7=std(abs(d_non_faulty7));

Std_faulty8=std(abs(d_faulty8));
Std_non_faulty8=std(abs(d_non_faulty8));

% Feature difference 

d1=mean([d_faulty1_mean d_non_faulty1_mean]);
diff_ind1=mean(abs(d_faulty1_mean-d_non_faulty1_mean))/d1;

d2=mean([d_faulty2_mean d_non_faulty2_mean]);
diff_ind2=mean(abs(d_faulty2_mean-d_non_faulty2_mean))/d2;

d3=mean([d_faulty3_mean d_non_faulty3_mean]);
diff_ind3=mean(abs(d_faulty3_mean-d_non_faulty3_mean))/d3;

d4=mean([d_faulty4_mean d_non_faulty4_mean]);
diff_ind4=mean(abs(d_faulty4_mean-d_non_faulty4_mean))/d4;

d5=mean([d_faulty5_mean d_non_faulty5_mean]);
diff_ind5=mean(abs(d_faulty5_mean-d_non_faulty5_mean))/d5;

d6=mean([d_faulty6_mean d_non_faulty6_mean]);
diff_ind6=mean(abs(d_faulty6_mean-d_non_faulty6_mean))/d6;

d7=mean([d_faulty7_mean d_non_faulty7_mean]);
diff_ind7=mean(abs(d_faulty7_mean-d_non_faulty7_mean))/d7;

d8=mean([d_faulty8_mean d_non_faulty8_mean]);
diff_ind8=mean(abs(d_faulty8_mean-d_non_faulty8_mean))/d8;


