% @c This is part of the SocialDetector Software.
% @c Copyright (C) 2013 Antonio Jesús Urbano Torres
% @c Free Software Foundation, Inc.
% @c See the file README for copying conditions.


function [TfIdf] = TFIDF(tTags, tagsFoto)
%TFIDFConcert,TFIDFConference,TFIDFExhibition, TFIDFFashion,TFIDFNon_Event,TFIDFOther,  TFIDFProtest,  TFIDFSports,  TFIDFTheater
    
    clases = {'concert', 'conference','exhibition','fashion', 'non_event','other','protest','sports','theater_dance'};
    TfIdf = containers.Map();    %Inicialitzem la variable map buida
   
    

 for z=1:length(clases)
     
    for i=1:length(tagsFoto)
        contador=0;
        frecuencias = zeros(1,length(tagsFoto));
        for j=1:length(tagsFoto)
            if((~strcmp(tagsFoto{i},'') && ~strcmp(tagsFoto{j},'')) && strcmp(tagsFoto{i},tagsFoto{j}))
                frecuencias(i)=contador+1;  
                contador = contador + 1;
            end                        
        end
        frecuencias(i)=frecuencias(i)/length(tagsFoto);
        TF(i) =(0.5+(0.5*frecuencias(i))/max(frecuencias));   
    
        valortTags = tTags(clases{z}); %El valor de tTags. Són els tags d'una clase determinada per z amb el numero de repeticions
    
        if(isKey(valortTags,tagsFoto{j}))
            IDF(i) = log10(length(valortTags)/(1+valortTags(tagsFoto{j})));
                   
        else IDF(i)=0;
                        
        end
                        
    end
      B = TF.*IDF;
      b = ~isnan(B); 
      l = sum(b,1); 
      B = B(b).'; 
      tfidf = B;
      TfIdf(clases{z})= tfidf;
end
    
          
end
   