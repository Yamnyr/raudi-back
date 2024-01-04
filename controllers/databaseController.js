const sequelize = require('../database/database')
const Commande = require('../models/commandeModel')
const Modele = require('../models/modeleModel')
const Option = require('../models/optionModel')
const utilisateur = require('../models/utilisateurModel')

exports.createAllTable = async(req, res)=>{
    await sequelize.sync()
    res.status(200).json('toutes les tables sont créer')
}

exports.createTableModele = async(req, res)=>{
    await Modele.sync()
    res.status(200).json('table modele créer')
}

exports.createTableOption = async(req, res)=>{
    await Option.sync()
    res.status(200).json('table option créer')
}
