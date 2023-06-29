function [coe,B,Y,i0,sim]=PolyAppr(X)
    % Usage: to approximate the 2D plane of a HS image using chebshev poly
    % Using the degree of 9
    degree = 9;
    % defalt channel 160
    channelindex = 160;
    % Extract image dimensions
    [a, b, ~] = size(X);
    
    Y = X(:,:,channelindex);
    Y = reshape(Y, a*b, 1);
    
    [x,y] = meshgrid(1:a,1:b);
    x = reshape(x, a*b, 1);
    y = reshape(y, a*b, 1);
    % Initialize matrix B as an empty matrix
    B = [];
    
    % Generate all the possibilities of polynomial x^n * y^m
    for i = 0:degree
        for j = 0:degree
            if i + j <= degree
                add = (x.^i).*(y.^j);
                B = horzcat(B, add);
            end
        end
    end

    coe = B\Y;
    i0 = B*coe;
    % similarity calculation i0 vs Y, smaller -> similar
    sim = mean((Y-i0).^2);
    
    i0 = reshape(i0,a,b);
    Y = reshape(Y,512,512);
    imshow(i0);
end
