function snvImage = SNV(image)
    % Get image dimensions
    [rows, cols, channels] = size(image);
    
    % Reshape the image to a 2D matrix
    reshapedImage = reshape(image, rows * cols, channels);
    
    % Calculate mean and standard deviation along each channel
    channelMeans = mean(reshapedImage);
    channelStdDevs = std(reshapedImage);
    
    % Subtract mean and divide by standard deviation for each channel
    snvImage = (reshapedImage - channelMeans) ./ channelStdDevs;
    
    % Reshape SNV image back to original dimensions
    snvImage = reshape(snvImage, rows, cols, channels);
end
