
const controller = require('./controller');
const models = require('./models');

module.exports = {
    findAll: async (req, res) => {

        res.json(await controller.findAll(req.db));

    },

    findAllProj: async (req, res) => {

        let id;
        try {
          id = await models.memberId.validateAsync(req.params.id);
        } catch (e) {
          return res.sendStatus(400);
        }

        res.json(await controller.findAllProj(req.db, id));

    },

    findAllMembers: async (req, res) => {

        let p_name;
        try {
          p_name = await models.projectName.validateAsync(req.params.id);
        } catch (e) {
          return res.sendStatus(400);
        }

        res.json(await controller.findAllMembers(req.db, p_name));

    },

    create: async (req, res) => {
        let data;
        try {
          data = await models.projectMemberCreate.validateAsync(req.body, { stripUnknown: true });
        } catch (e) {
          return res.sendStatus(400);
        }

        const proj_member = await controller.create(req.db, data);

        if (!proj_member) return res.sendStatus(400); // Duplicate user
        res.json(proj_member);
    },


    remove: async (req, res) => {
        //apenas admins devem poder remover perfis de membro

        let id, p_name;
        try {
        id = await models.memberId.validateAsync(req.params.id);
        p_name = await models.projectName.validateAsync(req.params.name);
        } catch (e) {
        return res.sendStatus(400);
        }

        const success = await controller.remove(req.db, id, p_name);
        if (!success) return res.sendStatus(success === null ? 403 : 404);
        res.sendStatus(204);
    },
};
