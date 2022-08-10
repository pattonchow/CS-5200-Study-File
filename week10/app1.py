#!/usr/bin/env python
# -*- coding: utf-8 -*-


# %% Simple selector (MySQL database)
# import pymysql for a simple interface to a MySQL DB

import pymysql


try:
    cnx = pymysql.connect(host='localhost', user='root',
                          password='root1234',
                      db='lotrfinal', charset='utf8mb4',
                          cursorclass=pymysql.cursors.DictCursor)

except pymysql.err.OperationalError:
    print('Error: %d: %s' % (e.args[0], e.args[1]))

try:
    cur = cnx.cursor()
    stmt_select = "select * from lotr_character order by character_name"

    cur.execute(stmt_select)

    rows = cur.fetchall()

    for row in rows:
        print(row) # prints each field as a key value pair
        print(row["character_name"], row['species'])
        #reference field by name
        c_name_var = row["character_name"]
        # get specific values
    cur.close()



    species = 'elf'
    cursor = cnx.cursor()
    query = "SELECT character_name FROM lotr_character WHERE species=%s"
    cursor.execute(query, species)
    print("The query returned {} rows".format(cursor.rowcount))


     # ... retrieve data ...

    for row in cursor.fetchall():
        print(row)
    cursor.close()

    val = ''
    c3 = cnx.cursor()
    c3.callproc("track_character1_wrap",('Frodo',val))


    for row in c3.fetchall():
        print(row)

    while c3.nextset():
        for row in c3.fetchall():
            print(row)
    c3.close()

except pymysql.Error as e:
    print('Error: %d: %s' % (e.args[0], e.args[1]))

finally:
    cnx.close()


