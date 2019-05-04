import faiss, numpy
print(faiss.Kmeans(10, 20).train(numpy.random.rand(1000, 10).astype('float32')))
