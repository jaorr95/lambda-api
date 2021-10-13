from flask import request, jsonify
from app_factory import create_app
from core_db import db
from models import Client
import logging


app = create_app()


#Index
@app.route("/")
def index():
    return "This is the app index"

#Add client and money
@app.route("/add", methods=["POST"])
def add_client():
    data = request.json
    name=data.get('name')
    money=data.get('money')
    try:
        client=Client(
            name=name,
            money=money
        )
        db.session.add(client)
        db.session.commit()
        return "Client added with id={}".format(client.id)
    except Exception as e:
        logging.error("Unexpected error: " + str(e))
        return(str(e))

#Get all clients
@app.route("/getall")
def get_all():
    try:
        clients=Client.query.all()
        return  jsonify([e.serialize() for e in clients])
    except Exception as e:
        logging.error("Unexpected error: " + str(e))
        return(str(e))

#Get client by ID
@app.route("/get/<id_>")
def get_by_id(id_):
    try:
        client=Client.query.filter_by(id=id_).first()
        return jsonify(client.serialize())
    except Exception as e:
        logging.error("Unexpected error: " + str(e))
        return(str(e))

#Get client by Name
@app.route("/getn/<name_>")
def get_by_name(name_):
    try:
        client=Client.query.filter_by(name=name_).first()
        return jsonify(client.serialize())
    except Exception as e:
        logging.error("Unexpected error: " + str(e))
        return(str(e))

if __name__ == '__main__':
    app.run(host="0.0.0.0", use_reloader=False)
