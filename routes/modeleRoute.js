const express = require('express')
const route = express.Router()
const modeleController = require('../controllers/modeleController')

route.post('/add', modeleController.AddModele)
route.get('/getall', modeleController.AllModele)
route.get('/getone/:id', modeleController.OneModele)
route.get('/getoption/:id', modeleController.OptionForModele)

module.exports = route