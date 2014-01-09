% @c This is part of the SocialDetector Software.
% @c Copyright (C) 2013 Antonio Jesús Urbano Torres
% @c Free Software Foundation, Inc.
% @c See the file README for copying conditions.



fid=fopen('dadesClassificacio.txt','w');

    for (i=1:length(fotosClassificar))
        
        TfIdf = TFIDF(tTags, fotosClassificar(i).tag);
        [Classe] = Classificador(TfIdf);
        
        fprintf(fid,fotosClassificar(i).id);
        fprintf(fid,' ');
        fprintf(fid,Classe);
        if i ~= (length(fotosClassificar))
        fprintf(fid,'\n');
        end
   
    end
    fclose(fid);