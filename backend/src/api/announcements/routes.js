
const controller = require('./controller');
const models = require('./models');

module.exports = {
    findAll: async (req, res) => {

        res.json(await controller.findAll(req.db));

    },

    findOne: async (req, res) => {

        let id;
        try {
          id = await models.announcementId.validateAsync(req.params.id);
        } catch (e) {
          return res.sendStatus(400);
        }

        const announcement = await controller.findOne(req.db, id);

        if (!announcement) return res.sendStatus(404);
        res.json(announcement);
    },

    create: async (req, res) => {
        let data;
        try {
          data = await models.announcementCreate.validateAsync(req.body, { stripUnknown: true });
        } catch (e) {
          return res.sendStatus(400);
        }

        const announcement = await controller.create(req.db, data);

        if (!announcement) return res.sendStatus(400); // Duplicate user
        res.json(announcement);
    },


    update: async (req, res) => {
        //apenas a própria pessoa deve poder alterar o seu perfil de membro (ou admin)

        let id, data;
        try {
        [id, data] = await Promise.all([
            models.announcementId.validateAsync(req.params.id),
            models.announcementUpdate.validateAsync(req.body, { stripUnknown: true }),
        ]);
        } catch (e) {
        return res.sendStatus(400);
        }

        const announcement = await controller.update(req.db, id, data);

        if (!announcement) return res.sendStatus(404);
        res.json(announcement);
    },


    remove: async (req, res) => {
        //apenas admins devem poder remover perfis de membro

        let id;
        try {
        id = await models.announcementId.validateAsync(req.params.id);
        } catch (e) {
        return res.sendStatus(400);
        }

        const success = await controller.remove(req.db, id);
        if (!success) return res.sendStatus(success === null ? 403 : 404);
        res.sendStatus(204);
    },
};
