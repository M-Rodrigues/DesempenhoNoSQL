const cred = require('./../credentials')
const block_size = 250

const { Client } = require('@elastic/elasticsearch')
const client = new Client({ node: cred.ES_HOST })
const fs = require('fs')

const files = [
    "customers1.json",
    "customers2.json",
    "customers3.json",
    "customers10.json",
]

const load_files = (id, files) => {
    id--
    if (id < files.length) {
        console.log(`Importando arquivo ${files[id]} (${new Date().toUTCString()})`)
        fs.readFile(
            "./../2_Tratamento/2_Consolidado/" + files[id]
            , 'utf8'
            , (err, data) => {
                if (err) {
                    console.log("Erro na abertura do arquivo")
                    console.log(err)
                } else {
                    insert_data_elastic(data)
                }
            })
    }
}

const insert_data_elastic = (data) => {
    data = JSON.parse(data)
    insert_sync(0, block_size, data)
}

const insert_sync = (start, n, data) => {
    if (start < data.length) {
        console.log(`Inserindo os customers: [${start},${start+n-1}]`)

        let part = build_bulk_body(data.slice(start,start+n))

        client.bulk({ 
            body: part 
        }, (err, res) => {
            console.log(err)
            if (res.errors) {
                console.log("Erro na inserção desse bloco...")
            } else {
                console.log(`Sucesso (${(start+n)/data.length*100}%)`)
                insert_sync(start+n, n, data)
            }
        })
    }
}

const build_bulk_body = (data) => {
    let body = []
    data.forEach(element => {
        let id = parseInt(element.c_name.substring(9,18))
    
        // action description
        body.push({ index:  { _index: 'i_customer', _id: id } })
        // the document
        body.push(element)
    });

    return body
}

// Para cada arquivo, o script foi rodado indicando o número do arquivo
load_files(1, files);