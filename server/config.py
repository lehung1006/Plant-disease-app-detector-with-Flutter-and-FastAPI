from pydantic import BaseSettings


class Settings(BaseSettings):
    DATABASE_URL: str
    MONGO_INITDB_DATABASE: str
    PLANTS_COLLECTION: str
    PESTS_COLLECTION: str
    LEAF_DISEASE_COLLECTION: str
    USER_COLLECTION: str
    PLANT_CLASSIFY_LABELS_PATH: str
    PLANT_CLASSIFY_MODEL_PATH: str
    LEAF_DISEASE_CLASSIFY_LABELS_PATH: str
    LEAF_DISEASE_CLASSIFY_MODEL_PATH: str
    YOLO_REPO_PATH: str
    YOLO_WEIGHTS_PATH: str
    ENCODER_PATH: str
    ENCODER_LABELS_PATH: str
    JWT_PUBLIC_KEY: str
    JWT_PRIVATE_KEY: str
    REFRESH_TOKEN_EXPIRES_IN: int
    ACCESS_TOKEN_EXPIRES_IN: int
    JWT_ALGORITHM: str
    Host: str
    Port: int

    class Config:
        env_file = './.env'


settings = Settings()
