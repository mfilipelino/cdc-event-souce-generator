import pubsub
import logging
import json
from faker import Faker

from settings import GOOGLE_PROJECT_ID, PUBSUB_TOPIC


logging.basicConfig(
    level=logging.INFO,
    format="%(asctime)s [%(levelname)s] %(message)s",
    handlers=[
        logging.FileHandler('debug.log'),
        logging.StreamHandler()
    ]
)


def run(project, topic):
    Faker.seed(0)
    faker = Faker()    
    pubsub.get_or_create_topic(project, topic)
    id = 0
    while True:
        simple_profile = faker.simple_profile()
        simple_profile['id'] = id
        id += 1
        simple_profile = json.dumps(simple_profile, default=str)
        pubsub.publish(project, topic, data=simple_profile.encode('utf-8'))
        logging.info(json.dumps(simple_profile))


if __name__ == '__main__':
    run(project=GOOGLE_PROJECT_ID, topic=PUBSUB_TOPIC)