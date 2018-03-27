module.exports = {
  env: 'docker',
  session_secret: process.env.SESSION_SECRET,
  apm: {
    serviceName: 'node-chatbot',
    serverUrl: process.env.APM_SERVER
  }
};
