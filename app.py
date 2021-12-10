from flask import Flask

app = Flask(__name__)


@app.route("/alive")
def alive():
    return "<p>Help, I'm alive, my heart keeps beating like a hammer.</p>"
