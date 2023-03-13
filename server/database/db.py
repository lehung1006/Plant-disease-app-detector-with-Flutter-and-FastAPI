from bson.objectid import ObjectId
import motor.motor_asyncio
MONGO_DETAILS = "mongodb://localhost:27017"


def get_db():
    client = motor.motor_asyncio.AsyncIOMotorClient(MONGO_DETAILS)
    database = client.Plants
    return database
