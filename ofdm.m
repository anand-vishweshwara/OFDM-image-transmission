clc; clear; close all;
trials=50;
ber=[];
psnr=[];
url = "https://static.vecteezy.com/system/resources/thumbnails/057/551/761/small/wonderful-classic-ceramic-vase-with-flowers-side-view-transparent-background-genuine-png.png";
photo = imread(url);
rgb = rgb2gray(photo);
im = imresize(rgb, [128, 128]); 
imgresize = double(im(:)');
snr=0:2:20;
for k=1:(length(snr))
    recovery=[];
    data = de2bi(imgresize, 8, "left-msb");
    total_errors=0;
    total_bits=0;
    for i=1:trials
        len_bits=numel(data);
        N=1024;
        ofdm_carriers=N/4;
        CP=16;
        if(snr(k)<=10)
            data=data(:);
            s=1-2*data;
        else
            data=reshape(data, [], 2);
            s_real=1-2*data(:, 1);
            s_complex=1-2*data(:, 2);
            s=s_real+1i*s_complex;
        end
        s_reshaped=reshape(s, ofdm_carriers, []);
        [r1, c1]=size(s_reshaped);
        transform=ifft(s_reshaped);
        transmit=transform(end-CP+1:end, :);
        [rows, columns]=size(transmit);
        final_transmit=[transmit; transform];
        [r2, c2]=size(final_transmit);
        t=final_transmit(:);
        h=(randn()+1i*randn())/sqrt(2);
        channel=h*t;
        finalnoise=awgn(channel, snr(k), 'measured');
        r=reshape(finalnoise, r2, []);
        receive=r(CP+1:end, :);
        receive=receive/h;
        inverse=fft(receive);
        if(snr(k)<=10)
            recovery=(inverse<=0);
            final=recovery(:);
        else
            inverse=reshape(inverse, [], 1);
            
            recovery(:, 1)=(real(inverse)<=0);
            recovery(:, 2)=(imag(inverse)<=0);
            final=reshape(recovery, [], 2);
        end
        receivepixel=reshape(final, [], 8);
        finalpixel=bi2de(receivepixel, "left-msb");
        pixel=reshape(finalpixel, 128, 128);
        error=final~=data;
       
        if(snr(k)<=10)
            total_errors=total_errors+sum(error);
        else
            total_errors = total_errors + sum(error(:));
        end
        total_bits=total_bits+len_bits;
        mse=mean((double(im(:))-pixel(:)).^2);
        psnrvalue=10*log10(255^2/mse);
    end
    bervalue=total_errors/total_bits;
    ber=[ber, bervalue];
    psnr=[psnr, psnrvalue];


end
subplot(121);
semilogy(snr, ber, 'r', Linewidth=1.5);
xlabel("snr");
ylabel("ber");
grid on;
title("snr vs ber for ofdm transmission system");
subplot(122);
plot(snr, psnr, 'r', Linewidth=1.5);
xlabel("snr");
ylabel("psnr");
grid on;
title("psnr vs snr for ofdm transmission system");
figure;
subplot(121);
imshow(im);
title("transmitted image");
subplot(122);
imshow(uint8(pixel));
title("received image");

