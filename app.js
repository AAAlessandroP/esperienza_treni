const express = require("express");
const app = express();
console.log("* app in funzione *");

var bodyParser = require("body-parser");
app.use(express.static("mia_pag"));
var mysql = require('mysql');
// require('dotenv').config()
app.use(bodyParser.urlencoded({ extended: false }));
app.use(bodyParser.json());

const listener = app.listen(process.env.PORT || 3000, function () {
    console.log("* Your app is listening on port " + listener.address().port);
})


var con = mysql.createConnection({
    host: "mysqlz",// nome servizio
    user: "root",
    password: "my-secret-pw",
    database: "miodb"
});

con.connect(function (err) {
    if (err) throw err;

    app.post("/new", async (req, res) => {

        var Giornata = await new Promise((resolve, reject) => {
            con.query(s = `INSERT INTO Giornate (data, Puntualita, Controllore) VALUES ("${req.body.data}", ${req.body.puntualita}, ${req.body.controllo == "on"})`
                , function (err, result, fields) {
                    if (err) throw err;
                    resolve(result.insertId)
                });
        });

        for (let i = 0; i < req.body.mezzi.length; i++) {
            console.log("ITERAZIONE");
            if (req.body.mezzi instanceof Array) //se l'user selezione 1 solo tipo di materiale rotabile nella drop-down list, questa non sarà inviara come array ma come stringa singola
                element = req.body.mezzi[i];
            else
                element = req.body.mezzi

            switch (element) {
                case "Vivalto":
                    idMateriale = 1
                    break;
                case "PR":
                    idMateriale = 2
                    break;
                case "MD":
                    idMateriale = 3
                    break;
                case "Caravaggio":
                    idMateriale = 4
                    break;
                case "Casaralta":
                    idMateriale = 5
                    break;
                case "TAF":
                    idMateriale = 6
                    break;
                default: throw new Error()
                    break;
            }

            con.query(s = `INSERT INTO TreniToGiornate (Giornata, Materiale) VALUES (${Giornata}, ${idMateriale}); `
                , function (err, result, fields) {
                    if (err) throw err;
                });
            // console.log(`s`, s);
        };
        res.sendStatus(200)
    });

    app.get("/all", async (req, res) => {

        con.query(s = `SELECT * FROM Giornate JOIN TreniToGiornate WHERE Giornate.ID=TreniToGiornate.Giornata `
            , function (err, result, fields) {
                if (err) throw err;
                var mappa = {}
                result.forEach(element => {
                    if (mappa[element.data] === undefined) {
                        mappa[element.data] = { Materiali: [element.Materiale], Puntualita: element.Puntualita, data: element.data, Controllore: element.Controllore }
                    } else {
                        mappa[element.data].Materiali.push(element.Materiale)
                    }
                });
                res.json(mappa)
            });

    });

    app.get("/allPuntualita", async (req, res) => {

        con.query(s = `SELECT Puntualita FROM Giornate;`
            , function (err, result, fields) {
                if (err) throw err;
                res.json(result)
            });
    });


});
