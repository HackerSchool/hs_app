
const controller = require('./controller');
const models = require('./models');

module.exports = {
    findAll: async (req, res) => {

        res.json(await controller.findAll(req.db));

    },

    findOne: async (req, res) => {

        let p_name;
        try {
          p_name = await models.projectName.validateAsync(req.params.id);
        } catch (e) {
          return res.sendStatus(400);
        }

        const p_name = await controller.findOne(req.db, p_name);

        if (!p_name) return res.sendStatus(404);
        res.json(p_name);
    },

    findAllStatus: async (req, res) => {

        let status;
        try {
          status = await models.status.validateAsync(req.params.id);
        } catch (e) {
          return res.sendStatus(400);
        }

        res.json(await controller.findAllStatus(req.db, status)) ; // deve ser uma lista de p_names e nao apenas 1

    },

    create: async (req, res) => {
        let data;
        try {
          data = await models.projectCreate.validateAsync(req.body, { stripUnknown: true });
        } catch (e) {
          return res.sendStatus(400);
        }

        const proj = await controller.create(req.db, data);

        if (!proj) return res.sendStatus(400); // Duplicate user
        res.json(proj);
    },


    update: async (req, res) => {
        //apenas a própria pessoa deve poder alterar o seu perfil de membro (ou admin)

        let name, data;
        try {
        [name, data] = await Promise.all([
            models.projectName.validateAsync(req.params.name),
            models.projectUpdate.validateAsync(req.body, { stripUnknown: true }),
        ]);
        } catch (e) {
        return res.sendStatus(400);
        }

        const proj = await controller.update(req.db, name, data);

        if (!proj) return res.sendStatus(404);
        res.json(proj);
    },

};
