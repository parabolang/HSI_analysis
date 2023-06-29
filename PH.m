function PH(varargin)
    % Usage: plot histogram for hyperspectral images
    
    % Get the number of input images
    numImages = nargin;
    
    % Iterate over each input image
    for i = 1:numImages
        % Extract the current image
        image = varargin{i};
        
        % Extract the channel from the hyperspectral image
        channel = image(:, :, 160);
        
        % Get the input matrix symbol as the title
        inputSymbol = inputname(i);
        
        % Plot histogram
        figure;
        histogram(channel(:), 'BinMethod', 'auto');
        title(sprintf('Histogram (%s)', inputSymbol));
        xlabel('Intensity');
        ylabel('Frequency');
    end
end
