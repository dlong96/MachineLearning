# Exercise Sheet 4

### Group Members

**Zihan Qi** z.qi@jacobs-university.de

**Danni Long** d.long@jacobs-university.de



### Task Description

pick one of the digits (e.g. the "ones"), which gives you a dataset of 200 image vectors. Carry out a **K-means clustering** on your chosen sample, setting K = 1 (!), 2, 3, and 200 in four runs of this algorithm. Generate visualizations of the images that are coded in the respective codebook vectors that you get (for the K = 200 case, only visualize a few).



### Solution & Observation

Using the description on Notes Page35.

Picking 0 as our datasets, in case K=2, randomly assigned half into S1 , half into S2(size doesnt matter). Then compute mean vectors using vectors in each set.

Now iterate every vector in whole dataset, to compute distance of each vector with mean vectors. if minimum is founded, store the current vector into correspoindg newset.

Finally visulaize differnt dataset.

![creen Shot 2018-03-14 at 11.50.34 P](/Users/Tison/Downloads/Screen Shot 2018-03-14 at 11.50.34 PM.png)

![creen Shot 2018-03-14 at 11.49.48 P](/Users/Tison/Downloads/Screen Shot 2018-03-14 at 11.49.48 PM.png)

### Discussion

**(1) What is the mathematical nature of the codebook image for the case K = 1?**

When K=1, we have only one  codebook vector, i.e the mean vector of the whole dataset.

It only has one cluster.

**(2) What is the mathematical nature of the codebook images for the case K = 200?**

 When K=200, which equals to the number of our dataset vector. So when calculated the mean vector for each cluster set, it is the vector itself. therefore the dataset has 200 clusters, one for each.



In both of the case, the cluster doesnt actually characterstic the dataset into different fectures. in the case of K=2,3, …, it returns corresponing number of sets, which will feacture the dataset better.







