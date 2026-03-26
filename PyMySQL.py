from mysql.connector import connect, Error
from datetime import datetime

conexao = connect(
    host="localhost",
    user="root",
    password="root",
    database="monitoramento_DB"
)
print("Conectado ao banco!")
cursor = conexao.cursor()

while True:
    print('=== SISTEMA INDUSTRIAL ===')
    print('0 - Sair')
    print('1 - Cadastrar Máquina')
    print('2 - Cadastrar Sensor')
    print('3 - Cadastrar Operador')
    print('4 - Listar Máquinas')
    print('5 - Listar Sensores')
    print('6 - Listar Leituras')        
    print('7 - Analise de Qualidade')

    opcao = input('Escolha: ')

    if   opcao == '0':
        print('Saido do programa...')
        break
    elif opcao == '1':
        nome = input("Nome da máquina: ")
        status = input('Qual é o status da Máquina:')

        try:
            data_input = input("Digite a data de instalação (YYYY-MM-DD): ")
            data_instalacao = datetime.strptime(data_input, "%Y-%m-%d").date()

            sql = "INSERT INTO maquina (nome_maquina, status, data_instalacao) VALUES (%s, %s, %s)"
            cursor.execute(sql, (nome, status, data_instalacao))
            conexao.commit()

            print("Máquina cadastrada!")

        except Error as e:
            print(e)
    elif opcao == '2':
        id_maquina = int(input('Digite o ID da Máquina: '))
        tipo_sensor = input('Qual é o tipo do Sensor: ')
        unidade_medida = input('Unidade de Medida: ')

        try:
            sql = "INSERT INTO sensores (id_maquina, tipo_sensor, unidade_medida) VALUES (%s, %s, %s)"
            cursor.execute(sql, (id_maquina, tipo_sensor, unidade_medida))
            conexao.commit()

            print("Sensor cadastrado")

        except Error as e:
            print(e)
    elif opcao == '3':
        nome_operador = (input('Nome do Operador: '))
        turno = input('Qual é o Turno: ')
        setor = input('Qual é o setor: ')

        try:
            sql2 = "INSERT INTO operadores (nome_operador, turno, setor) VALUES (%s, %s, %s)"
            cursor.execute(sql2, (nome_operador, turno, setor))
            conexao.commit()

            print("Operador Cadastrado")

        except Error as e:
            print(e)
    elif opcao == '4':
        cursor.execute('SELECT * FROM maquina')
        
        for linha in cursor.fetchall():
            print(linha)
    elif opcao == '5':
        cursor.execute('SELECT * FROM sensores')
        
        for linha in cursor.fetchall():
            print(linha)
    elif opcao == '6':
        cursor.execute('SELECT * FROM leituras')
        
        for linha in cursor.fetchall():
            print(linha)
    elif opcao == '7':
        print('NORMAL')
        cursor.execute('SELECT * FROM leituras WHERE valor <= 70')
        for linha in cursor.fetchall():
            print(linha)
        print()

        print('ALERTA')
        cursor.execute('SELECT * FROM leituras WHERE valor > 70 AND valor < 90')
        for linha in cursor.fetchall():
            print(linha)
        print()

        print('CRITICO')
        cursor.execute('SELECT * FROM leituras WHERE valor > 90')
        for linha in cursor.fetchall():
            print(linha)
        print()
