const {findAll, findOne, create, update, remove} = require('./routes');
// const { asyncHandler } = require('../../middleware/error');
// permissoes

module.exports = {
    // Add routes to express app
    init: (app) => {
        app.get('/announcement', asyncHandler(findAll));
        app.get('/announcement/:id', asyncHandler(findOne));
        app.post('/announcement', asyncHandler(create));
        app.post('/announcement/:id', asyncHandler(update));
        app.delete('/announcement/:id', asyncHandler(remove));
    },
};
