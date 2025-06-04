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
db.createCollection("studentes");
db.dropDatabase("school");

-- insert one value
db.studentes.insertOne({name: "Math", age: 29, city: "São Paulo"});

-- find
db.studentes.find();
db.studentes.find({name: "Math"});
db.studentes.find({name: "Math", age: 29});

-- insertMany
db.studentes.insertMany([
    {name: "Math", age: 29, city: "São Paulo"},
    {name: "Carlos", age: 30, city: "São Paulo"},
    {name: "Lucas", age: 25, city: "São Paulo"}
]);

-- data types
db.studentes.insertMany([
    {name: "Math", age: 29, city: "São Paulo", gpa: 9.5, married: false, birthDate: new Date("1994-01-01")},
    {name: "Carlos", age: 30, city: "São Paulo", gpa: 8.7, married: true, birthDate: new Date("1993-05-15")},
    {name: "Lucas", age: 25, city: "São Paulo", gpa: 7.8, married: false, birthDate: new Date("1998-07-20")}
]);