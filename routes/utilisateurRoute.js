const express = require('express')
const route = express.Router()
const utilisateurController = require('../controllers/utilisateurController')
const middleware = require("../middleware/middleware");

route.post('/add',middleware.isAdmin, utilisateurController.AddUtilisateur)
route.get('/getall',middleware.isAdmin, utilisateurController.AllUtilisateur)
route.get('/getone/:id',middleware.isAdminOrComptable, utilisateurController.OneUtilisateur)


route.post('/login/', utilisateurController.login)
route.post('/register/', utilisateurController.register)

module.exports = route