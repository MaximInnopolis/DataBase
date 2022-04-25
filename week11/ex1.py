from cgi import print_environ
from select import select
from psycopg2 import cursor
from pymongo import MongoClient
client = MongoClient('localhost', 27017)
db = client['lab11']

#ex1

cursor1 = db.lab11.find().distinct("cuisine")
for e in cursor1: print(e)

#ex4
cursor4 = db.lab11.find({ "cuisine": {"$in": ["Indian", "Thai"]} })

# select * from restaurants where cuisine in ("Indian", "Thai")

