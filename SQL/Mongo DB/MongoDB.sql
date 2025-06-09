/*
    Free Course -- https://www.youtube.com/watch?v=c2M-rlkkT5o
    @MathLopes29
    @HashtagTreinamentos / @Unifisa
*/

show dbs;
use {name_table};
show {name_table};

use school;
show collections;
db.createCollection("students");
db.dropDatabase("school");

-- insert one value
db.students.insertOne({name: "Math", age: 29, city: "São Paulo"});

-- find
db.students.find();
db.students.find({name: "Math"});
db.students.find({name: "Math", age: 29});

-- insertMany
db.students.insertMany([
    {name: "Math", age: 29, city: "São Paulo"},
    {name: "Carlos", age: 30, city: "São Paulo"},
    {name: "Lucas", age: 25, city: "São Paulo"}
]);

-- data types
db.students.insertMany([
    {name: "Math", age: 29, city: "São Paulo", gpa: 9.5, married: false, birthDate: new Date("1994-01-01")},
    {name: "Carlos", age: 30, city: "São Paulo", gpa: 8.7, married: true, birthDate: new Date("1993-05-15")},
    {name: "Lucas", age: 25, city: "São Paulo", gpa: 7.8, married: false, birthDate: new Date("1998-07-20")}
]);

db.students.insertOne({
    name: "Math",
    age: 29,
    city: "São Paulo",
    gpa: 9.5,
    married: false,
    birthDate: new Date("1994-01-01"),
    -- array
    subjects: ["Math", "Physics", "Chemistry"],
    address: {
        street: "123 Main St",
        city: "São Paulo",
        zipCode: "12345-678"
    },
    fulltime: true,
    registrationDate: new Date("2023-10-01T10:00:00Z") -- new Date("YYYY-MM-DDTHH:mm:ssZ"),
    gradutionDate: null,
    -- nested object
    courses:[
        {courseName: "Math 101", credits: 3},
        {courseName: "Physics 101", credits: 4}
    ]
})

/* Aba sort e limit do mongo db */
db.students.find.short({name: 1}); -- sort by name ascending
db.students.find.short({name: -1}); -- sort by name descending
db.students.find.short({gpa: -1}); -- sort by age ascending 

db.students.find.limit(2); -- limit the result to 2 documents
db.students.find.skip(1); -- skip the first document


db.students.find.short({gpa: -1}).limit(2).skip(1); -- sort by gpa descending, limit to 2 documents, skip the first document
db.students.find.short({gpa: -1}).limit(1)
db.students.find.short({gpa: 1}).limit(1)

/* Método Find */
db.students.find({
    name: "Math",
    gpa: 4.0,
    fulltime: true,
})

db.students.find(
    {}, -- empty filter to find all documents
    {id: false, name: true, gpa: true, fulltime: true} -- projection to select specific fields
); -- select specific fields

db.students.find({
    $or: [
        {name: "Math"},
        {gpa: 4.0},
        {fulltime: true}
    ]
})

/* Update */
db.students.updateOne(
    {name: "Math"}, -- filter
    {$set: {_id: ObjectId(""), age: 30, city: "Rio de Janeiro", fulltime:false}} -- update operation
);

db.students.updateOne({
    _id: ObjectId(""), -- filter by _id
    }, 
    {$unset: fulltime:false } -- remove fields
);

db.students.updateMany(
    {}, -- filter
    {$set: {fulltime:false}} -- update operation
);

db.students.updateOne(
    {name:"Gary"},
    {$unset: {fulltime: ""}} -- remove field fulltime
)

db.students.updateMany({fulltime:{$exists: false}}, -- filter to find documents with fulltime field
    {$set: {fulltime: True}} -- field fulltime
);


/* Delete */
db.students.deleteOne({name: "Math"}); -- delete one document
db.students.deleteMany({age: {$lt: 30}}); -- delete many documents with age less than 30

db.students.deleteMany({fulltime:false}); -- delete all documents in the collection
df.students.deleteMany({registrationDate:{$exists:false}}); -- delete all documents where registrationDate does not exist
db.students.drop(); -- drop the collection


/* Comparations */
db.students.find({age: {$ne : 30}}); -- find documents where age is not equal to 30
db.students.find({age: {$gt : 30}}); -- find documents where age is greater than 30
db.students.find({age: {$gte : 30}}); -- find documents where age is greater than or equal to 30
db.students.find({age: {$lt : 30}}); -- find documents where age is less than 30
db.students.find({age: {$lte : 30}}); -- find documents where age is less than or equal to 30
db.students.find({age: {$gte : 30, $lte : 40}}); -- find documents where age is between 30 and 40

db.students.find({gpa: {$in: [9.5, 8.7]}}); -- find documents where gpa is in the array [9.5, 8.7]
df.students.find({gpa: {$nin: [9.5, 8.7]}}); -- find documents where gpa is not in the array [9.5, 8.7]
db.students.find({name: {$regex: /^M/}}); -- find documents where name starts with "M"

/* Logical Operations */
db.students.find({
    $and: [
        {age: {$gte: 30}},
        {city: "São Paulo"}
    ]
}); -- find documents where age is greater than or equal to 30 and city is São Paulo

df.studentsfind(
    {fulltime:true},
    {age: {$lte: 30}, city: "São Paulo"} -- find documents where age is greater than or equal to 30 and city is São Paulo
)

db.students.find({
    $or: [
        {age: {$gte: 30}},
        {city: "São Paulo"}
    ]
}); -- find documents where age is greater than or equal to 30 or city is São Paulo

db.students.find({
    $nor: [
        {age: {$gte: 30}},
        {city: "São Paulo"}
    ]
}); -- find documents where age is not greater than or equal to 30 and city is not São Paulo

db.students.find({
    age: {$not:{$gte: 30}} -- find documents where age is not greater than or equal to 30
}); 


/* Indexes - For a lot of searching and not doing a lot of updating */
db.students.find({name: "Math"}).explain("executionStats"); -- explain the query execution plan
db.starts.find({name: "Math"}).explain("executionStats"); -- explain the query execution stats

db.students.createIndex({name: 1}); -- create an index on the name field
db.students.createIndex({age: -1}); -- create an index on the age field in descending order
db.students.getIndexes(); -- get all indexes in the collection
db.students.dropIndex("name_1"); -- drop the index on the name fieldj


/* 
    Colletions -> Group of documents 
    Database -> Group of collections
*/

show collections; -- show all collections in the current database
db.students.countDocuments(); -- count the number of documents in the collection
df.students.createCollection("students"); -- create a new collection
df.students.renameCollection("students_new"); -- rename the collection
db.students.find().forEach(function(doc) {printjson(doc)}); -- print each document in the collection
db.students.drop(); -- drop the collection
db.students.estimatedDocumentCount(); -- estimate the number of documents in the collection
db.students.stats(); -- get statistics about the collection

db.createCollection("Teachers", {capped: true, size: 100000, max: 100}, {autoIndexId: True}); -- create a capped collection with a maximum size of 100000 bytes and a maximum of 100 documents
show collections; -- show all collections in the current database