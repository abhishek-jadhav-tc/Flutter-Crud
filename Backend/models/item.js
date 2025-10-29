const { DataTypes } = require('sequelize');
const { sequelize } = require('../db');

const Item = sequelize.define('Item', {
  title: {
    type: DataTypes.STRING,
    allowNull: false,
  },
  description: {
    type: DataTypes.TEXT,
  },
}, {
  tableName: 'items',
  timestamps: true,
});

module.exports = Item;
