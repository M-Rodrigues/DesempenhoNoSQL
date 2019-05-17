const cred = require('./../credentials')
const MongoClient = require('mongodb').MongoClient
const assert = require('assert');

// Connection URL
const url = cred.MONGO_HOST + "/" + cred.MONGO_DB;

// Database Name
const dbName = cred.MONGO_DB;

// Create a new MongoClient
const client = new MongoClient(url, { useNewUrlParser: true });

// Use connect method to connect to the Server
client.connect()
    .then((res) => {
        console.log("Sucesss")
        console.log(res)
    })
    .catch((err) => {
        console.log("Erro na conexão")
        console.log(err)
    })

// (err) => {
//     if (!err) {
//       console.log("Connected successfully to server");
    
//       const db = client.db(dbName);  
//     }
//     client.close();
// });
