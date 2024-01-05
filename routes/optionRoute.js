const express = require('express')
const route = express.Router()
const optionController = require('../controllers/optionController')
const middleware = require("../middleware/middleware");

route.post('/add',middleware.isAdmin, optionController.AddOption)
route.get('/getall', optionController.AllOption)
route.get('/getone/:id', optionController.OneOption)

module.exports = route