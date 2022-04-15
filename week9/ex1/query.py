import psycopg2
from geopy import Nominatim
cur = psycopg2.connect(database="dvdrental", user="MaximLatypov",
                       password="password", host="127.0.0.1", port="5432").cursor()

print("Database opened successfully")

geolocator = Nominatim(user_agent="test")
cur.callproc('get_addres_by_id', ('%11%', 400, 600))
rows = cur.fetchall()
for row in rows:
    print(f"Address: '{row[0]:>26}' ", end="")
    location = geolocator.geocode(row[0], timeout=10)
    if location is None:
        print(f"lat: '{0}', long: '{0}'")
        continue
    else:
        print(f"lat: '{location.latitude:3.2f}', long: '{location.longitude:3.2f}'")
cur.close()

print("Operation completed successfully")
