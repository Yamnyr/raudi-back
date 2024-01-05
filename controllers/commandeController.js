const Commande = require('../models/commandeModel')


// (POST)
// http://localhost:8000/commande/new
exports.AddCommande = async(req,res)=>{
    let commande = req.body
    let result = await Commande.create(commande)
    res.status(201).json(result.id)
}


// (GET)
// http://localhost:8000/commande/historique
exports.AllCommande= async(req, res)=>{
    const commande = await Commande.findAll()
    res.status(200).json(commande)
}


// (GET)
// http://localhost:8000/commande/historique/:id
exports.OneCommande= async(req, res)=>{
    const commande = await Commande.findByPk(parseInt(req.params.id))
    res.status(200).json(commande)
}
