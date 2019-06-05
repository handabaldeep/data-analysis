
function [c1,c2] = wordscount(n)
% Return n most frequent and least frequent words in a text file
    c1 = cell(length(n),2); % Most frequent words with count
    c2 = cell(length(n),2); % Least frequent words with count
    str = fileread('RedRidingHood.txt');
    segments = strings(0);
    rest = str;
% Convert the string into vector of words
    while rest ~= ""
        [first,rest] = strtok(rest);
        segments = [segments ; first];
    end
% Remove duplicates from the vector 
    segments_short = unique(segments);
    ctr = zeros(length(segments_short),1);
% Count occurences of each word
    for i=1:length(segments_short)
        ctr(i) = sum(strcmpi(segments,segments_short(i)));
    end
% Sort the string vector based on the number of occurrences in increasing
% order
    [ctr_sorted,ctr_order] = sort(ctr);
    segments_sorted = segments_short(ctr_order,:);
    if n>length(segments_sorted)
        error('N cannot be greater than the number of unique words');
    end
    for i=1:n
        c1{i,1} = segments_sorted(length(segments_sorted)-i+1);
        c1{i,2} = ctr_sorted(length(ctr_sorted)-i+1);
        c2{i,1} = segments_sorted(i);
        c2{i,2} = ctr_sorted(i);
    end
end
