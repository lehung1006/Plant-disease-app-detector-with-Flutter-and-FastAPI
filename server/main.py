import uvicorn
from config import settings
if __name__ == "__main__":
    uvicorn.run("app:app", host=settings.Host, port=settings.Port,  reload=True,
                ssl_keyfile="./SSL/localhost+2-key.pem", 
                ssl_certfile="./SSL/localhost+2.pem")
