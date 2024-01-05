const Utilisateur = require('../models/utilisateurModel')
const db = require('../database/database')
const bcrypt = require('bcrypt');
const jwt = require('jsonwebtoken')
require('dotenv').config();

// (POST)
// http://localhost:8000/utilisateur/add
// {
//     "nom": "waroquet",
//     "prenom":"quentin",
//     "email": "test@user.gmail",
//     "mdp": "test",
//     "role":1
// }
exports.AddUtilisateur = async(req,res)=>{
    const {nom, prenom, email, mdp, role} = req.body;
    const hashMDP = await bcrypt.hash(mdp, 10);

    await Utilisateur.create({
        nom: nom,
        prenom: prenom,
        email: email,
        mdp: hashMDP,
        role: role
    });
    const token = jwt.sign({email}, process.env.SECRET_KEY, {expiresIn: '1h'});
    res.json({token});
}

// (GET)
// http://localhost:8000/utilisateur/getall
exports.AllUtilisateur= async(req, res)=>{
    const utilisateur = await Utilisateur.findAll()
    res.status(200).json(utilisateur)
}

// (GET)
// http://localhost:8000/utilisateur/getone/:id
exports.OneUtilisateur= async(req, res)=>{
    const utilisateur = await Utilisateur.findByPk(parseInt(req.params.id))
    res.status(200).json(utilisateur)
}

// (POST)
// http://localhost:8000/utilisateur/register
// {
//     "nom": "test",
//     "prenom": "test",
//     "email": "test@user.gmail",
//     "mdp": "test"
// }
exports.register = async (req, res) => {
    const {nom, prenom, email, mdp} = req.body;
    try {
        const existingUser = await Utilisateur.findOne({
            where: {
                email: email
            }
        });

        if (existingUser) {
            return res.status(401).json({error: "utilisateur déja existant"});
        }

        const hashMDP = await bcrypt.hash(mdp, 10);

        await Utilisateur.create({
            nom: nom,
            prenom: prenom,
            email: email,
            mdp: hashMDP,
        });

        const token = jwt.sign({email}, process.env.SECRET_KEY, {expiresIn: '1h'});
        res.json({token});
    } catch (error) {
        console.error(error);
        res.status(500).json({error: "Erreur lors de la requête"});
    }
}
// (POST)
// http://localhost:8000/utilisateur/login
// {
//     "email": "test@user.gmail",
//     "mdp": "test"
// }
exports.login = async (req, res) => {
    const { email, mdp } = req.body;
    try {
        const utilisateur = await Utilisateur.findOne({
            where: {
                email: email
            }
        });

        if (!utilisateur) {
            return res.status(401).json({ error: "utilisateur non existant" });
        }

        const samePwd = await bcrypt.compare(mdp, utilisateur.mdp);

        if (!samePwd) {
            return res.status(401).json({ error: "mdp incorrect" });
        }

        const token = jwt.sign({ email }, process.env.SECRET_KEY, { expiresIn: '1h' });
        res.json({ token });
    } catch (error) {
        console.error(error);
        res.status(500).json({ error: "Erreur lors de la requête" });
    }
}
