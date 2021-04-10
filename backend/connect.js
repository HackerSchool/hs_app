
module.exports = {
    client: 'mysql2',
    connection: {
        host: process.env.DB_HOST || '127.0.0.1',
        port:process.env.DB_PORT,
        user:process.env.DB_USERNAME || 'root',
        database:process.env.DB_NAME || '',
    },
};
