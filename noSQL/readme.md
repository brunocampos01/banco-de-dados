# Comands MongoDB

Download: https://www.mongodb.com/download-center/community

Doc: https://docs.mongodb.com/manual/

---

### Start MongoDB
`sudo service mongod start`

### Begin using MongoDB
`mongo`

---

### Create database
`use NAME-DB`

### View db actual
`db`

### Shows all dbs
`show dbs`

---

### SELECT *
`NAME-DB.insert()`

### Create Collection
`db.createCollection(“nome coleção”)`

### Insert datas
`db.NomeColeção.insert(documento JSON)`<br/>
`db.NomeColeção.insertOne(documento JSON)`

### Count datas
`db.NomeColeção.count()`
