import app from './app.js';
import connectDB from './config/db.js';

const PORT = process.env.PORT || 5000;
const LOCAL_IP = '192.168.190.18';

// Connect to MongoDB
connectDB();

app.listen(PORT, LOCAL_IP, () => {
  console.log(`Server running in ${process.env.NODE_ENV} mode`);
  console.log(`Access locally: http://localhost:${PORT}`);
  console.log(`Access on network: http://${LOCAL_IP}:${PORT}`);
});