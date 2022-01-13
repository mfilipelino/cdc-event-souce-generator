from google.api_core.exceptions import NotFound
from google.cloud import pubsub_v1

publish_client = pubsub_v1.PublisherClient()


def get_or_create_topic(project, topic):
    topic_path = publish_client.topic_path(project, topic)
    try:
        topic = publish_client.get_topic(topic_path)
    except NotFound:
        publish_client.create_topic(topic_path)
    return topic


def publish(project, topic, data):
    topic_path = publish_client.topic_path(project, topic)
    publish_client.publish(topic_path, data)
