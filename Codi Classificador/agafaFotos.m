% @c This is part of the SocialDetector Software.
% @c Copyright (C) 2013 Antonio Jesús Urbano Torres
% @c Free Software Foundation, Inc.
% @c See the file README for copying conditions.


function fotosClasificar = agafaFotos()

        directoriEntrenament=uigetdir(pwd,'Escull la carpeta on es troben les fotos que vols classificar:');
        fotos=dir(directoriEntrenament);
        L=length(fotos); 

        directori=uigetdir(pwd,'Escull la carpeta on están les metadades de les fotos que vols classificar:');
        metadades=dir(directori);

        path = strcat(directori,'\',metadades(3).name);
        formats = '%s%s%s%s%s%s%s%s';
        headerLines = 16;
        delimiter = ',';
        [basedades{1:8}] = textread(path, formats,'headerlines', headerLines, 'delimiter', delimiter);

        for i=3:L         
              x = strcat(fotos(i).name);
              x=x(1:length(x)-4);
                 for j= 1:(length(basedades{1,1})-3)
                     if(strcmp(x, basedades{1,1}{j,1}(3:length(basedades{1,1}{j,1})-1)))
                           base(i).id=basedades{1,1}{j,1}(3:length(basedades{1,1}{j,1})-1);
                           base(i).title= basedades{1,6}{j,1}(2:length(basedades{1,6}{j,1})-1);
                            break;
                     end
                 end
        end
       
        base=base(3:length(base));  
        base=extreuTAGS_minuscula(base);
        fotosClasificar=base;