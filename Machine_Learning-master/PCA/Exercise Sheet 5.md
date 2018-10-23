# Exercise Sheet 5

### Group Members

**Zihan Qi** z.qi@jacobs-university.de

**Danni Long** d.long@jacobs-university.de

**Xuchong Du** x.du@jacobs-university.de



### Task Description

Pick one of the digits (for instance, pick the "3" digits if you like 3's better than other digits) and continue the rest of this task only with the N = 200 images of this digit.
Compute a PCA of this size-200 dataset. Do not use a ready-made PCA routine but program your PCA function from scratch, building on an SVD. Repeat the reconstruction described in the lecture notes in Section 5.4 for the following percentages of variances preserved in the reconstruction: 50%, 80%, 95%, 99%, 100%. Document the number k of PC's needed in each case and generate images of reconstructions for the first 5 digits in your dataset, for each of the percentages. Explain the number k that you get for the 100% reconstruction.



### Solution & Obeservation

First, pick digit "3" as dataset and load train_data vector from dataset file.

Next, compute centered_patterns vector and covariance matrix C.

Then, use SVD to decomposite C. According to Equation 15 on lecture notes	page 39, simulate the value of m, which is the "cutoff" value of compressed vectors.

Then, compress to feature vectors in m dimensional with 5 to test percentage of variances: 50%, 80%, 95%, 99%, and 100%.

Lastly, uncompress decoded vectors, and output images for testing and observing.



####Output Images & Number k

**Original Dataset**

![rigi](/Users/Tison/Desktop/origin.png)

​		
**50% Variance Preserved (k = 6)**

![1](/Users/Tison/Desktop/1.png)



**80% Variance Preserved (k = 22)**

![2](/Users/Tison/Desktop/2.png)



**95% Variance Preserved (k = 65)**

![3](/Users/Tison/Desktop/3.png)



**99% Variance Preserved (k = 116)**

![4](/Users/Tison/Desktop/4.png)



**100% Variance Preserved (k = 240)**

![5](/Users/Tison/Desktop/5.png)



**Question: ** Explain the number k that you get for the 100% reconstruction.

**Answer:** Since the dimension of decomposited matrix, when preserved variance is 100%, the entire matrix is preserved, thus the value is 240.