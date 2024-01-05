const jwt = require('jsonwebtoken')
const db = require("../database/database");
require('dotenv').config()

exports.authenticator = (req, res, next)=>{
    const token = req.params.token ? req.params.token : req.headers.authorization
    console.log(token)
    if (token && process.env.SECRET_KEY){
        jwt.verify(token, process.env.SECRET_KEY, (err, decoded) =>{
            if(err){
                res.status(401).json({erreur: "accès refusé"})
            }
            else{
                console.log(decoded);
                next()
            }
        })
    }   else{
        res.status(401).json({erreur: "accès refusé"})
    }
}

exports.isAdmin = (req, res, next) => {
    const token = req.params.token ? req.params.token : req.headers.authorization;
    console.log(token)
    if (token && process.env.SECRET_KEY) {
        jwt.verify(token, process.env.SECRET_KEY, async (err, decoded) => {
            if (err) {
                res.status(401).json({ erreur: "accès refusé" });
            } else {
                console.log(decoded);

                const result = await db.query('SELECT role FROM utilisateur WHERE email = ?', [decoded.email]);

                if (result.length === 1 && result[0].role === 1) {
                    next();
                } else {
                    res.status(403).json({ erreur: "accès denied" });
                }
            }
        });
    } else {
        res.status(401).json({ erreur: "accès refusé" });
    }
};


exports.iscomptables = (req, res, next)=>{
    const token = req.params.token ? req.params.token : req.headers.authorization;
    console.log(token)
    if (token && process.env.SECRET_KEY){
        jwt.verify(token, process.env.SECRET_KEY, async (err, decoded) =>{
            if(err){
                res.status(401).json({erreur: "accès refusé"})
            }
            else{
                console.log(decoded);
                const result = await db.query('SELECT role FROM utilisateur WHERE email = ?', [decoded.email]);
                if (result.left === 1 && result[0].role === 2){
                    next()
                }
                else{
                    res.status(403).json({erreur: "accès denied"})
                }
            }
        })
    }   else{
        res.status(401).json({erreur: "accès refusé"})
    }
};