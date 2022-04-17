import psycopg2
from geopy import Nominatim
con = psycopg2.connect(database="dvdrental", user="vorart",
                       password="password", host="127.0.0.1", port="5432")
cur = con.cursor()
print("Database opened successfully")

geolocator = Nominatim(user_agent="test")
cur.callproc('get_addres_by_id', ('%11%', 400, 600))
rows = cur.fetchall()

addresses = []
longitudes = []
latitudes = []

for row in rows:
    print(f"Address: '{row[0]:>26}' ", end="")
    location = geolocator.geocode(row[0], timeout=10)
    addresses.append(row[0])
    if location is None:
        print(f"lat: '{0}', long: '{0}'")
        longitudes.append("0")
        latitudes.append("0")
        continue
    print(f"lat: '{location.latitude:3.2f}', long: '{location.longitude:3.2f}'")
    longitudes.append(location.longitude)
    latitudes.append(location.latitude)

cur.execute('''
    ALTER TABLE address
    DROP COLUMN IF EXISTS longitude,
    DROP COLUMN IF EXISTS latitude;

    ALTER TABLE address
    ADD COLUMN longitude real,
    ADD COLUMN latitude real;
''')

cur.close()
con.commit()

cur = con.cursor()
for i in range(len(addresses)):
    s = f'''
        UPDATE address
        SET longitude = {longitudes[i]}, latitude = {latitudes[i]}
        WHERE address = '{addresses[i]}';
    '''
    print(s)
    cur.execute(s)
con.commit()

print("Operation completed successfully")