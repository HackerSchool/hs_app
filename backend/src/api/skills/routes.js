
const controller = require('./controller');
const models = require('./models');

module.exports = {
    findMemberSkills: async (req, res) => {

      let id;
      try {
        id = await models.skillId.validateAsync(req.params.id);
      } catch (e) {
        return res.sendStatus(400);
      }

      const skill = await controller.findAll(req.db, id);

      if (!skill) return res.sendStatus(404);
      res.json(skill);

    },

    findSkilled: async (req, res) => {

        let skill;
        try {
          skill = await models.skillId.validateAsync(req.params.skill);
        } catch (e) {
          return res.sendStatus(400);
        }

        const member = await controller.findAll(req.db, skill);

        if (!member) return res.sendStatus(404);
        res.json(member);
    },

    create: async (req, res) => {
        let data;
        try {
          data = await models.skillCreate.validateAsync(req.body, { stripUnknown: true });
        } catch (e) {
          return res.sendStatus(400);
        }

        const skill = await controller.create(req.db, data);

        if (!skill) return res.sendStatus(400); // Duplicate user
        res.json(skill);
    },


    update: async (req, res) => {
        //apenas a própria pessoa deve poder alterar o seu perfil de membro (ou admin)

        let id, skill, data;
        try {
        [id, skill, data] = await Promise.all([
            models.skillId.validateAsync(req.params.id),
            //models.skillId.validateAsync(req.params.skill);
            models.skillUpdate.validateAsync(req.body, { stripUnknown: true }),
        ]);
        } catch (e) {
        return res.sendStatus(400);
        }

        const skill = await controller.update(req.db, id, data);

        if (!skill) return res.sendStatus(404);
        res.json(skill);
    },


    remove: async (req, res) => {
        //apenas admins devem poder remover perfis de membro

        let id, skill;
        try {
        id = await models.skillId.validateAsync(req.params.id);
        //skill = await models.skillId.validateAsync(req.params.skill);
        } catch (e) {
        return res.sendStatus(400);
        }

        const success = await controller.remove(req.db, id);
        if (!success) return res.sendStatus(success === null ? 403 : 404);
        res.sendStatus(204);
    },
};
