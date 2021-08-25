from flask import Blueprint, jsonify, request
from .models import selectLogin, selectCadastro
from datetime import datetime, timedelta

# Criando Blueprint
rotasR = Blueprint('rotasR', __name__)

#====================== Login ======================
@rotasR.route('/login', methods=['POST'])
def login():
    email = request.json['email_l']
    senha = request.json['password_l']
    resposta = selectLogin(email, senha)
    if resposta != None:
        data = datetime.strptime(str(resposta[5]), '%Y-%m-%d').date()
        dataFormatada = data.strftime('%d-%m-%Y')

        return jsonify(
            id=resposta[0],
            nome=resposta[1],
            sobrenome=resposta[2],
            email=resposta[3],
            data=dataFormatada
        ), 200  # Sucesso, login VÁLIDO

    else:
        return jsonify(msg='Email ou senha nao existentes !'), 203  # Sucesso, porém login INVÁLIDO

#====================== Cadastro ======================
@rotasR.route('/cadastro', methods=['POST'])
def cadastro():
    nome = request.json['name_c']
    sobrenome = request.json['surname_c']
    email = request.json['email_c']
    senha = request.json['password_c']
    data = f'{datetime.now().date().year}-{datetime.now().date().month}-{datetime.now().date().day}'
    resposta = selectCadastro(nome, sobrenome, email, senha, data)

    if resposta == 'Cadastrado com Sucesso !':
        return jsonify(msg='Cadastro concluido com sucesso!'), 201 # Created, cadatro criado com sucesso
    if resposta == 'Email já em uso !':
        return jsonify(msg='Email ja utilizado.'), 200 # Sucesso a fazer requisição, porém email já usado
    else:
        return jsonify(msg='Erro ao concluir o cadastro.'), 502 # Erro no servidor ao concluir cadastro.