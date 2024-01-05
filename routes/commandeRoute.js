const express = require('express')
const route = express.Router()
const commandeController = require('../controllers/commandeController')
const middleware = require("../middleware/middleware");

route.post('/add',middleware.authenticator, commandeController.AddCommande)
route.get('/getall',middleware.isAdmin || middleware.iscomptables, commandeController.AllCommande)
route.get('/getone/:id',middleware.isAdmin || middleware.iscomptables, commandeController.OneCommande)

module.exports = route