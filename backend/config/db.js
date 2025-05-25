import mongoose from 'mongoose';
import { config } from 'dotenv';

config();

const connectDB = async () => {
  try {
    console.log('Connecting to MongoDB at:', process.env.MONGODB_URI);
    
    await mongoose.connect(process.env.MONGODB_URI, {
      family: 4, // Force IPv4
      directConnection: true,
      serverSelectionTimeoutMS: 5000
    });
    
    console.log('✅ MongoDB Connected Successfully');
    console.log(`Database: ${mongoose.connection.db.databaseName}`);
    console.log(`MongoDB Host: ${mongoose.connection.host}`);
  } catch (error) {
    console.error('❌ MongoDB Connection Failed:', error.message);
    console.log('\n👉 Immediate Action Items:');
    console.log('1. Run this in CMD to verify MongoDB: mongosh "mongodb://127.0.0.1:27017"');
    console.log('2. Check MongoDB service: sc query MongoDB');
    console.log('3. Temporary fix: net start MongoDB');
    process.exit(1);
  }
};

export default connectDB;