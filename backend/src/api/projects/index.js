const {findAll, findOne, findAllStatus, create, update} = require('./routes');
// const { asyncHandler } = require('../../middleware/error');

module.exports = {
    // Add routes to express app
    init: (app) => {
        app.get('/projects', asyncHandler(findAll));
        app.get('/project/:name', asyncHandler(findOne));
        app.get('/projects/:active', asyncHandler(findAllStatus));
        app.post('/project', asyncHandler(create));
        app.post('/project/:name', asyncHandler(update));
    },
};
