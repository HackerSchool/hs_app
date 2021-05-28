const Joi = require('joi');

const projectName = Joi.number().string();
const status = Joi.number().integer().positive();

const projectCreate = Joi.object({
  p_name: Joi.string()
    .max(50)
    .required(),
  p_description: Joi.string().max(200).required(),
  p_status: Joi.int().required(),
})
  .required();

const projectUpdate = Joi.object({
  p_name: Joi.string()
    .max(50)
    .required(),
  p_description: Joi.string().max(200).required(),
  p_status: Joi.int().required(),
})
  .required()
  .min(1); // require at least one object

module.exports = {
  projectName,
  status,
  projectCreate,
  projectUpdate,
};
