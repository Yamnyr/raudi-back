const Modele = require('../models/modeleModel')

exports.AddModele = async(req,res)=>{
    let modele = req.body
    let result = await Modele.create(modele)
    res.status(201).json(result.id)
}

exports.AllModele= async(req, res)=>{
    const modele = await Modele.findAll()
    res.status(200).json(modele)
}

exports.OneModele= async(req, res)=>{
    const modele = await Modele.findByPk(parseInt(req.params.id))
    res.status(200).json(modele)
}

exports.OptionForModele= async(req, res)=>{
    const modele = await Modele.findByPk(parseInt(req.params.id))
    let options = await modele.options
    res.status(200).json(options)
}