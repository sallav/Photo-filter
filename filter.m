
% luetaan kuva
original = imread("image.jpg");
original = imresize(original, 0.3);

% kuva liukuluvuiksi
im = double(original);

whitepoint = 0.7;
blackpoint = 0.2;

% normalisointi
im = im/max(im(:));

% skaalaus välille [0, 1]
im = im-min(im(:));

% blackpoint säätö
im = max(blackpoint, im);
im = im - blackpoint;

% whitepoint säätö
im = min(im, whitepoint);

% värikylläisyyden muokkaus
hsv = rgb2hsv(im); 
S = hsv(:,:,2); 
gamma = 70;
S = S.^gamma;

im = hsv2rgb(hsv);

% gammakorjaus
gamma_corr = 0.7;
im = im.^gamma_corr;

% näytä alkuperäinen ja suodatettu kuva
figure(1)
clf

subplot(1, 2, 1);
imshow(original);

subplot(1, 2, 2);
imshow(im);

% tallennetaan filtteröity kuva
imwrite(uint8(255*im), 'filtered.jpg', 'jpg');

