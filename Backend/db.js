// db.js
const mongoose = require('mongoose');

// MongoDB Atlas connection URL
const MONGO_URL = 'mongodb+srv://thecontrast:thecontrast123@akash-cluster.hefai.mongodb.net/dummy?retryWrites=true&w=majority';

// Function to connect to MongoDB
const connectDB = async () => {
  try {
    await mongoose.connect(MONGO_URL);
    console.log('✅ MongoDB connected');
  } catch (error) {
    console.error('❌ MongoDB connection error:', error);
    process.exit(1); // Stop server if DB fails
  }
};

// Example Schema and Model
const userSchema = new mongoose.Schema({
  name: String,
  email: String,
  age: Number,
});

const User = mongoose.model('User', userSchema);

// Export everything
module.exports = { connectDB, User };
