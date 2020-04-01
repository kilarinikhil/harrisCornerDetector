% Define hyper parameters
imgParam.sigma1 = 10;
imgParam.sigma2 = 2;
imgThreshold = 0.2;
imgParam.alpha = 0.04;
img = imread('images/image.jpg');
imgGray = rgb2gray(img);
RImg = harrisCorner(imgGray,imgParam);
[xImg,yImg,rMaxImg] = anms(RImg,10);
imshow(img);
hold on;
plot(xImg(:),yImg,'rx');
