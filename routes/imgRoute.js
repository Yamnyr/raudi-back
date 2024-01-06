const express = require('express')
const route = express.Router()
const imgController = require('../controllers/imgController')
const middleware = require("../middleware/middleware");

route.get('/:id', imgController.OneImg)

module.exports = route