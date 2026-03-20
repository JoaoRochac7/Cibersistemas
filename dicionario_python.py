dic_produtos = {'Airpod': '2000','Ipad': '5000','Iphone': '10000', 'Macbook': '12000'}

# Mostra o Dicionário
print(dic_produtos)

# Pega um elemento
print(dic_produtos['Airpod'])

# Edita um elemento
dic_produtos['Airpod'] = float(dic_produtos['Airpod']) * 1.3
print(dic_produtos['Airpod'])

# Quantidade de itens
print(len(dic_produtos))

# Retirar um item do Dicionário
'''dic_produtos.pop('Airpod')
print(dic_produtos)'''

# Adicionar itens
dic_produtos.update({
    'Samsung': 3500,
    'Notebook': 3000
})
print(dic_produtos)

# Adicionar um item
dic_produtos['Televisao'] = 4000
print(type(dic_produtos['Televisao']))

