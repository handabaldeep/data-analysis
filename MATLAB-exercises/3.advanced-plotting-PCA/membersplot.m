
function membersplot(str1,str2)
    ME = 22;
    BM = 45;
    CE = 23;
    EE = 33;
    data = [ME BM CE EE];
    labels = {'ME','BM','CE','EE'};
    if strcmpi(str1,'bar')==1
        subplot(1,2,1);
        bar(data);
        set(gca,'XTickLabel',labels);
        xlabel('Departments');
        ylabel('Number of Faculty members');   
        grid on;
    elseif strcmpi(str1,'barh')==1
        subplot(1,2,1);
        barh(data);
        set(gca,'YTickLabel',labels);
        ylabel('Departments');
        xlabel('Number of Faculty members');   
        grid on;
    elseif strcmpi(str1,'pie')==1
        subplot(1,2,1);
        pie(data,labels);
        title('Faculty members by department');
    end
    if strcmpi(str2,'bar')==1
        subplot(1,2,2);
        bar(data);
        set(gca,'XTickLabel',labels);
        xlabel('Departments');
        ylabel('Number of Faculty members');   
        grid on;
    elseif strcmpi(str2,'barh')==1
        subplot(1,2,2);
        barh(data);
        set(gca,'YTickLabel',labels);
        ylabel('Departments');
        xlabel('Number of Faculty members');  
        grid on;
    elseif strcmpi(str2,'pie')==1
        subplot(1,2,2);
        pie(data,labels);
        title('Faculty members by department');
    end
end
