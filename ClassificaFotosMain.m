% @c This is part of the SocialDetector Software.
% @c Copyright (C) 2013 Antonio Jes�s Urbano Torres
% @c Free Software Foundation, Inc.
% @c See the file README for copying conditions.



fid=fopen('dadesClassificacio.txt','w');

    for (i=1:length(fotosClasificar))
        
        TfIdf = TFIDF(tTags, fotosClasificar(i).tag);
        [Classe] = Classificador(TfIdf);
        
        fprintf(fid,fotosClasificar(i).id);
        fprintf(fid,' ');
        fprintf(fid,Classe);
        if i ~= (length(fotosClasificar))
        fprintf(fid,'\n');
        end
   
    end
    fclose(fid);