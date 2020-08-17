#!/bin/bash
# Log miner config
gsutil cp gs://"$1"/enable_logmnr.sql .
sudo docker cp ./enable_logmnr.sql Oracle-DB:/home/oracle/
sudo docker exec -it Oracle-DB bash -c "source /home/oracle/.bashrc; echo @/home/oracle/enable_logmnr.sql | sqlplus / as sysdba"