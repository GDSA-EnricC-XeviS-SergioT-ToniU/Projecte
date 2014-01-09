%@c This is part of the SocialDetector Software.
%@c Copyright (C) 2013 Antonio Jes�s Urbano Torres
%@c Free Software Foundation, Inc.
%@c See the file README for copying conditions.

%% ---------------Passar Dades .csv a vectors MATLAB---------------------

%IMPORTEM LES DADES DE VERITAT TERRENY de .csv a MATLAB:

directori = uigetdir(pwd,'Escull la carpeta on hi ha el fitxer de Veritat Terreny:');
veritat_terreny_dir = dir(directori);

%path_avaluador = './veritatterreny.csv';
path_avaluador = strcat(directori, '/', veritat_terreny_dir(3).name);
formats = '%s%s'; %Format de les dades en cada columna
headerLines = 1; %Tenim una primera fila amb la capcelera: document_id, event_types.
delimiter = ',';
[VeritatTerreny{1:2}] = textread(path_avaluador, formats,'headerlines', headerLines, 'delimiter', delimiter);

%IMPORTEM LES DADES DEL CLASSIFICADOR de .csv a MATLAB:

directori = uigetdir(pwd,'Escull la carpeta on hi ha el fitxer dels resultats del Classificador:');
classificador_dir = dir(directori);

path_avaluador = strcat(directori, '/', classificador_dir(3).name);
formats = '%s%s'; %Format de les dades en cada columna
headerLines = 0; %ATENCI�-Tenim una primera fila amb la capcelera: document_id, event_types.
delimiter = ' ';
[Classificador{1:2}] = textread(path_avaluador, formats,'headerlines', headerLines, 'delimiter', delimiter);

tic;
%PASSEM LES DUES COLUMNES AMB DOS VECTORS ID I EVENT

vector_ver_id = [VeritatTerreny{1}];
vector_ver_event = [VeritatTerreny{2}];
length_veritat = length(vector_ver_event);

vector_clas_id = [Classificador{1}];
vector_clas_event = [Classificador{2}];
length_clas = length(vector_clas_event);

%% Passem vector_ver de ids i event a un map

map_veritat_total = containers.Map();

for i=1:length_veritat
    map_veritat_total(vector_ver_id{i}) = vector_ver_event{i};
end


%% Canviar el vector de veritat terreny ordenant-lo i fent-lo del tamany del vector del classificador -> MAP.

for i=1:length_clas
    id = vector_clas_id{i};
    
    if(isKey(map_veritat_total, id) == 1) %Si l'id existeix a la veritat terreny l'agafem, sin� no fem res
        v_veritat_event{i} = map_veritat_total(id);
        v_veritat_id{i} = id;
    end    
end

v_veritat_id = v_veritat_id'; %Fem la transposada
v_veritat_event = v_veritat_event'; %Fem la transposada

%% ---------Passar vectors de String a valors entre 1 fins al n�mero de classes ------------

%Passo vector veritat terreny:

veritat = zeros(1,length(v_veritat_event));

for i=1:length(v_veritat_event)
            if strcmp(v_veritat_event(i), 'concert')
                veritat(i) = 1; 
            elseif strcmp(v_veritat_event(i),'conference')
                veritat(i) = 2;
            elseif strcmp(v_veritat_event(i),'exhibition')
                veritat(i) = 3;
            elseif strcmp(v_veritat_event(i),'fashion')
                veritat(i) = 4;
            elseif strcmp(v_veritat_event(i),'non_event')
                veritat(i) = 5;
            elseif strcmp(v_veritat_event(i),'other')
                veritat(i) = 6;
            elseif strcmp(v_veritat_event(i),'protest')
                veritat(i) = 7;
            elseif strcmp(v_veritat_event(i),'sports')
                veritat(i) = 8;
            elseif strcmp(v_veritat_event(i),'theater_dance')
                veritat(i) = 9;
            end              
end

%Passo vector classificador:

clas = zeros(1,length_clas);

for i=1:length_clas
            if strcmp(vector_clas_event(i),'concert')
                clas(i) = 1; 
            elseif strcmp(vector_clas_event(i),'conference')
                clas(i) = 2;
            elseif strcmp(vector_clas_event(i),'exhibition')
                clas(i) = 3;
            elseif strcmp(vector_clas_event(i),'fashion')
                clas(i) = 4;
            elseif strcmp(vector_clas_event(i),'non_event')
                clas(i) = 5;
            elseif strcmp(vector_clas_event(i),'other')
                clas(i) = 6;
            elseif strcmp(vector_clas_event(i),'protest')
                clas(i) = 7;
            elseif strcmp(vector_clas_event(i),'sports')
                clas(i) = 8;
            elseif strcmp(vector_clas_event(i),'theater_dance')
                clas(i) = 9;
            end            
