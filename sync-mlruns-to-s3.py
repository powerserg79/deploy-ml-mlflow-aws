import subprocess

# prepare the s3 path
s3_bucket_name = 'deploy-ml-mlflow-aws'
mlruns_directory = 'mlruns'
s3_path = f's3://{s3_bucket_name}/{mlruns_directory}'

# Execute the sync command
output = subprocess.run(["aws", "s3", "sync", f"./{mlruns_directory}/", s3_path], stdout=subprocess.PIPE,encoding='utf-8')

# Report the output
print(output.stdout)
print("\nSaved to bucket: ", s3_bucket_name)