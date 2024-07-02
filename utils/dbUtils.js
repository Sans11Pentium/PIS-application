const userConnection = require('../routes/userDbConnect.js');

const queryAsync = (query, params) => {
    return new Promise((resolve, reject) => {
        userConnection.query(query, params, (error, results) => {
            if (error) {
                return reject(error);
            }
            resolve(results);
        });
    });
};

module.exports = {
    queryAsync
};
