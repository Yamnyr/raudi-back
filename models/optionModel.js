const sequelize = require('../database/database');
const { DataTypes} = require('sequelize');

const Option = sequelize.define('option', {
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
        unique: false,
        allowNull: true
    },
}, {
    sequelize,
    freezeTableName: true
});

//RELATION ICI:

module.exports = Option;
