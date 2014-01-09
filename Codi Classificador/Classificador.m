% @c This is part of the SocialDetector Software.
% @c Copyright (C) 2013 Antonio Jesús Urbano Torres
% @c Free Software Foundation, Inc.
% @c See the file README for copying conditions.


function [Classe,ID_Classe]= Classificador (TF_IDF,tTags)

%[TF_IDF] = TFIDF(tTags.tConcert, tTags.tConference, tTags.tExhibition, tTags.tFashion, tTags.tNon_Event, tTags.tOther, tTags.tProtest, tTags.tSports, tTags.tTheater, tagsFoto);

maxim= max(TF_IDF.Non_Event);
Classe='non_event';
ID_Classe=5;

 

if  max(TF_IDF.Concert)>maxim
    Classe = 'concert';
    ID_Classe=1;
    maxim = max(TF_IDF.Concert);
end
    
if  max(TF_IDF.Conference)>maxim
    Classe = 'conference';
     ID_Classe=2;
    maxim = max(TF_IDF.Conference);
end
    
 if  max(TF_IDF.Exhibition)>maxim
    Classe = 'exhibition';
     ID_Classe=3;
    maxim = max(TF_IDF.Exhibition);
 end
     
    if  max(TF_IDF.Fashion)>maxim
    Classe = 'fashion';
     ID_Classe=4;
    maxim = max(TF_IDF.Fashion);
    end
    
 if  max(TF_IDF.Other)>maxim
    Classe = 'other';
     ID_Classe=6;
    maxim = max(TF_IDF.Other);
 end
 
  if  max(TF_IDF.Protest)>maxim
    Classe = 'protest';
     ID_Classe=7;
    maxim = max(TF_IDF.Protest);
    
     if  max(TF_IDF.Sports)>maxim
    Classe = 'sports'; 
    ID_Classe=8;
    maxim = max(TF_IDF.Sports);
     end
    
     if  max(TF_IDF.Theater)>maxim
    Classe = 'theater_dance';
     ID_Classe=9;
    maxim = max(TF_IDF.Theater);
     end
     
    
     end
end
%1-Concert 2-Conference 3-Exhibition 4-Fashion 5-Non_Event 6-other 7-Protest 8-Sports 9-Theater_dance 

