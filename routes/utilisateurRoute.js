const express = require('express')
const route = express.Router()
const utilisateurController = require('../controllers/utilisateurController')

route.post('/add', utilisateurController.AddUtilisateur)
route.get('/getall', utilisateurController.AllUtilisateur)
route.get('/getone/:id', utilisateurController.OneUtilisateur)


route.post('/login/', utilisateurController.login)
route.post('/register/', utilisateurController.register)

module.exports = route