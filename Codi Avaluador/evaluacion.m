%@c This is part of the SocialDetector Software.
%@c Copyright (C) 2013 Antonio Jesús Urbano Torres
%@c Free Software Foundation, Inc.
%@c See the file README for copying conditions.

%% ---------------Passar Dades .csv a vectors MATLAB---------------------

%IMPORTEM LES DADES DE VERITAT TERRENY de .csv a MATLAB:

directori = uigetdir(pwd,'Escull la carpeta on hi ha el fitxer de Veritat Terreny amb delimitador ",":');
veritat_terreny_dir = dir(directori);

%path_avaluador = './veritatterreny.csv';
path_avaluador = strcat(directori, '/', veritat_terreny_dir(3).name);
formats = '%s%s'; %Format de les dades en cada columna
headerLines = 1; %Tenim una primera fila amb la capcelera: document_id, event_types.
delimiter = ',';
[VeritatTerreny{1:2}] = textread(path_avaluador, formats,'headerlines', headerLines, 'delimiter', delimiter);

%IMPORTEM LES DADES DEL CLASSIFICADOR de .csv a MATLAB:

directori = uigetdir(pwd,'Escull la carpeta on hi ha el fitxer dels resultats del Classificador amb delimitador " ":');
classificador_dir = dir(directori);

path_avaluador = strcat(directori, '/', classificador_dir(3).name);
formats = '%s%s'; %Format de les dades en cada columna
headerLines = 0; %Tenim una primera fila amb la capcelera: document_id, event_types.
delimiter = ' ';
[Classificador{1:2}] = textread(path_avaluador, formats,'headerlines', headerLines, 'delimiter', delimiter);


%PASSEM LES DUES COLUMNES AMB DOS VECTORS ID I EVENT

vector_ver_id = [VeritatTerreny{1}];
vector_ver_event = [VeritatTerreny{2}];
length_veritat = length(vector_ver_event);

vector_clas_id = [Classificador{1}];
vector_clas_event = [Classificador{2}];
length_clas = length(vector_clas_event);

%% Canviar el vector de veritat terreny ordenant-lo i fent-lo del tamany del vector del classificador.

for i=1:length_clas
    id = vector_clas_id(i); %%Agafem cada id.
    
    %El busquem al vector de veritat terreny recorrent-lo
    for j=1:length_veritat
        if strcmp(id, vector_ver_id(j)) %Si trobem l'id al vector de veritat terreny, agafem el seu id i l'event.
            id_trobat = vector_ver_id(j);
            event_trobat = vector_ver_event(j);
            break;
        end
    end
    %Fem un nou vector de veritat terreny del tamany del vector del
    %classificador i ordenat de la mateixa manera.
    v_veritat_id(i) = id_trobat;
    v_veritat_event(i) = event_trobat;
    
end

v_veritat_id = v_veritat_id'; %Fem la transposada
v_veritat_event = v_veritat_event'; %Fem la transposada

%% ---------Passar vectors de String a valors entre 1 fins al número de classes ------------

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

%% --------- CALCULEM AMB LA FUNCIÓ getcm.m ELS PARÀMETRES D'AVALUACIÓ --------------------

[matriu_confusio,numcorrectes,precisio,record,fscore] = getcm (veritat,clas,1:9);

%% ---------- CALCULEM LA MITJANA DE LA PRECISIÓ, RECORD I F-SCORE -----------------


%Comprovació de que Precisió, Record i F-Score de la mateixa clase no
%siguin 0.

%Creem un nou vector de precisió, record i fscore sense els valors que
%valen 0 en les 3 mesures ja que significa que no apareixen aquelles
%classes ni en la veritat terreny ni en els resultats del classificador.

j=1;
for i=1:9
    valor1 = precisio(i);
    valor2 = record(i);
    valor3 = fscore(i);
    if valor1~=0 && valor2~=0 && valor3~=0
        prec(j) = valor1;
        rec(j) = valor2;
        fsc(j) = valor3;
       
        j=j+1;
    end
end

%Per fer les mitjanes utilitzem la funció mean
avg_precisio = mean(prec);
avg_record = mean(rec);
avg_fscore = mean(fsc);

precisio_record_fscore = [precisio; record; fscore];
precisio_record_fscore = precisio_record_fscore';

avg_measures = [avg_precisio avg_record avg_fscore];

valors_erronis = length_clas - numcorrectes;
valors_totals = [numcorrectes length_clas valors_erronis];

correctes_xcent = (numcorrectes/length_clas)*100;
erronis_xcent = ((length_clas - numcorrectes)/length_clas)*100;

valors_xcent = [correctes_xcent erronis_xcent];

%% Exportem a un fitxer .txt els resultats de l'avaluació

fid = fopen('Resultats_Avaluacio.txt','wt');

fprintf(fid, 'MATRIU DE CONFUSIÓ');
fprintf(fid, '\n\n\');
fprintf(fid, '                                                                     Predicció\n');
fprintf(fid, '                                concert conference exhibition fashion non_event other protest sports theater_dance');
fprintf(fid, '\n');

vector_strings = {'concert' 'conference' 'exhibition' 'fashion' 'non_event' 'other' 'protest' 'sports' 'theater_dance'};

for i=1:9
    if i==5
        fprintf(fid, 'Veritat Terreny   ');
    end
    if i~=5
        fprintf(fid, '                  ');
    end
    fprintf(fid, vector_strings{i});
    if i~=9
        fprintf(fid, '        ');
    end
    if i==9
        fprintf(fid, '  ');
    end
    
    for j=1:9
        fprintf(fid, num2str(matriu_confusio(i,j)));
        fprintf(fid, '        ');
        if j==9
            fprintf(fid, '\n');
        end
    end
end

fprintf(fid,'\n\n\n'); %Fem un canvi de linia

fprintf(fid,'MESURES AVALUACIÓ:');
fprintf(fid,'\n\n');

fprintf(fid, '                   Precisió           Record           F-Score \n');
for i=1:9
    fprintf(fid, vector_strings{i});
    fprintf(fid, '\t\t\t\t');
    fprintf(fid, num2str(precisio(i)));
    fprintf(fid, '\t\t\t\t');
    fprintf(fid, num2str(record(i)));
    fprintf(fid, '\t\t\t\t');
    fprintf(fid, num2str(fscore(i)));
    fprintf(fid, '\n');
end

fprintf(fid, '\n\n');

fprintf(fid,'AVG Precisió: ');
fprintf(fid, num2str(avg_precisio));
fprintf(fid, '\n');
fprintf(fid,'AVG Record: ');
fprintf(fid, num2str(avg_record));
fprintf(fid, '\n');
fprintf(fid,'AVG F-Score: ');
fprintf(fid, num2str(avg_fscore));
fprintf(fid, '\n\n');

fprintf(fid,'Encerts: ');
fprintf(fid, num2str(numcorrectes));
fprintf(fid, ' (');
fprintf(fid, num2str(correctes_xcent));
fprintf(fid, ')');
fprintf(fid, '\n');

fprintf(fid,'Erronis: ');
fprintf(fid, num2str(valors_erronis));
fprintf(fid, ' (');
fprintf(fid, num2str(erronis_xcent));
fprintf(fid, ')');
fprintf(fid, '\n');

fprintf(fid,'Totals: ');
fprintf(fid, num2str(length_clas));

fclose(fid);


