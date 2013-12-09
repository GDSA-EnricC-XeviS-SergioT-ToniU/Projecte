% @c This is part of the SocialDetector Software.
% @c Copyright (C) 2013 Antonio Jesús Urbano Torres
% @c Free Software Foundation, Inc.
% @c See the file README for copying conditions.


function [TFIDF] = TFIDF(tTags, tagsFoto)
%TFIDFConcert,TFIDFConference,TFIDFExhibition, TFIDFFashion,TFIDFNon_Event,TFIDFOther,  TFIDFProtest,  TFIDFSports,  TFIDFTheater

TAGS{1}=tTags.tConcert;
TAGS{2}=tTags.tConference;
TAGS{3}=tTags.tExhibition;
TAGS{4}=tTags.tFashion;
TAGS{5}=tTags.tNon_Event;
TAGS{6}=tTags.tOther;
TAGS{7}=tTags.tProtest;
TAGS{8}=tTags.tSports;
TAGS{9}=tTags.tTheater;


    for i=1:length(tagsFoto)
        contador=0;
        frecuencias=[];
        trobat=false;
        for j=1:length(tagsFoto)
            if((~strcmp(tagsFoto{i},'') & ~strcmp(tagsFoto{j},'')) & strcmp(tagsFoto{i},tagsFoto{j}))
                frecuencias(i)=contador+1;  
                contador = contador + 1;
            else
                frecuencias(i)=0;

            end
        end
        frecuencias(i)=frecuencias(i)/length(tagsFoto);
        TF(i) =(0.5+(0.5*frecuencias(i))/max(frecuencias));
        contador=0;

       
             
    end    
    
    
    
      for b=1:9
          frecuenciadocumento=[];
          for i=1:length(tagsFoto)
               
               contador=0;
             for z=1:size(TAGS{b},2)
                 if(strcmp(tagsFoto{i},TAGS{b}{z}))
                     frecuenciadocumento(i)=contador+1;  
                     contador = contador + 1;
                     IDF(i)=log10((size(TAGS{b},2)-1)/(1+frecuenciadocumento(i)));
                     trobat=true;
                 elseif(trobat==false)
                     frecuenciadocumento(i)=0; 
                     IDF(i)=0;
                 end
             end
              
             if (b==1)
              TFIDF.Concert(i)= TF(i) * IDF(i);
             end
             
             if (b==2)
              TFIDF.Conference(i)= TF(i) * IDF(i);
             end 
             
              if (b==3)
               TFIDF.Exhibition(i)= TF(i) * IDF(i);
              end 
              
                if (b==4)
               TFIDF.Fashion(i)= TF(i) * IDF(i);
                end 
              
                  if (b==5)
               TFIDF.Non_Event(i)= TF(i) * IDF(i);   
                  end 
                
                if (b==6)
               TFIDF.Other(i)= TF(i) * IDF(i);
                end 
                
                 if (b==7)
               TFIDF.Protest(i)= TF(i) * IDF(i);
                 end 
                
                    if (b==8)
               TFIDF.Sports(i)= TF(i) * IDF(i);
                    end
                    
                    
                     if (b==9)
               TFIDF.Theater(i)= TF(i) * IDF(i);
                    end
                    
                 
             trobat=false;
          end
      end
               
                          
end