end

clas = clas';

%% CALCULEM QUANTES CLASSES HI HA A LA VERITAT TERRENY QUE TAMB� SON A LA PREDICCI� DEL CLASSIFICADOR

classes_totals = 9;

contador_events = 0;

for a=1:classes_totals
    for i=1:length(veritat)
        if veritat(i)==a
            contador_events = contador_events + 1;
            break; %Un cop hem trobat l'event, sortim del for per mirar el seg�ent event si existeix en el vector veritat.
        end
    end
end

%% --------- CALCULEM AMB LA FUNCI� getcm.m ELS PAR�METRES D'AVALUACI� --------------------

[matriu_confusio,numcorrectes,precisio,record,fscore] = getcm (veritat,clas,1:9);


%% ---------- CALCULEM LA MITJANA DE LA PRECISI�, RECORD I F-SCORE -----------------

%C�lcul mitjana F1-Score:

avg_fscore = sum(fscore)/contador_events;

%C�lcul mitjana Precisi�:

avg_precisio = sum(precisio)/contador_events;

%C�lcul mitjana Record:

avg_record = sum(record)/contador_events;

%% Concatenem els vectors de precisio, record i fscore de cada event en una matriu anomenada: precisio_record_fscore

precisio_record_fscore = [precisio; record; fscore];
precisio_record_fscore = precisio_record_fscore';

%% Concatenem les mitjanes de cada mesura al vector: precisio_record_fscore

avg_measures = [avg_precisio avg_record avg_fscore];

%% C�lcul de l'exactitud:

exactitud = (numcorrectes/length_clas)*100;

%% Obtenci� dels valors correctes, erronis i totals

valors_correctes = numcorrectes;
valors_erronis = length_clas - numcorrectes;
valors_totals = length_clas;

erronis_xcent = (valors_erronis/length_clas)*100;

ordre_events = {'concert','conference','exhibition','fashion','non_event','other','protest','sports','theater_dance'};
ordre_events = ordre_events';

%% Exportem a un fitxer .txt els resultats complets de l'avaluaci�

nom = strcat('./ResultatsComplets', '/','Resultats-',classificador_dir(3).name);
fid = fopen(nom,'wt');

fprintf(fid, '\nPrecisi�:\n');
for i=1:9
    fprintf(fid, '\t');
    fprintf(fid, num2str(precisio(i)));
    fprintf(fid, '\n');
end

fprintf(fid, '\nRecord:\n');
for i=1:9
    fprintf(fid, '\t');
    fprintf(fid, num2str(record(i)));
    fprintf(fid, '\n');
end

fprintf(fid, '\nFscore:\n');
for i=1:9
    fprintf(fid, '\t');
    fprintf(fid, num2str(fscore(i)));
    fprintf(fid, '\n');
end

fprintf(fid, '\nAVG Precisi�: ');
fprintf(fid, num2str(avg_precisio));
fprintf(fid, '\n\n');

fprintf(fid, '\nAVG Record: ');
fprintf(fid, num2str(avg_precisio));
fprintf(fid, '\n\n');

fprintf(fid,'\nAVG F-Score: ');
fprintf(fid, num2str(avg_fscore));
fprintf(fid, '\n\n');

fprintf(fid,'Exactitud: ');
fprintf(fid, num2str(exactitud));
fprintf(fid, '\n\n');

fprintf(fid,'Nombre devents correctes: ');
fprintf(fid, num2str(valors_correctes));
fprintf(fid, '\n\n');

fprintf(fid,'Nombre devents erronis: ');
fprintf(fid, num2str(valors_erronis));
fprintf(fid, '\n\n');

fprintf(fid, 'Nombre de imatges classificades: ');
fprintf(fid, num2str(length_clas));
fprintf(fid, '\n\n');


fclose(fid);

%% Exportem a un fitxer .txt amb l'exactitud i la mitjana de l'Fscore

nom_exactitud_fscore = strcat('./ResultatsExactitudFscore', '/','ExactitudFscore-',classificador_dir(3).name);
file_exfs = fopen(nom_exactitud_fscore,'wt');

fprintf(file_exfs, num2str(exactitud));
fprintf(file_exfs, num2str('\n'));
fprintf(file_exfs, num2str(avg_fscore));

fclose(file_exfs);
toc;
