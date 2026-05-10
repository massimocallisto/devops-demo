from flask import Flask
import os

app = Flask(__name__)



@app.route("/")
def hello():

   return "Hello World!"

@app.get("/envs")
def envs():
    """
    Restituisce tutte le variabili d'ambiente del sistema.
    """
    # os.environ è un oggetto mappabile che contiene le variabili d'ambiente
    return dict(os.environ)


if __name__ == "__main__":
   app.run(host="0.0.0.0", port=8000)
