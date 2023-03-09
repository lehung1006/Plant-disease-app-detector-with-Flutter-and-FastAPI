from typing import Optional

from pydantic import BaseModel, Field


class Item(BaseModel):
    img: str


class PlantSchema(BaseModel):
    id: str = Field(..., alias='_id')
    no: int
    name: str
    science_name: str
    description: str
    plant_type: str
    lifespan: str
    bloom_time: str
    plant_height: str
    spread: str
    habitat: str
    difficulty_rating: str
    sunlight: str
    hardiness: str
    hardiness_zone: str
    soil: str
    water: str
    fertilization: str
    planting_time: str
    harvest_time: str
    propagation: str
    pests: str
    diseases: str
    uses: str
    image: str

    class Config:
        schema_extra = {
            "example": {
                "id": "5f9f1b9b9b9b9b9b9b9b9b9b",
                "no": 1,
                "name": "Aloe Vera",
                "science_name": "Aloe barbadensis",
                "description": "Aloe vera is a succulent plant species of the genus Aloe. An evergreen perennial, it originates from the Arabian Peninsula, but grows wild in tropical, semi-tropical, and arid climates around the world. It is cultivated for agricultural and medicinal uses. The species is also used for decorative purposes and grows successfully indoors as a potted plant.",
                "plant_type": "Succulent",
                "lifespan": "5-10 years",
                "bloom_time": "Summer",
                "plant_height": "1-2 feet",
                "spread": "1-2 feet",
                "habitat": "Desert",
                "difficulty_rating": "Easy",
                "sunlight": "Full Sun",
                "hardiness": "Cold Hardy",
                "hardiness_zone": "10-11",
                "soil": "Well-drained",
                "water": "Medium",
                "fertilization": "Low",
                "planting_time": "Spring",
                "harvest_time": "Summer",
                "propagation": "Seeds",
                "pests": "Aphids, Mealybugs, Scale, Whiteflies",
                "diseases": "Bacterial Wilt, Crown Rot, Leaf Spot, Root Rot",
                "uses": "Medicinal, Ornamental",
                "image": "https://cdn.pixabay.com/photo/2017/01/31/19/13/aloe-vera-2026519_960_720.jpg"
            }
        }


class UpdatePlantModel(BaseModel):
    name: Optional[str]
    science_name: Optional[str]
    description: Optional[str]
    plant_type: Optional[str]
    lifespan: Optional[str]
    bloom_time: Optional[str]
    plant_height: Optional[str]
    spread: Optional[str]
    habitat: Optional[str]
    difficulty_rating: Optional[str]
    sunlight: Optional[str]
    hardiness: Optional[str]
    hardiness_zone: Optional[str]
    soil: Optional[str]
    water: Optional[str]
    fertilization: Optional[str]
    planting_time: Optional[str]
    harvest_time: Optional[str]
    propagation: Optional[str]
    pests: Optional[str]
    diseases: Optional[str]
    uses: Optional[str]
    image: Optional[str]

    class Config:
        schema_extra = {
            "example": {
                "name": "Aloe Vera",
                "science_name": "Aloe barbadensis",
                "description": "Aloe vera is a succulent plant species of the genus Aloe. An evergreen perennial, it originates from the Arabian Peninsula, but grows wild in tropical, semi-tropical, and arid climates around the world. It is cultivated for agricultural and medicinal uses. The species is also used for decorative purposes and grows successfully indoors as a potted plant.",
                "plant_type": "Succulent",
                "lifespan": "5-10 years",
                "bloom_time": "Summer",
                "plant_height": "1-2 feet",
                "spread": "1-2 feet",
                "habitat": "Desert",
                "difficulty_rating": "Easy",
                "sunlight": "Full Sun",
                "hardiness": "Cold Hardy",
                "hardiness_zone": "10-11",
                "soil": "Well-drained",
                "water": "Medium",
            }
        }


def ResponseModel(data, message):
    return {
        "data": [data],
        "code": 200,
        "message": message,
    }


def ErrorResponseModel(error, code, message):
    return {"error": error, "code": code, "message": message}
