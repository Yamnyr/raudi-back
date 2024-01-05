const express = require('express')
const route = express.Router()
const commandeController = require('../controllers/commandeController')

route.post('/new', commandeController.AddCommande)
route.get('/historique', commandeController.AllCommande)
route.get('/historique/:id', commandeController.AllCommande)

module.exports = route