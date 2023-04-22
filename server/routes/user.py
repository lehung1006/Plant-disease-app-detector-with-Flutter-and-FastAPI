from fastapi import APIRouter, Depends
from database.users.user import (
    userResponseEntity,
    get_user_by_id
)
from model.user import (
    UserResponse
)
from routes.oauth2 import  require_user

router = APIRouter()


@router.get('/me', response_model=UserResponse)
async def get_me(user_id: str = Depends(require_user)):
    user = userResponseEntity(await get_user_by_id(user_id['id']))
    return {"status": "success", "user": user}
