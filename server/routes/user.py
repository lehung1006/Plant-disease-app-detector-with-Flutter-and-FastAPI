from fastapi import APIRouter, Depends
from bson.objectid import ObjectId
from database.user.user import (
    userResponseEntity,
    get_user_by_id
)
from model.user import (
    UserResponse
)
from routes.oauth2 import AuthJWT, require_user

router = APIRouter()


@router.get('/me', response_model=UserResponse)
async def get_me(user_id: str = Depends(require_user)):
    user = userResponseEntity(await get_user_by_id(user_id))
    return {"status": "success", "user": user}
