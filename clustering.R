# The SSE_Ratio is a measure of the total variance in your data set that is explained by the clustering. 
# k-means minimize the within group dispersion and maximize the between-group dispersion.
# By assigning the samples to k clusters rather than n (number of samples) clusters achieved 
# a reduction in sums of squares of SSE_Ratio.

# Choose the data on which clustering has to be done
library(MASS)
ClusterData=Boston
set.seed(10)
# Create a data frame to store results
OptimalClusters=data.frame(
numberOfClusters=numeric(0),
SSE_Ratio=numeric(0)
)

# Trying to find out best number of clusters
for (i in c(1:10)){
clusterIris=kmeans(ClusterData,i)
OptimalClusters=rbind(OptimalClusters,data.frame(
numberOfClusters=i,
SSE_Ratio=100*(clusterIris$betweenss/clusterIris$totss)))
}

# By looking at the curve we can see 3 clusters are optimal which are explaining 88.8% of the variance
plot(OptimalClusters$numberOfClusters,OptimalClusters$SSE_Ratio)
lines(OptimalClusters$numberOfClusters,OptimalClusters$SSE_Ratio)
