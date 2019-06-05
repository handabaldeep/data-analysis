setwd("/home/handabaldeep/Documents/RHUL/DA-CS5100/Assignment/Assign3")
# Load the data from the file
gene_data <- read.table("nci.data.txt")
gene_mat <- as.matrix(gene_data)
# Transpose the matrix
gene_Tmat <- t(gene_mat)
# Create distance matrix of the transposed matrix
dist_mat <- data.matrix(dist(gene_Tmat))

# Single Agglomerative Linkage
# Calculate indices for merging the clusters and store them into a matrix 'single_inx'
dist_mat_temp <- dist_mat
single_inx <- matrix(nrow = 63,ncol = 2)
for (j in 1:63){
  inx_s <- which(dist_mat_temp==min(dist_mat_temp[dist_mat_temp!=0]),arr.ind=TRUE)
  single_inx[j,1] <- min(inx_s[1,])
  single_inx[j,2] <- max(inx_s[1,])
  for (i in 1:nrow(dist_mat_temp)){
    #sample[i,inx_s[1,1]] <- sample[inx_s[1,1],i] <- sample[i,inx_s[1,2]] <- sample[inx_s[1,2],i] <- min(sample[i,inx_s[1,1]],sample[i,inx_s[1,2]])
    dist_mat_temp[i,inx_s[1,1]] <- dist_mat_temp[inx_s[1,1],i] <- dist_mat_temp[i,inx_s[1,2]] <- dist_mat_temp[inx_s[1,2],i] <- min(dist_mat_temp[i,inx_s[1,1]],dist_mat_temp[i,inx_s[1,2]])
    dist_mat_temp[i,i] <- 0
  }
  dist_mat_temp <- dist_mat_temp[-single_inx[j,2],-single_inx[j,2]]
}

# Complete Agglomerative Linkage
# Calculate indices for merging the clusters and store them into a matrix 'complete_inx'
dist_mat_temp <- dist_mat
complete_inx <- matrix(nrow = 63,ncol = 2)
for (j in 1:63){
  inx_s <- which(dist_mat_temp==min(dist_mat_temp[dist_mat_temp!=0]),arr.ind=TRUE)
  complete_inx[j,1] <- min(inx_s[1,])
  complete_inx[j,2] <- max(inx_s[1,])
  for (i in 1:nrow(dist_mat_temp)){
    dist_mat_temp[i,inx_s[1,1]] <- dist_mat_temp[inx_s[1,1],i] <- dist_mat_temp[i,inx_s[1,2]] <- dist_mat_temp[inx_s[1,2],i] <- max(dist_mat_temp[i,inx_s[1,1]],dist_mat_temp[i,inx_s[1,2]])
    dist_mat_temp[i,i] <- 0
  }
  dist_mat_temp <- dist_mat_temp[-max(inx_s[1,]),-max(inx_s[1,])]
}

# Average Agglomerative Linkage
# Calculate indices for merging the clusters and store them into a matrix 'avg_inx'
dist_mat_temp <- dist_mat
avg_inx <- matrix(nrow = 63,ncol = 2)
for (j in 1:63){
  inx_s <- which(dist_mat_temp==min(dist_mat_temp[dist_mat_temp!=0]),arr.ind=TRUE)
  avg_inx[j,1] <- min(inx_s[1,])
  avg_inx[j,2] <- max(inx_s[1,])
  for (i in 1:nrow(dist_mat_temp)){
    dist_mat_temp[i,inx_s[1,1]] <- dist_mat_temp[inx_s[1,1],i] <- dist_mat_temp[i,inx_s[1,2]] <- dist_mat_temp[inx_s[1,2],i] <- (dist_mat_temp[i,inx_s[1,1]]+dist_mat_temp[i,inx_s[1,2]])/2
    dist_mat_temp[i,i] <- 0
  }
  dist_mat_temp <- dist_mat_temp[-max(inx_s[1,]),-max(inx_s[1,])]
}

# Centroid Agglomerative Linkage
# Calculate indices for merging the clusters and store them into a matrix 'cen_inx'
dist_mat_temp <- dist_mat
cen_inx <- matrix(nrow = 63,ncol = 2)
for (j in 1:63){
  inx_s <- which(dist_mat_temp==min(dist_mat_temp[dist_mat_temp!=0]),arr.ind=TRUE)
  cen_inx[j,1] <- min(inx_s[1,])
  cen_inx[j,2] <- max(inx_s[1,])
  for (i in 1:nrow(dist_mat_temp)){
    dist_mat_temp[i,inx_s[1,1]] <- dist_mat_temp[inx_s[1,1],i] <- dist_mat_temp[i,inx_s[1,2]] <- dist_mat_temp[inx_s[1,2],i] <- (dist_mat_temp[i,inx_s[1,1]]+dist_mat_temp[i,inx_s[1,2]])/2
    dist_mat_temp[i,i] <- 0
  }
  dist_mat_temp <- dist_mat_temp[-max(inx_s[1,]),-max(inx_s[1,])]
}

# Print the results for different linkages
print(single_inx)
print(complete_inx)
print(avg_inx)
print(cen_inx)

# K-means clustering on same data
km.out <- kmeans(gene_Tmat,2,nstart = 20)
km.out$cluster
plot (gene_Tmat , col =( km.out$cluster +1) , main =" K - Means Clustering Results with K =2" , xlab ="" , ylab ="" , pch =20 , cex =2)
