import mysql.connector


# =================== CONECTANDO BD ===================
def conectandoBD():
    global BD
    global cursor
    try:
        BD = mysql.connector.connect(
            user='tccGreenWallet@tcc-greenwallet',
            host='tcc-greenwallet.mysql.database.azure.com',
            password='?tcc@123-shark',
            port=3306,
            database='greenwallet'
        )
        cursor = BD.cursor()
        print('Conectado com Sucesso !')

        return ''

    except mysql.connector.Error as err:
        print(err.msg)
        return 1

# =================== LOGIN ===================
def selectLogin(email, senha):
    resposta = conectandoBD()
    if resposta == '':
        cursor.execute(f"SELECT * FROM tab_usuarios WHERE email='{email}' AND senha=SHA1('{senha}')")
        respBanco = cursor.fetchone()
        BD.close()
        if respBanco != None:
            return respBanco
        else:
            return None
    else:
        return 'Erro ao conectar com o banco de dados'


# =================== CADASTRO ===================
def selectCadastro(nome, sobrenome, email, senha, data):
    resposta = conectandoBD()
    if resposta == '':
        cursor.execute(f"SELECT COUNT(email) FROM tab_usuarios WHERE email='{email}'")
        respBD = cursor.fetchone()
        if respBD[0] == 1:
            BD.close()
            return 'Email já em uso !'
        else:
            cursor.execute(f"INSERT INTO tab_usuarios VALUES(0,'{nome}', '{sobrenome}', '{email}', SHA1('{senha}'), '{data}')")
            BD.commit()
            respBD = selectLogin(email, senha)
            BD.close()

            if respBD != None:
                return 'Cadastrado com Sucesso !'
            else:
                return 'Erro no cadastro !'