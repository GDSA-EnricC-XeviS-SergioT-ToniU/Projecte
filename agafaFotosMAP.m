% @c This is part of the SocialDetector Software.
% @c Copyright (C) 2013 Antonio Jesús Urbano Torres
% @c Free Software Foundation, Inc.
% @c See the file README for copying conditions.


function fotosClasificar = agafaFotosMAP(MAPfotosClasificar)

        directoriEntrenament=uigetdir(pwd,'Escull la carpeta on es troben les FOTOS que vols classificar:');
        fotos=dir(directoriEntrenament);
        
        index=1;
        
        for i=3:length(fotos);        
              nomFoto = strcat(fotos(i).name);
              nomFoto=nomFoto(1:length(nomFoto)-4); % Treiem el .jpg
              
              if(isKey(MAPfotosClasificar,nomFoto))
                 fotosClasificar(index) = MAPfotosClasificar(nomFoto);
                 index=index+1;
              end
              
        end
end