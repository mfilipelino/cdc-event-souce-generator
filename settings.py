import os

GOOGLE_PROJECT_ID = os.getenv("GOOGLE_CLOUD_PROJECT", "local")
PUBSUB_TOPIC = os.getenv("PUBSUB_TOPIC", "streaming-cdc")
