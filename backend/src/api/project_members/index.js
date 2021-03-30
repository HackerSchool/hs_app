const {findAll, findAllProj, findAllMembers, create, remove} = require('./routes');
// const { asyncHandler } = require('../../middleware/error');

module.exports = {
    // Add routes to express app
    init: (app) => {
        app.get('/project_members', asyncHandler(findAll));
        app.get('/project_member/:id', asyncHandler(findAllProj));
        app.get('/project_member/:p_name', asyncHandler(findAllMembers));
        app.post('/project_member', asyncHandler(create));
        app.delete('/project_member/:id/:p_name', asyncHandler(remove));
    },
};
