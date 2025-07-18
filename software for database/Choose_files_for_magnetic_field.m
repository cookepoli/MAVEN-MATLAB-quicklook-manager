clear
datefrom = '2025-02-01';
dateto = '2025-02-01';
writepath = '/Users/sesh2112/data/Matlab_MAVEN/pre-calculated/MAG_SS';
root = '/Users/sesh2112/data/Matlab_MAVEN/MAG/SS';

from = datenum(datefrom);
to = datenum(dateto);
i = 0;
cur_date = from;
while cur_date<=to
    disp(['MAG Start converting ' datestr(cur_date, 'yyyy-mm-dd')])
    isfound = 0;
    cur_year = num2str(year(cur_date));
    cur_month = num2str(month(cur_date));
    if(length(cur_month) < 2)
        cur_month = ['0' cur_month];
    end
    cur_day = num2str(day(cur_date));
    if(length(cur_day) < 2)
        cur_day = ['0' cur_day];
    end
    monthpath = [root '/' cur_year '/' cur_month '/'];
    month_filelist = dir([monthpath, '*.sts']);
    %disp(i)
    for i = 1:length(month_filelist)
        if(all(month_filelist(i).name(28:29) == cur_day))
            filename = [monthpath month_filelist(i).name];
            isfound = true;
            break
        elseif i == length(month_filelist)
            isfound = false;
            disp([datestr(cur_date) ' not found'])
        end
    end
    %disp(i)
    if(isfound)
        Read_magnetic_field_data(filename, writepath);
    end
    
    cur_date = cur_date + datenum('01-Jan-0000');

    i = i+1;
end



