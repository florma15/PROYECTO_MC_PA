


import mysql.connector

def connectionBD():
    try:
   
        connection = mysql.connector.connect(
            host="localhost",
            user="root",
            passwd="",  
            database="crud_python",
            charset='utf8mb4',
            collation='utf8mb4_unicode_ci',
            raise_on_warnings=True
        )
        if connection.is_connected():
            print("Conexión exitosa a la base de datos")
            return connection

    except mysql.connector.Error as error:
        print(f"No se pudo conectar: {error}")
        return None


connection = connectionBD()
if connection:
    connection.close() 
