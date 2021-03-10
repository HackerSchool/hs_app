const {findAll, findOne, create, update, remove} = require('./routes');


module.exports = {

    init: (app) => {
        app.get('/members', asyncHandler(findAll));
        app.get('/member/:id', asyncHandler(findOne));
        app.post('/member', asyncHandler(create));
        app.post('/member/:id', asyncHandler(update));
        app.delete('/member/:id', asyncHandler(remove));
    },
};
