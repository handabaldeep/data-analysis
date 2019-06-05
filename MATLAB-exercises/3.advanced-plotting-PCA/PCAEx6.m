

% Part-1

hold on
load 'pcadata.mat';
plot(X(:,1),X(:,2),'bo');
title('Datapoints and their 2 principal components');
axis([0 7 2 8]);
[Xmu,mu] = subtractMean(X);
[U,S] = myPCA(Xmu);
plot(U(:,1)+mu(1),'r-');
plot(U(:,2)+mu(2),'g-');
%Z = projectData(Xmu,U,1);


% Part-2
%hold on
%load 'pcafaces.mat';
%displayData(X(1:100,:));
%[Xmu,mu] = subtractMean(X);
%[U,S] = myPCA(Xmu);
% Z = projectData(Xmu,U,1);
