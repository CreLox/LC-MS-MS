% Order: specify the order of cholesterol, cholesterol-d7, 7-DHC, and
% 7-DHC-d7 by an array of the corresponding mod(ScanNo, TotalPrecursorNum)
% values
function plotD7(Filepath, TotalPrecursorNum, Order, ...
    FigureHandle, XOffSet, XLim, YNormalizationFactor, Color)
    %% Parameter setting
    CholesterolProductIon = 146.90;
    DHCProductIon = 144.97;
    Tol = 0.001;
    FontSize = 15;
    CurveLineWidth = 2;
    AxisLineWidth = 1;
    set(groot, {'DefaultAxesXColor', 'DefaultAxesYColor', ...
        'DefaultAxesZColor'}, {'k', 'k', 'k'});
    
    %% Read the .mzXML file and extract the data
    % Column 1: time (in seconds); column 2: ion current
    RawData = mzxmlread(Filepath);
    TotalTimePoint = length(RawData.scan);
    Chol    = zeros(TotalTimePoint / TotalPrecursorNum, 2);
    Chol_d7 = zeros(TotalTimePoint / TotalPrecursorNum, 2);
    DHC     = zeros(TotalTimePoint / TotalPrecursorNum, 2);
    DHC_d7  = zeros(TotalTimePoint / TotalPrecursorNum, 2);
    for i = 1 : TotalTimePoint
        TimePointIndex = ceil(i / TotalPrecursorNum);
        RetentionTime = strsplit(RawData.scan(i).retentionTime, ["PT", "S"]);
        RetentionTime = str2double(RetentionTime(2));
        switch mod(i, TotalPrecursorNum)
            case Order(1) % cholesterol
                Chol(TimePointIndex, 1) = RetentionTime;
                Index = find(abs(RawData.scan(i).peaks.mz(1 : 2 : end) - ...
                    CholesterolProductIon) < Tol);
                if (length(Index) ~= 1)
                    error("Could not identify the exact product ion of cholesterol (scan #%d)", i);
                end
                Chol(TimePointIndex, 2) = RawData.scan(i).peaks.mz(2 * Index);
            case Order(2) % cholesterol-d7
                Chol_d7(TimePointIndex, 1) = RetentionTime;
                Index = find(abs(RawData.scan(i).peaks.mz(1 : 2 : end) - ...
                    CholesterolProductIon) < Tol);
                if (length(Index) ~= 1)
                    error("Could not identify the exact product ion of cholesterol-d7 (scan #%d)", i);
                end
                Chol_d7(TimePointIndex, 2) = RawData.scan(i).peaks.mz(2 * Index);
            case Order(3) % 7-DHC
                DHC(TimePointIndex, 1) = RetentionTime;
                Index = find(abs(RawData.scan(i).peaks.mz(1 : 2 : end) - ...
                    DHCProductIon) < Tol);
                if (length(Index) ~= 1)
                    error("Could not identify the exact product ion of 7-DHC (scan #%d)", i);
                end
                DHC(TimePointIndex, 2) = RawData.scan(i).peaks.mz(2 * Index);
            case Order(4) % 7-DHC-d7
                DHC_d7(TimePointIndex, 1) = RetentionTime;
                Index = find(abs(RawData.scan(i).peaks.mz(1 : 2 : end) - ...
                    DHCProductIon) < Tol);
                if (length(Index) ~= 1)
                    error("Could not identify the exact product ion of 7-DHC-d7 (scan #%d)", i);
                end
                DHC_d7(TimePointIndex, 2) = RawData.scan(i).peaks.mz(2 * Index);
            otherwise
                %
        end
    end
    
    %% Plot
    figure(FigureHandle);
    hold on;

    % Cholesterol-d7
    subplot(2, 1, 1);
    hold on;
    plot(Chol_d7(:, 1) / 60 + XOffSet, Chol_d7(:, 2) * YNormalizationFactor, Color, ...
        "LineWidth", CurveLineWidth);
    ylabel("NL (cholesterol-d7)");
    xlim(XLim);

    xlabel("Retention time (min)");
    set(gca, "FontSize", FontSize, "LineWidth", AxisLineWidth);
    % set(gca, "FontSize", FontSize, "LineWidth", AxisLineWidth, 'XColor', 'none');

    box off;

    % 7-DHC-d7
    DHC_d7Plot = subplot(2, 1, 2);
    hold on;
    plot(DHC_d7(:, 1) / 60 + XOffSet, DHC_d7(:, 2) * YNormalizationFactor, Color, ...
        "LineWidth", CurveLineWidth);
    ylabel("NL (7-DHC-d7)");
    xlim(XLim);

    xlabel("Retention time (min)");
    set(gca, "FontSize", FontSize, "LineWidth", AxisLineWidth);
    % set(gca, "FontSize", FontSize, "LineWidth", AxisLineWidth, 'XColor', 'none');
    % xlabel("Retention time");
    % DHC_d7Plot.XAxis.Label.Color = 'k';
    % DHC_d7Plot.XAxis.Label.Visible= 'on';
    
    box off;
end
