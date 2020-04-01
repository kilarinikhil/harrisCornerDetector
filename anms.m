function [x,y,rMax] = anms(R,numPts)
[H,W] = size(R);
rMat = zeros(H,W);
for i = 1:H
    for j = 1:W
        for r = 1:min(H,W)
            if(R(i,j) == 0)
                rMat(i,j) = 1;
                break;
            elseif(any(R(max(i-r,1):min(i+r,H),max(j-r,1))>R(i,j))>0||...
                    any(R(max(i-r,1):min(i+r,H),min(j+r,W))>R(i,j)))>0||...
                    any(R(max(i-r,1),max(j-r,1):min(j+r,W))>R(i,j))>0||...
                    any(R(min(i+r,H),max(j-r,1):min(j+r,W))>R(i,j))>0
                rMat(i,j) = r;
                break;
            end
        end
    end
end

[x,y] = meshgrid(1:W,1:H);
mat = [x(:),y(:),rMat(:)];
[~,idx] = sort(mat(:,3),'descend');
sortedMat = mat(idx,:);
x = sortedMat(1:numPts,1);
y = sortedMat(1:numPts,2);
rMax = sortedMat(1:numPts,3);
end