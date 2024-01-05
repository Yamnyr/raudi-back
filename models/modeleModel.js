const sequelize = require('../database/database');
const { DataTypes} = require('sequelize');
const Option = require('./optionModel');

const Modele = sequelize.define('modele', {
    id: {
        type: DataTypes.UUID,
        defaultValue: DataTypes.UUIDV4,
        primaryKey: true,
        allowNull: false,
    },
    nom: {
        type: DataTypes.STRING,
        unique: false,
        allowNull: false
    },
    prix: {
        type: DataTypes.INTEGER,
        allowNull: false
    },
    nbr_porte: {
        type: DataTypes.INTEGER,
        allowNull: false
    },
    moteur: {
        type: DataTypes.STRING,
        allowNull: false
    },
    taille: {
        type: DataTypes.INTEGER,
        allowNull: false
    },
    nbr_place: {
        type: DataTypes.INTEGER,
        allowNull: false
    },

}, {
    sequelize,
    freezeTableName: true
});

//RELATION ICI:
Modele.belongsToMany(Option, {through: "option_model"})
Option.belongsToMany(Modele, {through: "option_model"})

module.exports = Modele;
