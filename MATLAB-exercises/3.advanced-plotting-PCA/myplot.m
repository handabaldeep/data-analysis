

function myplot(v1,v2)
    load plot_properties.mat;
    for i=1:length(plot_properties)
        subplot(length(plot_properties),1,i);
        if strcmpi(plot_properties(i).plottype,'plot')==1
            eval(sprintf('plot(v1,v2,''%s%c'',''LineWidth'',%f)',...
                plot_properties(i).plotproperties.LineStyle,...
                plot_properties(i).plotproperties.Color,...
                plot_properties(i).plotproperties.LineWidth));
            axis([-8 8 -1 1]);
            grid on;
        elseif strcmpi(plot_properties(i).plottype,'bar')==1
            eval(sprintf('bar(v1,v2,%f,''FaceColor'',''%c'',''EdgeColor'',''%c'')',...
                plot_properties(i).plotproperties.BarWidth,...
                plot_properties(i).plotproperties.FaceColor,...
                plot_properties(i).plotproperties.EdgeColor));
            axis([-8 8 -1 1]);
            grid on;
        else
            eval(sprintf('barh(v1,v2,%f,''FaceColor'',''%c'',''EdgeColor'',''%c'')',...
                plot_properties(i).plotproperties.BarWidth,...
                plot_properties(i).plotproperties.FaceColor,...
                plot_properties(i).plotproperties.EdgeColor));
            axis([-1 1 -10 10]);
            grid on;
        end
    end
end
