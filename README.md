##Requisites##
- Irace (https://iridia.ulb.ac.be/irace/)
- Cassandra (https://cassandra.apache.org/)
- YCSB (https://github.com/brianfrankcooper/YCSB)

##Usage##
#Create a directory for storing the tuning scenario setup
    $ mkdir ~/tuning
    $ cd ~/tuning

#Copy the files to the scenario directory, 
    Copy the contents of the 23_params folder to the tuning folder if you want to adjust 23 parameters
    Copy the contents of the 5_params folder to the tuning folder if you want to adjust 5 parameters.

#Copy the workload files to the YCSB workload folder

#create a directory called "arena"
    $ mkdir ~/arena

#change the experiment budget in the scenario file.

#Include the default configuration uncommenting the text configurationsFile = "./configurations.txt" in scenario file.

#Select the workloads to adjust, uncommenting the workload in the instance-list.txt file.

#Select the workloads to test, uncommenting the workload in the files instance - test-list-100k.txt (for the first scenario) and instance - test-list-1m.txt (for the second scenario)

Call the script:
    $ sh irace.sh
