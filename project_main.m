tic;

%% 1.Generaci� de la base de dades d'entrenament

baseDadesEntrenament = generaBaseDeDades();

%% 2.Extracci� dels tags per categories

tTags = tagsCategoriaV2(baseDadesEntrenament);

%% 3.Obtenci� de les fotos a classificar

fotosClassificar = agafaFotos();

%% 4.Extraiem la TF-IDF i realitzem la classificaci� generant un fitxer .txt de sortida amb la classificaci�

ClassificaFotosMain;

%% 5.Avaluem el fitxer .txt generat amb l'script "avaluar.m" de la carpeta "avaluador"
toc;