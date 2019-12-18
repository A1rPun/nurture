# Mongo DB

Mongo shell
```
$ mongo
```

List all DB's
```
> show dbs
```

Change to db
```
> use {database}
```

Show all collectins
```
> show collections
```

Prettify output
```
> db.myCollection.find().pretty()
> db.getCollection('myCollection').find().pretty()
```

Find
```
.find({ id: 42 }) // id is 42
.find({ id: { $gt: 42 } }) // id greater than 42
```

Other useful methods:

- `.sort({ name: 1 })` // 1 ASC, -1 DESC
- `.skip(5)`
- `.limit(10)`
