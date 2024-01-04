const sequelize = require('../database/database')
const Commande = require('../models/commandeModel')
const Modele = require('../models/modeleModel')
const option = require('../models/optionModel')
const utilisateur = require('../models/utilisateurModel')

exports.createAllTable = async(req, res)=>{
    await sequelize.sync()
    res.status(200).json('toutes les tables sont créer')
}

exports.createTableModele = async(req, res)=>{
    await Modele.sync()
    res.status(200).json('table produit créer')
}
