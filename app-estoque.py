# 📚 Importa as bibliotecas necessárias
import json       # Manipulação de dados em formato JSON
import sqlite3    # Conexão e operações com banco de dados SQLite
import os         # Verificação e remoção de arquivos

# 🧱 Define a classe Produto com atributos e métodos
class Produto:
    def __init__(self, id, nome, categoria, quantidade, preco, fornecedor):
        self.id = id
        self.nome = nome
        self.categoria = categoria
        self.quantidade = quantidade
        self.preco = preco
        self.fornecedor = fornecedor

    def to_dict(self):
        return {
            "id": self.id,
            "nome": self.nome,
            "categoria": self.categoria,
            "quantidade": self.quantidade,
            "preco": self.preco,
            "fornecedor": self.fornecedor
        }

    def __str__(self):
        return (f"{self.id} - {self.nome} ({self.categoria}) | "
                f"Qtd: {self.quantidade} | R${self.preco:.2f} | "
                f"Fornecedor: {self.fornecedor}")

# 🛒 Lista inicial de produtos
produtos = [
    Produto(1, "Caneta Azul", "Papelaria", 100, 2.50, "OfficeMax"),
    Produto(2, "Caderno", "Papelaria", 50, 15.90, "Faber"),
    Produto(3, "Borracha", "Papelaria", 200, 1.20, "Mercur")
]

# ➕ Novos produtos com .append()
produtos.append(Produto(4, "Mouse Gamer", "Informática", 30, 120.00, "Logitech"))
produtos.append(Produto(5, "Mochila", "Acessórios", 20, 89.90, "Dell"))

# 📌 Função para listar produtos acima de R$10
def listar_produtos_acima_de_10():
    print("\n💰 Produtos com preço acima de R$10:")
    for p in produtos:
        if p.preco > 10:
            print(p)

# 📌 Função para alterar o preço de um produto existente
def alterar_preco(nome, novo_preco):
    for p in produtos:
        if p.nome == nome:
            p.preco = novo_preco
            return f"✅ Preço do produto '{nome}' atualizado para R${novo_preco:.2f}"
    return f"❌ Produto '{nome}' não encontrado."

# 🧬 Serializa os produtos para JSON e exibe no terminal
json_produtos = json.dumps([p.to_dict() for p in produtos], indent=4)
print("📦 Produtos em JSON:")
print(json_produtos)

# 🗑️ Remove o banco de dados anterior, se existir
if os.path.exists("produtos.db"):
    os.remove("produtos.db")

# 🔌 Conecta ao banco de dados SQLite
conn = sqlite3.connect("produtos.db")
cursor = conn.cursor()

# 🧱 Cria a tabela 'produtos'
cursor.execute("""
CREATE TABLE IF NOT EXISTS produtos (
    id INTEGER PRIMARY KEY,
    nome TEXT,
    categoria TEXT,
    quantidade INTEGER,
    preco REAL,
    fornecedor TEXT
)
""")

# 📥 Insere os produtos no banco
for p in produtos:
    cursor.execute("""
        INSERT OR REPLACE INTO produtos 
        (id, nome, categoria, quantidade, preco, fornecedor)
        VALUES (?, ?, ?, ?, ?, ?)
    """, (p.id, p.nome, p.categoria, p.quantidade, p.preco, p.fornecedor))

conn.commit()

# 🔍 Consulta os produtos do banco
print("\n📊 Produtos no banco de dados:")
cursor.execute("SELECT * FROM produtos")
for row in cursor.fetchall():
    produto = Produto(*row)
    print(produto)

conn.close()

# 📌 Testes das novas funções
listar_produtos_acima_de_10()
print(alterar_preco("Caneta Azul", 3.00))

listar_produtos_acima_de_10()
