
import mysql.connector

try:
    # Establish database connection
    con = mysql.connector.connect(
        host="localhost",
        user="root",
        password="your_password",
        database="college"
    )

    print("Connected Successfully!")

    # Create cursor
    cur = con.cursor()

    # Execute SQL query
    cur.execute("SELECT * FROM Product")

    # Display records
    print("ID\tProduct Name\tPrice")

    for row in cur.fetchall():
        print(row[0], "\t", row[1], "\t", row[2])

    # Close connection
    cur.close()
    con.close()

except mysql.connector.Error as e:
    print("Error:", e)
