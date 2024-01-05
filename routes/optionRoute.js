const express = require('express')
const route = express.Router()
const optionController = require('../controllers/optionController')

route.post('/add', optionController.AddOption)
route.get('/getall', optionController.AllOption)
route.get('/getone/:id', optionController.OneOption)

module.exports = route