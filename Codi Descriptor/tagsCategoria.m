% @c This is part of the SocialDetector Software.
% @c Copyright (C) 2013 Antonio Jesús Urbano Torres
% @c Free Software Foundation, Inc.
% @c See the file README for copying conditions.


%1-Concert 2-Conference 3-Exhibition 4-Fashion 5-Non_Event 6-other 7-Protest 8-Sports 9-Theater_dance 

function [tTags] = tagsCategoria(basededades2)
tConcert{1} = '';
tConference{1} = '';
tExhibition{1} = '';
tFashion{1} = '';
tNon_Event{1} ='';
tOther{1} = '';
tProtest{1} = '';
tSports{1} = '';
tTheater{1} = '';

basededades=basededades2;

for (i = 1:length(basededades))
    
    for(j=1:length(basededades(i).tag))
        
        if(strcmp(basededades(i).class,'concert'))
            if(~strcmp(basededades(i).tag{j},''))
                index = length(tConcert);
                tConcert{index+1} = basededades(i).tag{j};
            end
        
        elseif(strcmp(basededades(i).class,'conference'))
            if(~strcmp(basededades(i).tag{j},''))
                index = length(tConference);
                tConference{index+1} = basededades(i).tag{j};
            end
        
        
         elseif(strcmp(basededades(i).class,'exhibition'))
            if(~strcmp(basededades(i).tag{j},''))
                index = length(tExhibition);
                tExhibition{index+1} = basededades(i).tag{j};
            end
             
         
       elseif(strcmp(basededades(i).class,'fashion'))
            if(~strcmp(basededades(i).tag{j},''))
                index = length(tFashion);
                tFashion{index+1} = basededades(i).tag{j};
            end
         
            
        elseif(strcmp(basededades(i).class,'non_event'))
                if(~strcmp(basededades(i).tag{j},''))
                    index = length(tNon_Event);
                    tNon_Event{index+1} = basededades(i).tag{j};
                end
         
        elseif(strcmp(basededades(i).class,'other'))
            if(~strcmp(basededades(i).tag{j},''))
                index = length(tOther);
                tOther{index+1} = basededades(i).tag{j};
            end
             
         
         elseif(strcmp(basededades(i).class,'protest'))
            if(~strcmp(basededades(i).tag{j},''))
                index = length(tProtest);
                tProtest{index+1} = basededades(i).tag{j};
            end
             
         
       elseif(strcmp(basededades(i).class,'sports'))
            if(~strcmp(basededades(i).tag{j},''))
                index = length(tSports);
                tSports{index+1} = basededades(i).tag{j};
            end
             
        elseif(strcmp(basededades(i).class,'theater_dance'))
            if(~strcmp(basededades(i).tag{j},''))
                index = length(tTheater);
                tTheater{index+1} = basededades(i).tag{j};
            end
        end
            
    end

end

tTags.tConcert= tConcert;
tTags.tConference= tConference;
tTags.tExhibition= tExhibition;
tTags.tFashion= tFashion;
tTags.tNon_Event= tNon_Event;
tTags.tOther= tOther;
tTags.tProtest= tProtest;
tTags.tSports=tSports;
tTags. tTheater=  tTheater;

end