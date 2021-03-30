const {findMemberSkills, findSkilled, create, update, remove} = require('./routes');
// const { asyncHandler } = require('../../middleware/error');

module.exports = {
    // Add routes to express app
    init: (app) => {
        app.get('/skills/:id', asyncHandler(findMemberSkills));
        app.get('/skills/:skill', asyncHandler(findSkilled));
        app.post('/skills', asyncHandler(create));
        app.post('/skills/:id', asyncHandler(update));
        app.delete('/skills/:skill/:id', asyncHandler(remove));
    },
};
