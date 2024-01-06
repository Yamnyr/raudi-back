const Option = require('../models/optionModel')


// (POST)
// http://localhost:8000/option/add
// {
//     "nom": "clim",
//     "prix": "100"
// }
exports.AddOption = async(req,res)=>{
    let option = req.body
    let result = await Option.create(option)
    res.status(201).json(result.id)
}

// (GET)
// http://localhost:8000/option/
exports.AllOption= async(req, res)=>{
    const option = await Option.findAll()
    res.status(200).json(option)
}


// (GET)
// http://localhost:8000/option/:id
exports.OneOption= async(req, res)=>{
    const option = await Option.findByPk(parseInt(req.params.id))
    res.status(200).json(option)
}
