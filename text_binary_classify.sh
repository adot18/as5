#!/usr/bin/env bash

# setting CLASSPATH based on user provided argument 1
export CLASSPATH=$CLASSPATH:$1

# converting to .arff
java weka.core.converters.TextDirectoryLoader -dir $2 > output.arff

# converting to word vector
java -Xmx2048m weka.filters.unsupervised.attribute.StringToWordVector  -i output.arff -o output-training.arff -M 2

# run classifier
java -Xmx2048m  weka.classifiers.meta.ClassificationViaRegression -W weka.classifiers.trees.M5P -num-decimal-places 4  -t output-training.arff -d output-training.model -c 1

