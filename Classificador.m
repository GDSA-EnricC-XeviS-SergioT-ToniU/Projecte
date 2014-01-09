% @c This is part of the SocialDetector Software.
% @c Copyright (C) 2013 Antonio Jesús Urbano Torres
% @c Free Software Foundation, Inc.
% @c See the file README for copying conditions.


function [Classe]= Classificador(TfIdf)

clases = {'non_event', 'conference','exhibition','fashion', 'concert','other','protest','sports','theater_dance'};
maxim = max(TfIdf(clases{1}));
Classe='non_event';

for i=2:length(clases)
    if(max(TfIdf(clases{i})) > maxim)
        Classe = clases{i};
        maxim = max(TfIdf(clases{i}));
    end
end

end

