from database.db import get_db
from bson.objectid import ObjectId
PEST_COLLECTION = "pests"


db = get_db()

pest_collection = db.get_collection(PEST_COLLECTION)


def pest_helper(pest) -> dict:
    return {
        "id": str(pest["_id"]),
        "name": pest["vi_name"],
        "img": pest["img"],
        "description": pest["Living_habits_and_harmful_ways"],
    }


def pest_detail(pest) -> dict:
    return {
        "id": str(pest["_id"]),
        "name": pest["vi_name"],
        "img": pest["img"],
        "description": pest["Living_habits_and_harmful_ways"],
        "prevention": pest["Preventive_measures"],
    }


async def retrieve_pests():
    pests = []
    async for pest in pest_collection.find():
        pests.append(pest_helper(pest))
    return pests


async def retrieve_pest_by_id(id: str) -> dict:
    pest = await pest_collection.find_one({"_id": ObjectId(id)})
    if pest:
        return pest_detail(pest)


async def retrieve_pest_by_label(name: str) -> dict:
    pest = await pest_collection.find_one({"label": name})
    if pest:
        return pest_detail(pest)
