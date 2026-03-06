from fastapi import FastAPI
import uvicorn

app = FastAPI()


@app.get("/echo")
def echo(message: str):
    return {"message": message}


if __name__ == "__main__":
    uvicorn.run("global_supervisor:app", host="0.0.0.0", port=8000, reload=True)
