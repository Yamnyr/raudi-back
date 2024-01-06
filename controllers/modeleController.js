const Modele = require('../models/modeleModel');
const Option = require('../models/optionModel');
const db = require('../database/database');

// (POST)
// http://localhost:8000/modele/add
// {
//     "nom": "voituremobile",
//     "prix": 20000,
//     "nbr_porte": 5,
//     "moteur": "essence",
//     "taille": "2cm",
//     "nbr_place": 5,
//     "img":"./img/RaudiR1.jpg",
//     "liste_options": ["1", "2"]
// }

exports.AddModele = async (req, res) => {
    try {
        const modeleData = req.body;

        // Create the Modele
        const createdModele = await Modele.create(modeleData);

        // Associate the Modele with Options
        const { liste_options } = req.body;
        if (liste_options && Array.isArray(liste_options) && liste_options.length > 0) {
            // Check if the Options exist
            const existingOptions = await Option.findAll({
                where: {
                    id: liste_options
                }
            });

            // Associate the Modele with existing Options, avoiding duplicates
            await Promise.all(existingOptions.map(async (option) => {
                const hasAssociation = await createdModele.hasOption(option);
                if (!hasAssociation) {
                    await createdModele.addOption(option);
                }
            }));
        }

        res.status(201).json(createdModele.id);
    } catch (error) {
        console.error(error);
        res.status(500).json({ error: "Erreur lors de la requête" });
    }
};



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
    let options = await modele.getOptions()
    res.status(200).json(options)
}

// (GET)
// http://localhost:8000/modele/getimage/:id
exports.ImgForModele= async(req, res)=>{
    const modele = await Modele.findByPk(parseInt(req.params.id))
    let img = await modele.img
    res.status(200).json(img)
}