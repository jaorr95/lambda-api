from flask_migrate import Migrate, migrate, upgrade, stamp
from sqlalchemy_utils import create_database, database_exists
#from flask import current_app as app
#from core_db import db
from models import *


class Migrations(object):    

    @staticmethod
    def _migrate_tables(app, db):
        
        
        # Migrate(app, db)
        # stamp()
        # migrate()
        # upgrade()
        db.create_all()

    @staticmethod
    def _create_db(url):
        if not database_exists(url):
            create_database(url)

    @staticmethod
    def migration(app, db):
        
        if app.config["CREATE_DATABASE"]:
            Migrations._create_db(app.config["SQLALCHEMY_DATABASE_URI"])
            Migrations._migrate_tables(app, db)
        elif app.config["MIGRATE_TABLES"]:
            Migrations._migrate_tables(app, db)
            

        