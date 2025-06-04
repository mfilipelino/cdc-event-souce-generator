import os

GOOGLE_PROJECT_ID = os.getenv("GOOGLE_CLOUD_PROJECT", "local")
PUBSUB_TOPIC = os.getenv("PUBSUB_TOPIC", "streaming-cdc")

AWS_ACCESS_KEY_ID = os.getenv("AWS_ACCESS_KEY_ID", "YOUR_ACCESS_KEY")
AWS_SECRET_ACCESS_KEY = os.getenv("AWS_SECRET_ACCESS_KEY", "YOUR_SECRET_KEY")
AWS_DEFAULT_REGION = os.getenv("AWS_DEFAULT_REGION", "us-east-1")
KINESIS_STREAM_NAME = os.getenv("KINESIS_STREAM_NAME", "default-stream-name")
