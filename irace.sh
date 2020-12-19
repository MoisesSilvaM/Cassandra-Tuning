#!/bin/bash

path=/home/moises_silva/tuning/

#Copying cassandra-generic.yaml file to Cassandra directory#
sudo cp ${path}cassandra-generic.yaml /etc/cassandra/cassandra-generic.yaml

#Running irace
$IRACE_HOME/bin/irace

##Saving some files
sudo cp ${path}arena/irace.Rdata ${path}arena/irace-original.Rdata
sudo cp ${path}target-runner ${path}target-runner-original

#Taking the results from the irace files
parnames=`Rscript -e "load(\"arena/irace.Rdata\");cat(paste(iraceResults\\$parameters\\$names, collapse=' '))"`
confvals=`Rscript -e "load(\"arena/irace.Rdata\");unname(iraceResults\\$allConfigurations[tail(iraceResults\\$iterationElites, 1),2:(ncol(iraceResults\\$allConfigurations)-1)])"`
echo $parnames > testconfiguration.txt
echo $( echo "$confvals" | cut -d " " -f 2-) >> testconfiguration.txt

#Changing the number of operations by replacing target-runner and instances-test-list file
sudo cp ${path}target-runner-100k ${path}target-runner
sudo cp ${path}instances-test-list-100k.txt ${path}instances-test-list.txt

echo "Throughput-Time-Workload-100K operations: " > ${path}arena/Throughput-output-.txt

for seed in 0 1 2 3 4 5 6 7 8 9
do
irace --seed $seed --only-test testconfiguration.txt
done

#Changing the number of operations by replacing target-runner file
sudo cp ${path}target-runner-1m ${path}target-runner
sudo cp ${path}instances-test-list-1m.txt ${path}instances-test-list.txt

echo "Throughput-Time-Workload-1M operations: " >> ${path}arena/Throughput-output-.txt

for seed in 10 11 12 13 14 15 16 17 18 19
do
irace --seed $seed --only-test testconfiguration.txt
done

#return to the initial target-runner file
sudo cp ${path}target-runner-original ${path}target-runner
