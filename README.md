# Notes



## Push to Sagemaker container registry

Setup AWS credentials in AWS CLI

```bash
aws configure
```

Train the model and log it to MLFlow

```bash
python train.py
```

This will return the run id and the artifact location. To view the logged metrics run.

```bash
mlflow ui
```

Now that we have generated the model runs lets upload runs to S3.

```bash
python ./sync-mlruns-to-s3.py
```

Docker should be install locally first. You can check this by running `docker --version` in the terminal.

Now push container to aws elastic container registry.

```bash
mlflow sagemaker build-and-push-container
```