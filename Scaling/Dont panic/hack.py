from CS50 import SQL

db = SQL("sqlite://dont-panic.db")
password = input("Enter password:")
db.execute(
    """
    UPDATE "users"
    SET password = 'hacked'
    WHERE 'username' = 'admin';
    """
)

db.execute(
    """
    UPDATE 'users'
    SET password = ?
    WHERE 'username' = 'admin';
    """,
    password
)