# lab 12 - Neo4J, Databases 2022

## MMA table

```sql
Create
(p1:Fighter  {name: 'Khabib Nurmagomedov', weight:'155'},
(p2:Fighter  {name: 'Rafael Dos Anjos', weight:'155'}),
(p3:Fighter  {name: 'Neil Magny', weight:'170'}),
(p4:Fighter  {name: 'Jon Jones', weight:'205'}),
(p5:Fighter  {name: 'Daniel Cormier', weight:'205'}),
(p6:Fighter  {name: 'Michael Bisping', weight:'185'}),
(p7:Fighter  {name: 'Matt Hamill', weight:'185'}),
(p8:Fighter  {name: 'Brandon Vera', weight:'205'}),
(p9:Fighter  {name: 'Frank Mir', weight:'230'}),
(p10:Fighter {name: 'Brock Lesnar', weight:'230'}),
(p11:Fighter {name: 'Kelvin Gastelum', weight:'185'}),
(p1)-[:beats]->(p2),
(p2)-[:beats]->(p3),
(p4)-[:beats]->(p5),
(p6)-[:beats]->(p7),
(p4)-[:beats]->(p8),
(p8)-[:beats]->(p9),
(p9)-[:beats]->(p10),
(p3)-[:beats]->(p11),
(p11)-[:beats]->(p6),
(p6)-[:beats]->(p7),
(p6)-[:beats]->(p11),
(p7)-[:beats]->(p4)
```

![all_fighters](./.img/graph.png "all_fighters")

## Querys

### Q1

> Return all middle/Walteqr/light weight fighters (155,170,185) who at least have one win.

```sql
match (p:Fighter)-[:beats]->(:Fighter) where p.weight = '155' return p
UNION
match (p:Fighter)-[:beats]->(:Fighter) where p.weight = '170' return p
UNION
match (p:Fighter)-[:beats]->(:Fighter) where p.weight = '185' return p
```

![q1](./.img/graph1.png)

### Q2

> Return fighters who had 1-1 record with each other. Use Count from the
aggregation functions.

```sql
match (p:Fighter)-[b1:beats]->(pp)-[b2:beats]->(p)
with p,count(b1) as b1_cnt, count(b2) as b2_cnt
where b1_cnt=1 and b2_cnt=1 return p
```

![q2](./.img/graph2.png)

### Q3

> Return all fighter that can “Khabib Nurmagomedov” beat them and he
didn’t have a fight with them yet.

```sql
match (p:Fighter{name:'Khabib Nurmagomedov'})-[:beats*]->(pp:Fighter) 
where pp <> p 
and not EXISTS {
  MATCH (p)-[:beats]->(pp)
}
return pp
```

![q3](./.img/graph3.png)

### Q4

> Return undefeated Fighters(0 loss), defeated fighter (0 wins).

```sql
-- (no wins).
match (p:Fighter)
where not EXISTS {
  match (p)-[:beats]->(:Fighter)
}
return p
```

![q4_1](./.img/graph4_1.png)

```sql
-- (no loss).
match (p:Fighter)
where not EXISTS {
  match (p)<-[:beats]-(:Fighter)
}
return p
```

![q4_2](./.img/graph4_2.png)

### Q5

> Return all fighters MMA records and create query to enter the record as a
property for a fighter {name, weight, record}.

```sql
match (p:Fighter)
set p.win = 0
set p.lose = 0;

match (p:Fighter)-[b:beats]->(:Fighter)
with p, count(b) as b_cnt
set p.win = b_cnt;

match (p:Fighter)<-[b:beats]-(:Fighter)
with p, count(b) as b_cnt
set p.lose = b_cnt;

match (p:Fighter)
RETURN p.name, p.win, p.lose 
```

![q5](./.img/graph5.png)
