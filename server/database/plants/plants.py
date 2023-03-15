from database.db import get_db, get_image
from bson.objectid import ObjectId
PlANT_COLLECTION = "plants"


db = get_db()
plant_collection = db.get_collection(PlANT_COLLECTION)


def plant_helper(plant) -> dict:
    return {
        "id": str(plant["_id"]),
        "name": plant["name"],
        "img": [get_image(plant["imgpath"])[0]],
        "description": plant["description"],
    }


def plant_detail(plant) -> dict:
    return {
        "id": str(plant["_id"]),
        "name": plant["name"],
        "img": get_image(plant["imgpath"]),
        "science_name": plant["science_name"],
        "description": plant["description"],
        "plant_type": plant["plant_type"],
        "lifespan": plant["lifespan"],
        "bloom_time": plant["bloom_time"],
        "plant_height": plant["plant_height"],
        "spread": plant["spread"],
        "habitat": plant["habitat"],
        "difficulty_rating": plant["difficulty_rating"],
        "sunlight": plant["sunlight"],
        "hardiness": plant["hardness"],
        "hardiness_zone": plant["hardness_zone"],
        "soil": plant["soil"],
        "water": plant["water"],
        "fertilization": plant["fertilization"],
        "planting_time": plant["planting_time"],
        "harvest_time": plant["harvest_time"],
        "propagation": plant["propagation"],
        "pests": plant["pests"],
        "disease": plant["diseases"],
        "uses": plant["uses"],
    }
# get list of plants include id, name, description


async def retrieve_plants():
    plants = []
    async for plant in plant_collection.find():
        plants.append(plant_helper(plant))
    return plants
# get info of plant by id


async def retrieve_plant_by_id(id: str) -> dict:
    plant = await plant_collection.find_one({"_id": ObjectId(id)})
    if plant:
        return plant_detail(plant)


async def retrieve_plant_by_name(name: str) -> dict:
    plant = await plant_collection.find_one({"name": name})
    if plant:
        return plant_detail(plant)
