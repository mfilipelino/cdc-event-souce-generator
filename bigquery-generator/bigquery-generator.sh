#!/bin/bash

#VARIABLES
PROJECT_ID="dasa-hvar-dev"
DATASET="dasa"

gcloud config set project ${PROJECT}

# resolve_variables <text> <project_id> <environment>
resolve_variables() {
	# function parameters
	TEXT=$1

	# replace variables inside text
	RESULT=${TEXT//"{PROJECT}"/"$PROJECT"}
	RESULT=${RESULT//"{DATASET}"/"$DATASET"}

	# return results
	echo "$RESULT"
}

run_sql_script() {
	# Receive file
	FILE=$1

	# Get file content
	SCRIPT_CONTENT=$(<"$FILE")

	# Replace variables inside script
	QUERY=$(resolve_variables "$SCRIPT_CONTENT")

	bq query --use_legacy_sql=false "$QUERY"
}

run_sql_script "./snap_profile.sql"
run_sql_script "./snap_purchase.sql"
run_sql_script "./table_profile.sql"
run_sql_script "./table_profile_full.sql"
run_sql_script "./table_purchase.sql"
run_sql_script "./table_purchase_full.sql"