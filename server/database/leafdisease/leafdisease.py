from database.db import get_db, get_image
from config import settings

db = get_db()
leaf_disease_collection = db.get_collection(settings.LEAF_DISEASE_COLLECTION)


def leaf_disease_detail(plant) -> dict:
    return {
        "id": str(plant["_id"]),
        "name": plant["name"],
        "img": get_image(plant["imgpath"]),
        "description": plant["overview"],
        "solutions": plant["solutions"],
        "prevention": plant["prevention"],
    }


def leaf_disease_helper(plant) -> dict:
    return{
        "id": str(plant["_id"]),
        "name": plant["name"],
        "img": [get_image(plant["imgpath"])[0]],
        "description": plant["overview"],
    }


def leaf_disease_classify_helper(plant) -> dict:
    return{
        "id": str(plant["_id"]),
        "name": plant["name"],
        "description": plant["overview"],
    }


async def retrieve_leaf_diseaes():
    leaf_disease = []
    async for disease in leaf_disease_collection.find():
        if 'healthy' not in disease['labels'] and 'Background_without_leaves' not in disease['labels']:
            leaf_disease.append(leaf_disease_helper(disease))
    return leaf_disease


async def retrieve_leafdisease_by_id(id: str) -> dict:
    plant = await leaf_disease_collection.find_one({"_id": id})
    if plant:
        return leaf_disease_detail(plant)


async def retrieve_leafdisease_by_label(label: str) -> dict:
    plant = await leaf_disease_collection.find_one({"labels": label})
    if plant:
        return leaf_disease_classify_helper(plant)
