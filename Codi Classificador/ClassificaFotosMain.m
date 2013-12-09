% @c This is part of the SocialDetector Software.
% @c Copyright (C) 2013 Antonio Jesús Urbano Torres
% @c Free Software Foundation, Inc.
% @c See the file README for copying conditions.


fotosClassificar = agafaFotos();

% Encerts=0;
fid=fopen('dadesClassificacio.txt','wt');

    for (i=1:length(base))
        TfIdf = TFIDF(tTags, base(i).tag);
        [Classe,ID_Classe]= Classificador (TfIdf,tTags);
%         if(base(i).idClass==ID_Classe)
%             Encerts=Encerts+1;
%         end
        fprintf(fid,base(i).id);
        fprintf(fid,' ');
        fprintf(fid,Classe);
        fprintf(fid,'\n');

    end
    fclose(fid);
  