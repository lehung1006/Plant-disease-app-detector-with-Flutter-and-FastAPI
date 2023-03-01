from bson.objectid import ObjectId
import motor.motor_asyncio

MONGO_DETAILS = "mongodb://localhost:27017"

client = motor.motor_asyncio.AsyncIOMotorClient(MONGO_DETAILS)

database = client.Plants

plant_collection = database.get_collection("Detail")


def plant_helper(plant) -> dict:
    return {
        "id": str(plant["_id"]),
        "name": plant["name"],
        "description": plant["description"],
    }


async def retrieve_plants():
    plants = []
    async for plant in plant_collection.find():
        plants.append(plant_helper(plant))
    return plants


async def add_plant(plant_data: dict) -> dict:
    plant = await plant_collection.insert_one(plant_data)
    new_plant = await plant_collection.find_one({"_id": plant.inserted_id})
    return plant_helper(new_plant)


# Retrieve a plant with a matching ID
async def retrieve_plant(id: str):
    plant = await plant_collection.find_one({"_id": ObjectId(id)})
    if plant:
        return plant_helper(plant)


async def retrieve_plant_by_no(no: str):
    plant = await plant_collection.find_one({"no": no})
    if plant:
        return plant_helper(plant)


# Update a plant with a matching ID
async def update_plant(id: str, data: dict):
    # Return false if an empty request body is sent.
    if len(data) < 1:
        return False
    plant = await plant_collection.find_one({"_id": ObjectId(id)})
    if plant:
        updated_plant = await plant_collection.update_one(
            {"_id": ObjectId(id)}, {"$set": data}
        )
        if updated_plant:
            return True
        return False


# Delete a plant from the database
async def delete_plant(id: str):
    plant = await plant_collection.find_one({"_id": ObjectId(id)})
    if plant:
        await plant_collection.delete_one({"_id": ObjectId(id)})
        return True
