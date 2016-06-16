function showFourier(toShow);
    figure;
    for ii = 1:length(toShow)
        subplot(3, length(toShow), ii);
        imshow(toShow{ii}, []);
        subplot(3, length(toShow), length(toShow) + ii);
        ft = log(abs(fftshift2(fft2(toShow{ii}))));
        imshow(ft, []);
        subplot(3, length(toShow), length(toShow)*2 + ii);
        ft = abs(fftshift2(fft2(toShow{ii})));
        imshow(ft, []);
    end
end