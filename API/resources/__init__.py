from flask import Flask

def criarAPI():
    # Inicializando Flask
    app = Flask(__name__)
    app.config['SECRET_KEY'] = 'GW47api'

    # Registrando Blueprint
    from .rotasR import rotasR
    app.register_blueprint(rotasR, url_prefix='/react')

    return app