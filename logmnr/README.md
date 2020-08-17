# Logmner Configuration

This script automatically configures logmner on Oracle instance.

### Requirements

Access to GCS from compute instance.

### Usage

```shell
    chmod +x ./logmnr.sh
    # ./logmnr.sh [GCS PATH WHERE .SQL LOGMNR CONFIGURATION IS ALLOCATED.]
    ./logmnr.sh run-dependencies
```

This script will run and at its end the logminer will be working and you going to be allowed to proceed with cdc connections.

### Checking if everything is ok

Initialize a new connection on oracle database.

```shell
    #sudo docker exec -it [ORACLE CONTAINER NAME] bash
    sudo docker exec -it Oracle-DB bash
    sqlplus sys as sysdba
```

once you have made a successfully connection on database you'll be able to run some queries to verify if everything is ok.

```sql
    SELECT log_mode FROM V$DATABASE;
```

expected output:

|LOG_MODE     |
|:------------:
|ARCHIVELOG   |

```sql
    SELECT supplemental_log_data_min, supplemental_log_data_pk, supplemental_log_data_all FROM V$DATABASE;
```

expected output:

|SUPPLEMENTAL    |SUP  |SUP  |
|:---------------|:---:|:---:|
|IMPLICIT or YES |YES  |YES  |