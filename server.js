const express = require('express')
const cors = require ('cors')

const databaseRoute = require('./routes/databaseRoute')
const modeleRoute = require('./routes/modeleRoute')
const utilisateurRoute = require('./routes/utilisateurRoute')
const commandeRoute = require('./routes/utilisateurRoute')
const app = express()

app.use(express.json())
app.use(cors())

app.use('/database', databaseRoute)
app.use('/modele', modeleRoute)
app.use('/utilisateur', utilisateurRoute)
app.use('/commande', commandeRoute)


app.listen(8000, ()=>{
    console.log("serveur lancé sur le port 8000");
})