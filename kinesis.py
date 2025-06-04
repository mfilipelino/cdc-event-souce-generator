import boto3
import json
import logging

from settings import AWS_ACCESS_KEY_ID, AWS_SECRET_ACCESS_KEY, AWS_DEFAULT_REGION, KINESIS_STREAM_NAME

# Configure logging
logging.basicConfig(level=logging.INFO)
logger = logging.getLogger(__name__)

def get_kinesis_client():
    """
    Initializes and returns a boto3 Kinesis client.
    Uses credentials and region from settings.py.
    """
    try:
        client = boto3.client(
            'kinesis',
            aws_access_key_id=AWS_ACCESS_KEY_ID,
            aws_secret_access_key=AWS_SECRET_ACCESS_KEY,
            region_name=AWS_DEFAULT_REGION
        )
        logger.info("Successfully created Kinesis client.")
        return client
    except Exception as e:
        logger.error(f"Error creating Kinesis client: {e}")
        raise

def publish(kinesis_client, stream_name, partition_key, data_bytes):
    """
    Publishes data to a Kinesis stream.

    :param kinesis_client: Initialized Kinesis client.
    :param stream_name: Name of the Kinesis stream.
    :param partition_key: Partition key for the record.
    :param data_bytes: Data to publish (bytes).
    """
    try:
        response = kinesis_client.put_record(
            StreamName=stream_name,
            Data=data_bytes,
            PartitionKey=partition_key
        )
        logger.info(f"Successfully published data to Kinesis. SequenceNumber: {response['SequenceNumber']}, ShardId: {response['ShardId']}")
    except boto3.exceptions.Boto3Error as e: # Catching general Boto3 errors
        logger.error(f"Error publishing data to Kinesis: {e}")
        # Depending on the requirements, you might want to re-raise the exception
        # or handle it in a specific way (e.g., retry logic).
    except Exception as e: # Catching any other unexpected errors
        logger.error(f"An unexpected error occurred while publishing to Kinesis: {e}")
        # Handle unexpected errors as needed.
