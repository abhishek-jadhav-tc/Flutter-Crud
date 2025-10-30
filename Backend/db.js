
const mongoose = require('mongoose');
const MONGO_URL = 'mongodb+srv://thecontrast:thecontrast123@akash-cluster.hefai.mongodb.net/dummy?retryWrites=true&w=majority';

const connectDB = async () => {
  try {
    await mongoose.connect(MONGO_URL);
    console.log('✅ MongoDB connected');
  } catch (error) {
    console.error('MongoDB connection error:', error);
    process.exit(1); 
  }
};

const userSchema = new mongoose.Schema({
  name: String,
  email: String,
  age: Number,
});

const User = mongoose.model('User', userSchema);
module.exports = { connectDB, User };
