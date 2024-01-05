const Commande = require('../models/commandeModel')


// (POST)
// http://localhost:8000/commande/add
// {
//     "montant_total": "2",
//     "liste_options": "test",
//     "id_utilisateur": "02f785fb-bc01-41c1-975f-b828da5e4f05",
//     "id_modele": "29c600cf-784b-424d-99d4-240a04e2ce97"
// }
exports.AddCommande = async(req,res)=>{
    let commande = req.body
    let result = await Commande.create(commande)
    res.status(201).json(result.id)
}

// (GET)
// http://localhost:8000/commande/getall
exports.AllCommande= async(req, res)=>{
    const commande = await Commande.findAll()
    res.status(200).json(commande)
}


// (GET)
// http://localhost:8000/commande/getone/:id
exports.OneCommande= async(req, res)=>{
    const commande = await Commande.findByPk(parseInt(req.params.id))
    res.status(200).json(commande)
}
