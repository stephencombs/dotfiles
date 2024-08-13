#!/bin/bash

s3_logs_agg() {
  # This script downloads all the *.log(.gz) objects from an S3 bucket and aggregates them into a single file.
  # The aggregated file is saved in the current directory with the name "logs.log".
  #
  # Usage: s3_logs_agg <bucket_uri> <output_file_name>
  #
  # Example: s3_logs_agg my-logs-bucket logs.log

  # Check if the required parameters are provided
  if [ $# -ne 2 ]; then
    echo "Usage: s3_logs_agg <bucket_uri> <output_file_name>"
  fi

  # Set the bucket name and output file name
  bucket_uri=$1
  output_file_name=$2

  mkdir -p ./s3_temp
  mkdir -p ./s3_output

  # # Check if the bucket exists
  # if ! aws s3api head-bucket --bucket "$bucket_uri" >/dev/null 2>&1; then
  #   echo "Error: Bucket $bucket_uri does not exist."
  #   exit 1
  # fi

  # Download all the *.log(.gz) objects from the bucket
  # wait for the sync to finish before continuing
  echo "Downloading logs from $bucket_uri ⚙️" && aws s3 sync "$bucket_uri" ./s3_temp
  echo "Download complete ✅"

  # Unzip all the *.log.gz files
  echo "Unzipping logs ⚙️" && (cd ./s3_temp && gzip -d -- *.log.gz)
  echo "Unzip complete ✅"

  # Combine all the *.log files into a single file
  echo "Combining logs ⚙️" && (cd ./s3_temp && cat -- *.log >../s3_output/"$output_file_name")
  echo "Combine complete ✅"

  echo "Cleaning up files"
  rm -rf ./s3_temp
  echo "Cleanup complete ✅"

  echo "Logs aggregated successfully to ./s3_output/$output_file_name"
}
