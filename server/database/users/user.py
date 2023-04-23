from database.db import get_db
from config import settings
from bson.objectid import ObjectId
db = get_db()
users_collection = db.get_collection(settings.USER_COLLECTION)


def userEntity(user) -> dict:
    return {
        "id": str(user["_id"]),
        "name": user["name"],
        "email": user["email"],
        "role": user["role"],
        "photo": user["photo"],
        "verified": user["verified"],
        "password": user["password"],
        "created_at": user["created_at"],
        "updated_at": user["updated_at"]
    }


def userResponseEntity(user) -> dict:
    return {
        "id": str(user["_id"]),
        "email": user["email"],
        "role": user["role"],
        "photo": user["photo"],
        "name": user["name"],
        "verified": user["verified"],
        "created_at": user["created_at"],
        "updated_at": user["updated_at"]
    }


def embeddedUserResponse(user) -> dict:
    return {
        "id": str(user["_id"]),
        "name": user["name"],
        "email": user["email"],
        "photo": user["photo"]
    }


def userListEntity(users) -> list:
    return [userEntity(user) for user in users]


async def get_user_by_id(id: str) -> dict:
    user = await users_collection.find_one({"_id": ObjectId(id)})
    if user:
        return user


async def is_email_exist(email: str):
    print(email)
    user = await users_collection.find_one({"email": email})
    if user:
        return user
    return None


async def insert_user(payload) -> dict:
    return await users_collection.insert_one(payload.dict())
