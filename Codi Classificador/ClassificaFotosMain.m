% @c This is part of the SocialDetector Software.
% @c Copyright (C) 2013 Antonio Jesús Urbano Torres
% @c Free Software Foundation, Inc.
% @c See the file README for copying conditions.


fotosClassificar = agafaFotos();

%  Encerts=0;
fid=fopen('dadesClassificacio.txt','wt');

    for (i=1:length(fotosClassificar))
        TfIdf = TFIDF(tTags, fotosClassificar(i).tag);
        [Classe,ID_Classe]= Classificador (TfIdf,tTags);
%          if(fotosClassificar(i).idClass==ID_Classe)
%              Encerts=Encerts+1;
%          end
    sortidaClassificador(i).id = fotosClassificar(i).id;
    sortidaClassificador(i).classeAssignada = Classe;
        fprintf(fid,fotosClassificar(i).id);
        fprintf(fid,' ');
        fprintf(fid,Classe);
        fprintf(fid,'\n');

    end
    fclose(fid);
  