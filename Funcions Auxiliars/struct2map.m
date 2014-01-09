function baseDadesMAP = struct2map(baseDadesSTRUCT)
    
    baseDadesMAP = containers.Map();

    for i=1:length(baseDadesSTRUCT)
        baseDadesMAP(baseDadesSTRUCT(i).id) = baseDadesSTRUCT(i);
    end
    
    