const Modele = require('../models/modeleModel')

// (POST)
// http://localhost:8000/modele/add
// {
//     "nom": "voituremobile",
//     "prix":"20000",
//     "nbr_porte": "5",
//     "moteur": "essence",
//     "taille":"2cm",
//     "nbr_place":5
// }
exports.AddModele = async(req,res)=>{
    let modele = req.body
    let result = await Modele.create(modele)
    res.status(201).json(result.id)
}

// (GET)
// http://localhost:8000/modele/getall
exports.AllModele= async(req, res)=>{
    const modele = await Modele.findAll()
    res.status(200).json(modele)
}

// (GET)
// http://localhost:8000/modele/getone/:id
exports.OneModele= async(req, res)=>{
    const modele = await Modele.findByPk(parseInt(req.params.id))
    res.status(200).json(modele)
}

// (GET)
// http://localhost:8000/modele/getoption/:id
exports.OptionForModele= async(req, res)=>{
    const modele = await Modele.findByPk(parseInt(req.params.id))
    let options = await modele.options
    res.status(200).json(options)
}