var express = require('express');
var app = express();
var Web3 = require("web3");

let web3 = new Web3('http://localhost:8545');

app.get('/healthz', function (req, res) {
    web3.eth.isSyncing().then((syncStatus) => {
        if(!syncStatus) {
            res.send('OK')
        } else {
            currentBlock = syncStatus['currentBlock']
            highestBlock = syncStatus['highestBlock']
            res.status(500).send('Node not in sync.  Current block: ' + currentBlock + ', Highest block: ' + highestBlock);
        }
    }).catch((err) => {
        res.status(500).send('Error fetching sync status: ' + err);
    })
})

var server = app.listen(8081, function () {
   var host = server.address().address
   var port = server.address().port
   console.log("Healthcheck server listening at http://%s:%s", host, port)
})