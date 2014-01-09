% @c This is part of the SocialDetector Software.
% @c Copyright (C) 2013 Antonio Jesús Urbano Torres
% @c Free Software Foundation, Inc.
% @c See the file README for copying conditions.

function [tTags] = tagsCategoriaV2(basededades)

%Generem un cell amb el nom de totes les categories
clases = {'concert', 'conference','exhibition','fashion', 'non_event','other','protest','sports','theater_dance'};

tTags = containers.Map(clases{1},containers.Map());    %Inicialitzem la variable map amb la primera clase
    
    for i=2:length(clases)
        tTags(clases{i}) = containers.Map(); %Afegim les clases següents
    end
                 
        

for (i = 1:length(basededades))
    
    for(j=1:length(basededades(i).tag))
        
        switch(basededades(i).class)
            
             case 'concert',
                valortTag = tTags(basededades(i).class); %valortTag es el map de tTags. valortTag es un mapa que te per key el TAG y per valor el número de repeticions
                if(length(basededades(i).tag{j})>2) %Evitem paraules que siguin més petites o iguals a 2
                    if(isKey(valortTag,basededades(i).tag{j}))
                        repeticionsTag = valortTag(basededades(i).tag{j});
                        valortTag(basededades(i).tag{j})=repeticionsTag+1;
                    else
                        valortTag(basededades(i).tag{j})=1;
                    end
                end
                tTags(basededades(i).class) = valortTag;
                
            case 'conference',
                valortTag = tTags(basededades(i).class);
                if(length(basededades(i).tag{j})>2)
                    if(isKey(valortTag,basededades(i).tag{j}))
                        repeticionsTag = valortTag(basededades(i).tag{j});
                        valortTag(basededades(i).tag{j})=repeticionsTag+1;
                    else
                        valortTag(basededades(i).tag{j})=1;
                    end
                end
                tTags(basededades(i).class) = valortTag;
                
            case 'exhibition',
                valortTag = tTags(basededades(i).class);
                if(length(basededades(i).tag{j})>2)
                    if(isKey(valortTag,basededades(i).tag{j}))
                        repeticionsTag = valortTag(basededades(i).tag{j});
                        valortTag(basededades(i).tag{j})=repeticionsTag+1;
                    else
                        valortTag(basededades(i).tag{j})=1;
                    end
                end
                tTags(basededades(i).class) = valortTag;
                
            case 'fashion',
               valortTag = tTags(basededades(i).class);
                if(length(basededades(i).tag{j})>2)
                    if(isKey(valortTag,basededades(i).tag{j}))
                        repeticionsTag = valortTag(basededades(i).tag{j});
                        valortTag(basededades(i).tag{j})=repeticionsTag+1;
                    else
                        valortTag(basededades(i).tag{j})=1;
                    end
                end
                tTags(basededades(i).class) = valortTag;
                
            case 'non_event',
                valortTag = tTags(basededades(i).class);
                if(length(basededades(i).tag{j})>2)
                    if(isKey(valortTag,basededades(i).tag{j}))
                        repeticionsTag = valortTag(basededades(i).tag{j});
                        valortTag(basededades(i).tag{j})=repeticionsTag+1;
                    else
                        valortTag(basededades(i).tag{j})=1;
                    end
                end
                tTags(basededades(i).class) = valortTag;
                
            case 'other',
                valortTag = tTags(basededades(i).class);
                if(length(basededades(i).tag{j})>2)
                    if(isKey(valortTag,basededades(i).tag{j}))
                        repeticionsTag = valortTag(basededades(i).tag{j});
                        valortTag(basededades(i).tag{j})=repeticionsTag+1;
                    else
                        valortTag(basededades(i).tag{j})=1;
                    end
                end
                tTags(basededades(i).class) = valortTag;
                
            case 'protest',
                valortTag = tTags(basededades(i).class);
                if(length(basededades(i).tag{j})>2)
                    if(isKey(valortTag,basededades(i).tag{j}))
                        repeticionsTag = valortTag(basededades(i).tag{j});
                        valortTag(basededades(i).tag{j})=repeticionsTag+1;
                    else
                        valortTag(basededades(i).tag{j})=1;
                    end
                end
                tTags(basededades(i).class) = valortTag;
                
            case 'sports',
                valortTag = tTags(basededades(i).class);
                if(length(basededades(i).tag{j})>2)
                    if(isKey(valortTag,basededades(i).tag{j}))
                        repeticionsTag = valortTag(basededades(i).tag{j});
                        valortTag(basededades(i).tag{j})=repeticionsTag+1;
                    else
                        valortTag(basededades(i).tag{j})=1;
                    end
                end
                tTags(basededades(i).class) = valortTag;
                
            case 'theater_dance',
                valortTag = tTags(basededades(i).class);
                if(length(basededades(i).tag{j})>2)
                    if(isKey(valortTag,basededades(i).tag{j}))
                        repeticionsTag = valortTag(basededades(i).tag{j});
                        valortTag(basededades(i).tag{j})=repeticionsTag+1;
                    else
                        valortTag(basededades(i).tag{j})=1;
                    end
                end
                tTags(basededades(i).class) = valortTag;
        end
    end
 end

end