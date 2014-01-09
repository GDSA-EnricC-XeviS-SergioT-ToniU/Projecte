% @c This is part of the SocialDetector Software.
% @c Copyright (C) 2013 Antonio Jesús Urbano Torres
% @c Free Software Foundation, Inc.
% @c See the file README for copying conditions.


function baseEntrenada=generaBaseDeDades()

        directoriEntrenament=uigetdir(pwd,'Escull la carpeta on es troben les FOTOS que vols ENTRENAR:');
        fotos=dir(directoriEntrenament);
        L=length(fotos); 
        
        directori=uigetdir(pwd,'Escull la carpeta metadatosIDiTITULO');
        metadades=dir(directori);

        path = strcat(directori,'\',metadades(3).name);
        formats = '%s%s%s%s%s%s%s%s';
        headerLines = 16;
        delimiter = ',';
        [basedades{1:8}] = textread(path, formats,'headerlines', headerLines, 'delimiter', delimiter);
        
        directori2=uigetdir(pwd,'Escull la carpeta metadatosCLASIFICACION');
        metadades2=dir(directori2);

        path2 = strcat(directori2,'\',metadades2(3).name);
        formats2 = '%s%s';
        headerLines2 = 10;
        [basedades2{1:2}] = textread(path2, formats2,'headerlines', headerLines2, 'delimiter', delimiter);

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
       
        for i=1:length(base)         
                x=base(i).id;
                for z= 1:(length(basedades2{1,1}))
                    if(strcmp(x, basedades2{1,1}{z,1}(3:length(basedades2{1,1}{z,1})-1)) )
                       base(i).class= basedades2{1,2}{z,1}(2:length(basedades2{1,2}{z,1})-2);
                                if(strcmp(base(i).class,'concert'))
                                    base(i).idClass=1;
                                

                                elseif(strcmp(base(i).class,'conference'))
                                    base(i).idClass=2;

                                 elseif(strcmp(base(i).class,'exhibition'))
                                    base(i).idClass=3;


                               elseif(strcmp(base(i).class,'fashion'))
                                  base(i).idClass=4;


                                elseif(strcmp(base(i).class,'non_event'))
                                   base(i).idClass=5;    

                                elseif(strcmp(base(i).class,'other'))
                                   base(i).idClass=6;


                                 elseif(strcmp(base(i).class,'protest'))
                                    base(i).idClass=7;


                               elseif(strcmp(base(i).class,'sports'))
                                   base(i).idClass=8;

                                elseif(strcmp(base(i).class,'theater_dance'))
                                    base(i).idClass=9;
                                end
                        break;
                    end
                end
        end
%1-Concert 2-Conference 3-Exhibition 4-Fashion 5-Non_Event 6-other 7-Protest 8-Sports 9-Theater_dance 

        base=base(3:length(base));  
        base=extreuTAGS_minuscula(base);
        baseEntrenada=base;
        
        
        

