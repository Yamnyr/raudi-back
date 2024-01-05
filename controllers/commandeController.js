const Commande = require('../models/commandeModel')

exports.AddCommande = async(req,res)=>{
    let commande = req.body
    let result = await Commande.create(commande)
    res.status(201).json(result.id)
}

exports.AllCommande= async(req, res)=>{
    const commande = await Commande.findAll()
    res.status(200).json(commande)
}

exports.OneModele= async(req, res)=>{
    const commande = await Commande.findByPk(parseInt(req.params.id))
    res.status(200).json(commande)
}
