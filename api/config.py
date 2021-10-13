import os
basedir = os.path.abspath(os.path.dirname(__file__))

class Config(object):
    DEBUG = False
    TESTING = False
    CSRF_ENABLED = True
    #Database URL
    SQLALCHEMY_DATABASE_URI = "postgresql+pg8000://" + os.environ['DATABASE_URI']
    MIGRATE_DATABASE=False
    CREATE_DATABASE=False


class DevelopmentConfig(Config):
    DEVELOPMENT = True
    DEBUG = True
    MIGRATE_TABLES=True
    CREATE_DATABASE=True

