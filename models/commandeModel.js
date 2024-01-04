const sequelize = require('../database/database');
const { DataTypes } = require('sequelize');
const Utilisateur = require('./utilisateurModel')
const Modele = require('./modeleModel')

const Commande = sequelize.define('commande', {
    id: {
        type: DataTypes.UUID,
        defaultValue: DataTypes.UUIDV4,
        primaryKey: true,
        allowNull: false,
    },
    montant_total: {
        type: DataTypes.INTEGER,
        unique: false,
        allowNull: true
    },
    liste_options: {
        type: DataTypes.JSON,
        unique: false,
        allowNull: true
    }
}, {
    sequelize,
    freezeTableName: true
});

// RELATION ICI:
Commande.belongsTo(Utilisateur, { foreignKey: 'id_utilisateur' }); // Utilisateur a la clé étrangère 'id_utilisateur'
Utilisateur.hasMany(Commande, { foreignKey: 'id_utilisateur' }); // Une commande appartient à un utilisateur

Commande.belongsTo(Modele, { foreignKey: 'id_modele' }); // Modele a la clé étrangère 'id_modele'
Modele.hasMany(Commande, { foreignKey: 'id_modele' }); // Une commande appartient à un modèle

module.exports = Commande;
