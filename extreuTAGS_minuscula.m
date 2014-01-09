% @c This is part of the SocialDetector Software.
% @c Copyright (C) 2013 Antonio Jesús Urbano Torres
% @c Free Software Foundation, Inc.
% @c See the file README for copying conditions.


function basededades=extreuTAGS_minuscula(basededades)


for i=1:length(basededades)
    
        basededades(i).tag{1,i} = regexprep(basededades(i).title,'[^a-zA-Z0-9]',' ');      
        basededades(i).tag{1,i}(~ismember(basededades(i).tag{1,i},['A':'Z' 'a':'z' ' '])) = ' ';  
        basededades(1,i).tag = lower(strsplit(basededades(i).tag{1,i},{' '}));
 end