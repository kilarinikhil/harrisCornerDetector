function [R] = harrisCorner(img,param)
   % Normalizing image
   I = double(img);
   I = I / max(I(:));
   
   % Defining kernels
   kernelWidth = round(param.sigma1*3)*2+1;
   smoothKernel = fspecial('gaussian',[kernelWidth,kernelWidth],param.sigma2);
   kerHor = [1 1 1;0 0 0;-1 -1 -1];
   kerVer = [1 0 -1;0 0 0;1 0 -1];
   
   % First derivatives
   Ix = conv2(I,kerVer,'same');
   Iy = conv2(I,kerHor,'same');
   
   % Second degree derivatives
   Ixx = Ix.^2;
   Iyy = Iy.^2;
   Ixy = Ix.*Iy;
   
   % Applying smoothing filter 
   Gxx = conv2(Ixx,smoothKernel,'same');
   Gyy = conv2(Iyy,smoothKernel,'same');
   Gxy = conv2(Ixy,smoothKernel,'same');
   
   % Calculate R matrix
   R = ((Gxx.*Gyy) - (Gxy.^2)) - param.alpha * (Gxx+Gyy).^2;
end