This repository contains a basic experimental setup to automatically configure the Cassandra NoSQL database using irace. It uses the YCSB benchmark.

(paper to be submitted)

A full Google Cloud virtual machine to reproduce the experiments can be downloaded [here](https://storage.googleapis.com/deep-tracer-217702-daisy-bkt-us/cassandra-tuning.vmdk) (6.7GB)

# Prerequisites
- Irace https://iridia.ulb.ac.be/irace/
- Cassandra https://cassandra.apache.org/
- YCSB https://github.com/brianfrankcooper/YCSB

# Usage

Clone the repository.

```
$ git clone https://github.com/MoisesSilvaM/Cassandra-Tuning
$ cd Cassandra-Tuning

```

Create a directory for storing the tuning scenario setup.

    $ mkdir ~/tuning

Copy all the files to the scenario directory:

```cp 23_params/* ~/tuning``` 
 if you want to configure 23 parameters, or
 ```cp 5_params/* ~/tuning```
 if you want to configure only the 5 most important parameters.

Copy the workload files you're interested in to the YCSB workload folder.

Create a directory called "arena"

    $ mkdir ~/arena

Change the experiment budget in the scenario file.

    maxExperiments = budget

If you want to include the default configuration, uncomment the `configurationsFile` option in scenario file.

    configurationsFile = "./configurations.txt"

Select the workloads to adjust by commenting/uncommenting the relative workload in the instances file.

Check that all the paths are correct, and point to valid file locations.

Call the script:

    $ sh irace.sh
    or
    $ nohup ./irace.sh > irace.out 2> irace.err &
