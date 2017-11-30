clc;clear;


allGraphs(1)
pause(5)
allGraphs(2)
pause(5)
threeGraphsEach

function allGraphs(v)

switch(v)
    case 1
        load noisyecg.mat
        load ecgData.mat
        load s0046lrem.mat
        b = val.'
        save b
        
        
    case 2
        load noisyecg.mat
        load ecgData.mat
        load s0509_rem.mat
        b = val.'
        save b
        
        
end

figure('units','normalized','outerposition',[0 0 1 1])

    for x = 1:12
        [p,s,mu] = polyfit((1:numel(b(1:end, x)))',b(1:end, x),6);
        f_y = polyval(p,(1:numel(b(1:end, x)))',[],mu);
        ECG_data = b(1:end, x) - f_y;  

        % Detrend data
        smoothECG = sgolayfilt(ECG_data,7,21);


        [~,locs_Rwave] = findpeaks(smoothECG,'MinPeakHeight',0.5,...
                                            'MinPeakDistance',200);


        ECG_inverted = -smoothECG;
        [~,locs_Swave] = findpeaks(ECG_inverted,'MinPeakHeight',0.5,...
                                                'MinPeakDistance',200);

        [~,min_locs] = findpeaks(-smoothECG,'MinPeakDistance',40);
        [~,max_locs] = findpeaks(smoothECG,'MinPeakDistance',60);
        %[x,~] = findpeaks(smoothECG,'MinPeakDistance', 20);

        % Peaks between -0.2mV and -0.5mV
        locs_Qwave = min_locs(smoothECG(min_locs)>-0.5 & smoothECG(min_locs)<-0.2);                                   
        locs_Pwave = max_locs(smoothECG(max_locs)>0.2 & smoothECG(max_locs)<0.4);
        locs_Twave = max_locs(smoothECG(max_locs)>0.1 & smoothECG(max_locs)<0.4);
        %locs_Pwave = max_locs(smoothECG(x)>);

        %locs_Pwave(4) = []


        %%for x = 7: -2: 1
          %%locs_Twave(x) = []
        %end

    if(v == 1)
         switch(x)
            case 1
                subplot(3,4,1);
                title('I')
            case 2
                subplot(3,4,5);
                title('II')
            case 3
                subplot(3,4,9);
                title('III')
            case 4
                subplot(3,4,2);
                title('aVR')
            case 5
                subplot(3,4,6);
                title('aVL')
            case 6
                subplot(3,4,10);
                title('aVF')
            case 7
                subplot(3,4,3);
                title('V1')
            case 8
                subplot(3,4,7);
                title('V2','Color', 'b')
            case 9
                subplot(3,4,11);
                title('V3','Color', 'b')
            case 10
                subplot(3,4,4);
                title('V4')
            case 11
                subplot(3,4,8);
                title('V5','Color', 'b')
            case 12
                subplot(3,4,12);
                title('V6')
         end
    
    
    else 
         switch(x)
            case 1
                subplot(3,4,1);
                title('I')
            case 2
                subplot(3,4,5);
                title('II')
            case 3
                subplot(3,4,9);
                title('III')
            case 4
                subplot(3,4,2);
                title('aVR')   
            case 5
                subplot(3,4,6);
                title('aVL','Color', 'b')
            case 6
                subplot(3,4,10);
                title('aVF')
            case 7
                subplot(3,4,3);
                title('V1','Color', 'b')
            case 8
                subplot(3,4,7);
                title('V2')
            case 9
                subplot(3,4,11);
                title('V3')
            case 10
                subplot(3,4,4);
                title('V4')
            case 11
                subplot(3,4,8);
                title('V5','Color', 'b')
            case 12
                subplot(3,4,12);
                title('V6')
         end
    end
    

        hold on;
        plot(1:10000, smoothECG); 
        %plot(locs_Qwave,smoothECG(locs_Qwave),'rs','MarkerFaceColor','g')
        %plot(locs_Rwave,smoothECG(locs_Rwave),'rv','MarkerFaceColor','r')
        %plot(locs_Swave,smoothECG(locs_Swave),'rs','MarkerFaceColor','b')
        %plot(locs_Pwave,smoothECG(locs_Pwave),'rv','MarkerFaceColor','y')
        %plot(locs_Twave,smoothECG(locs_Twave),'rv','MarkerFaceColor','c')
        grid on
    
        xlabel('Milliseconds(ms)')
        ylabel('Voltage(mV)')
        ax = axis;
        axis([0 2500 -3000 3000])
        %legend('Smooth ECG signal','Q-wave','R-wave','S-wave','P-wave','T-wave')
       hold off;
    end 
     if v == 1
          axes( 'Position', [0, 0.95, 1, 0.05] ) ;
          set( gca, 'Color', 'None', 'XColor', 'White', 'YColor', 'White' ) ;
          text( 0.5, 0, 'Patient 14', 'FontSize', 20', 'FontWeight', 'Bold', ...
      'HorizontalAlignment', 'Center', 'VerticalAlignment', 'Bottom' ) ; 
     else 
          axes( 'Position', [0, 0.95, 1, 0.05] ) ;
          set( gca, 'Color', 'None', 'XColor', 'White', 'YColor', 'White' ) ;
          text( 0.5, 0, 'Patient 217', 'FontSize', 20', 'FontWeight', 'Bold', ...
      'HorizontalAlignment', 'Center', 'VerticalAlignment', 'Bottom' ) ; 
     end
     
     
     
end 


function threeGraphsEach

    

        load noisyecg.mat
        load ecgData.mat
        load s0046lrem.mat
        b = val.'
        save b
        
    figure('units','normalized','outerposition',[0 0 1 1])
    
    [p,s,mu] = polyfit((1:numel(b(1:end, 8)))',b(1:end, 8),6);
        f_y = polyval(p,(1:numel(b(1:end, 8)))',[],mu);
        ECG_data = b(1:end, 8) - f_y;  

        % Detrend data
        smoothECG = sgolayfilt(ECG_data,7,21);
    
     hold on;
        subplot(2,3,1);
        plot(1:10000, smoothECG); 
        grid on
        xlabel('Milliseconds(ms)')
        ylabel('Voltage(mV)')
        title('\fontsize{14}V2')
        ax = axis;
        axis([0 2500 -3000 3000])
        %legend('Smooth ECG signal','Q-wave','R-wave','S-wave','P-wave','T-wave')

      
      [p,s,mu] = polyfit((1:numel(b(1:end,9)))',b(1:end, 9),6);
        f_y = polyval(p,(1:numel(b(1:end, 9)))',[],mu);
        ECG_data = b(1:end, 9) - f_y;  

        % Detrend data
        smoothECG = sgolayfilt(ECG_data,7,21);
    

        subplot(2,3,2);
        plot(1:10000, smoothECG); 
        grid on
        xlabel('Milliseconds(ms)')
        ylabel('Voltage(mV)')
        title({'\fontsize{20}Patient 14 - Antero-Lateral MI','\fontsize{14}V3'})
        
        ax = axis;
        axis([0 2500 -3000 3000])
        %legend('Smooth ECG signal','Q-wave','R-wave','S-wave','P-wave','T-wave')
     
      
      [p,s,mu] = polyfit((1:numel(b(1:end, 11)))',b(1:end, 11),6);
        f_y = polyval(p,(1:numel(b(1:end, 11)))',[],mu);
        ECG_data = b(1:end, 11) - f_y;  

        % Detrend data
        smoothECG = sgolayfilt(ECG_data,7,21);
    
 
        subplot(2,3,3);
        plot(1:10000, smoothECG); 
        grid on
        xlabel('Milliseconds(ms)')
        ylabel('Voltage(mV)')
        title('\fontsize{14}V5')
        ax = axis;
        axis([0 2500 -3000 3000])
        %legend('Smooth ECG signal','Q-wave','R-wave','S-wave','P-wave','T-wave')
    
     load s0509_rem.mat
     b = val.'
     save b
     
      [p,s,mu] = polyfit((1:numel(b(1:end, 5)))',b(1:end, 5),6);
        f_y = polyval(p,(1:numel(b(1:end, 5)))',[],mu);
        ECG_data = b(1:end, 5) - f_y;  

        % Detrend data
        smoothECG = sgolayfilt(ECG_data,7,21);
    

        subplot(2,3,4);
        plot(1:10000, smoothECG); 
        grid on
        xlabel('Milliseconds(ms)')
        ylabel('Voltage(mV)')
        title('\fontsize{14}aVL')
        ax = axis;
        axis([0 2500 -3000 3000])
        %legend('Smooth ECG signal','Q-wave','R-wave','S-wave','P-wave','T-wave')
 
      
       [p,s,mu] = polyfit((1:numel(b(1:end, 7)))',b(1:end, 7),6);
        f_y = polyval(p,(1:numel(b(1:end, 7)))',[],mu);
        ECG_data = b(1:end, 7) - f_y;  

        % Detrend data
        smoothECG = sgolayfilt(ECG_data,7,21);
    
   
        subplot(2,3,5);
        plot(1:10000, smoothECG); 
        grid on
        xlabel('Milliseconds(ms)')
        ylabel('Voltage(mV)')
        title({'\fontsize{20}Patient 217 - Pericarditis','\fontsize{14}V2'})
        ax = axis;
        axis([0 2500 -3000 3000])
        %legend('Smooth ECG signal','Q-wave','R-wave','S-wave','P-wave','T-wave')
     
      
       [p,s,mu] = polyfit((1:numel(b(1:end, 11)))',b(1:end, 11),6);
        f_y = polyval(p,(1:numel(b(1:end, 11)))',[],mu);
        ECG_data = b(1:end, 11) - f_y;  

        % Detrend data
        smoothECG = sgolayfilt(ECG_data,7,21);
    
 
        subplot(2,3,6);
        plot(1:10000, smoothECG); 
        grid on
        xlabel('Milliseconds(ms)')
        ylabel('Voltage(mV)')
        title('\fontsize{14}v5')
        ax = axis;
        axis([0 2500 -3000 3000])
        %legend('Smooth ECG signal','Q-wave','R-wave','S-wave','P-wave','T-wave')
      
   
end
