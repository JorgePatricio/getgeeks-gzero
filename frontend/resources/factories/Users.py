from faker import Faker 
fake = Faker()

import bcrypt

def get_hashed_pass(password):
    hashed = bcrypt.hashpw(password.encode('utf-8'), bcrypt.gensalt(8))
    return hashed

def usuarios_para_inserir_no_banco():
    return [
        factory_usuario('login'),
        factory_usuario('geek'),
        factory_usuario('tentativa_ser_geek'),
        factory_usuario('procurar_alien'),
        factory_usuario('procurar_comum'),
        factory_usuario('searcher')
    ]

def factory_usuario(alvo):
    data = {
        'falso': {
            'nome': fake.first_name(),
            'sobrenome': fake.last_name(),
            'email': fake.free_email(),
            'password': 'pwd123'
        },
        'email_errado': {
            'nome': fake.first_name(),
            'sobrenome': fake.last_name(),
            'email': fake.first_name().lower() + '&gmail.com',
            'password': 'pwd123'
        },
        'login': {
            'nome': 'Jorge',
            'sobrenome': 'Patricio',
            'email': 'khennos@gmail.com',
            'password': 'pwd123'
        },
        'geek': {
            'nome': 'Nicolas',
            'sobrenome': 'Patricio',
            'email': 'nicolas@gmail.com',
            'password': 'pwd123',
            'perfil_geek':{
                'zap': '71988887777',
                'desc': 'Opa digai! Vamos escrever para completar os 80 caracteres necessários para não bugar o teste. Acho que agora vai.',
                'reparo_imp':'Não',
                'trabalho': 'Remoto',
                'custo_hora': '150'
            }
        },
        'tentativa_ser_geek': {
            'nome': 'Dio',
            'sobrenome': 'Linux',
            'email': 'dio@gmail.com',
            'password': 'pwd123',
            'perfil_geek':{
                'zap': '71966668888',
                'desc': 'escrever um bocado de coisa para tentar chegar aos 255 caracteres. Tem que ter um pouco de paciencia para isso, ou até mesmo... aff esqueci a palavra, na hora que a gente mais precisa e acabamos esquecendo as coisas.',
                'reparo_imp':'Sim',
                'trabalho': 'Remoto',
                'custo_hora': '200'
            }
        },
        'searcher': {
            'nome': 'Johnny',
            'sobrenome': 'Lawrence',
            'email': 'jonny@cobrakai.com',
            'password': 'pwd123'
        },
        'procurar_alien': {
            'nome': 'Dok',
            'sobrenome': 'Ock',
            'email': 'dok@oscorp.com',
            'password': 'pwd123',
            'perfil_geek':{
                'whatsapp': '71999999123',
                'desc': 'Faço conserto de qualquer impressora. Matricial a fita, matricial a fita colorida, a laser, a jato de tinta e também impressora 3D.',
                'printer_repair': 'Sim',
                'work': 'Presencial',
                'cost': '250'
            }
        },
        'procurar_comum': {
            'nome': 'Peter',
            'sobrenome': 'Parker',
            'email': 'parker@oscorp.com',
            'password': 'pwd123',
            'perfil_geek':{
                'whatsapp': '71999991002',
                'desc': 'Faço instalação de distribuidores Linux no seu computador PC, X86 ou X64 com processadores Intel ou AMD.',
                'printer_repair': 'Não',
                'work': 'Remoto',
                'cost': '200'
            }
        }  
    }

    return data[alvo]