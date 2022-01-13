from faker import Faker 
fake = Faker()

import bcrypt

def get_hashed_pass(password):
    hashed = bcrypt.hashpw(password.encode('utf-8'), bcrypt.gensalt(8))
    return hashed
    
def factory_user():
    return {
        'nome': fake.first_name(),
        'sobrenome': fake.last_name(),
        'email': fake.free_email(),
        'password': 'pwd123'
    }
    
    return user

def factory_email_incorreto():
    return {
        'nome': fake.first_name(),
        'sobrenome': fake.last_name(),
        'email': fake.first_name().lower() + '&gmail.com',
        'password': 'pwd123'
    }

def factory_usuario_login():
    return {
        'nome': 'Jorge',
        'sobrenome': 'Patricio',
        'email': 'khennos@gmail.com',
        'password': 'pwd123'
    }
