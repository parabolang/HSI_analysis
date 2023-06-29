function PSOP(X)
    % Usage: plot a spectrum of a pixel for hyperspectral image
    
    % Extract image dimensions
    [a, b, ~] = size(X);
    
    Channelindex = 160;
    % Extract channel from hyperspectral image
    channel = X(:, :, Channelindex);
    
    % Plot hyperspectral image
    figure;
    subplot(1, 2, 1);
    imshow(channel, []);
    title(sprintf('Hyperspectral Image (Channel %d)', Channelindex));

    % Set up mouse click event handler
    subplot(1, 2, 2);
    plot(1:204, squeeze(X(1, 1, :))); % Plotting a random point initially
    title('Spectrum Graph');
    xlabel('Point Index');
    ylabel('Intensity');
    set(gcf, 'WindowButtonDownFcn', @plotSpectrumGraph);
    
    % Function to plot spectrum graph on mouse click
    function plotSpectrumGraph(~,~)
        % Get mouse click coordinates
        [y, x] = ginput(1);
        x = round(x);
        y = round(y);
        
        % Extract spectrum from the clicked pixel
        spectrum = squeeze(X(y, x, :));
        
        % Plot hyperspectral image with point indicator
        figure;
        subplot(1, 2, 1);
        imshow(channel, []);
        hold on;
%         plot(y, x, 'ro', 'MarkerSize', 5); % Plot red dot at selected point
        plot(y, x, 'wo', 'MarkerFaceColor', 'white', 'MarkerSize', 5); % Plot white solid point at selected point
        hold off;
        title(sprintf('Hyperspectral Image (Channel %d)', Channelindex));
        
        % Plot spectrum graph
        subplot(1, 2, 2);
        plot(1:204, spectrum);
        title('Spectrum Graph');
        xlabel('Point Index');
        ylabel('Intensity');
        
        % Set up mouse click event handler again for the new figure
        set(gcf, 'WindowButtonDownFcn', @plotSpectrumGraph);
    end
end
