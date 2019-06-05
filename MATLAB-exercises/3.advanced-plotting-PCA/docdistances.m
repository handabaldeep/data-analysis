
filenames = {'RedRidingHood.txt'; 'PrincessPea.txt'; 'Cinderella.txt'; 'CAFA1.txt'; 'CAFA2.txt'; 'CAFA3.txt'};
f = cell(6,1);
for i = 1:length(filenames)
    f{i} = fileread(filenames{i});
end
corpus = cell(0,0);
for i = 1:length(filenames)
    segments_f{i} = split(f{i});
    corpus = [corpus; segments_f{i}];
end
unique_corpus = unique(corpus);

for i = 1:length(filenames)
    tf = zeros(length(unique_corpus),1);
    idf = zeros(length(unique_corpus),1);
    for j = 1:length(unique_corpus)
        tf(j) = sum(strcmpi(segments_f{i},unique_corpus{j}));
        denom = 0;
        for k = 1:length(filenames)
            if(ismember(unique_corpus{j},segments_f{k}))
               denom = denom + 1;
            end
        end
        idf(j) = log10(length(filenames)/denom);
    end
    tf_idf_f{i} = tf .* idf;
end

mat = zeros(length(filenames),length(filenames));
for i = 1:length(filenames)
   for j = 1:length(filenames)
       mat(i,j) = 1 - dot(tf_idf_f{i},tf_idf_f{j})/(norm(tf_idf_f{i})*norm(tf_idf_f{j}));
   end
end

imagesc(mat);
colormap gray;
colorbar
