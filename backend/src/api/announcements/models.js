const Joi = require('joi');

const announcementId = Joi.number().integer().positive();

const announcementCreate = Joi.object({
  a_id: Joi.string()
    .max(10)
    .regex(/^ist\d+$/)
    .required(),
  a_title: Joi.string().max(20).required(),
  a_date: Joi.date(), //existe?
  a_description: Joi.string().max(500).required(),
  a_links: Joi.string().max(500).required(),
  a_del_date: Joi.date(), //existe?
  a_weekly: Joi.string().max(1).regex(/^ist\d+$/).equal(0, 1).default(0), // ??
})
  .required();

const  announcementUpdate = Joi.object({
  a_id: Joi.string()
    .max(10)
    .regex(/^ist\d+$/)
    .required(),
  a_title: Joi.string().max(20).required(),
  a_date: Joi.date(), //existe?
  a_description: Joi.string().max(500).required(),
  a_links: Joi.string().max(500).required(),
  a_del_date: Joi.date(), //existe?
  a_weekly: Joi.string().max(1).regex(/^ist\d+$/).equal(0, 1).default(0), // ??
})
  .required()
  .min(1); // require at least one object

module.exports = {
  announcementId,
  announcementCreate,
  announcementUpdate,
};
