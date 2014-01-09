tic;

%% 1.Generació de la base de dades d'entrenament

baseDadesEntrenament = generaBaseDeDades();

%% 2.Extracció dels tags per categories

tTags = tagsCategoriaV2(baseDadesEntrenament);

%% 3.Obtenció de les fotos a classificar

fotosClassificar = agafaFotos();

%% 4.Extraiem la TF-IDF i realitzem la classificació generant un fitxer .txt de sortida amb la classificació

ClassificaFotosMain;

%% 5.Avaluem el fitxer .txt generat amb l'script "avaluar.m" de la carpeta "avaluador"
toc;