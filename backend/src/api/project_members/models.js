const Joi = require('joi');

const projectName = Joi.number().string();
const memberId = Joi.number().integer().positive();

const projectMemberCreate = Joi.object({
  p_name: Joi.string()
    .max(50)
    .required(),
  member_id: Joi.string()
    .max(10)
    .regex(/^ist\d+$/)
    .required(),
})
  .required();

const projectMemberUpdate = Joi.object({
  p_name: Joi.string()
    .max(50)
    .required(),
  member_id: Joi.string()
    .max(10)
    .regex(/^ist\d+$/)
    .required(),
})
  .required()
  .min(1); // require at least one object

module.exports = {
  projectName,
  memberId,
  projectMemberCreate,
  projectMemberUpdate,
};
