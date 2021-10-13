from flask import Flask
from core_db import db
import os
from migrations import Migrations


def create_app():
     """Application-factory pattern"""
     app = Flask(__name__)
     
     app.config.from_object(os.environ['APP_SETTINGS'])
     
     app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False
     
     
     db.init_app(app)

     with app.app_context():     
          Migrations.migration(app, db)
     
     return app