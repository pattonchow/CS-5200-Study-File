import pymysql

def main():

    user_name = input("Enter the user name: ")
    user_password = input("Enter the password: ")

    # user_name = "root"
    # user_password = "20101001aA!"

    if user_name == "root" and user_password == "20101001aA!":
        db = pymysql.connect(host='localhost',
                             user=user_name,
                             password=user_password,
                             db='lotrfinal_1',
                             charset='utf8mb4',
                             cursorclass=pymysql.cursors.DictCursor)

    cur = db.cursor()
    stmt_select = "select character_name from lotr_character "
    cur.execute(stmt_select)
    characters = cur.fetchall()
    # print(characters)

    status = "not found"
    while status == "not found":
        character_name = input("Enter the character name: ")
        for item in characters:
            if character_name in item.values():
                status = "found"
                break
        if status == "not found":
            print("Character not found, enter another name!")

    stmt_select = "CALL track_character('" + character_name + "')"
    cur.execute(stmt_select)
    output = cur.fetchall()
    print(output)

    cur.close()



if __name__ == '__main__':
    main()


