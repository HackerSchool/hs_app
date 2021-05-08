const Joi = require('joi');

const memberId = Joi.number().integer().positive();

const memberCreate = Joi.object({
  m_id: Joi.string()
    .max(10)
    .regex(/^ist\d+$/)
    .required(),
  m_name: Joi.string().max(50).required(),
  m_email: Joi.string().max(50).required(),
  m_tlm: Joi.string().max(25).required(),
  m_degree: Joi.string().max(50).required(),
  m_year: Joi.int().required(),
  m_admin: Joi.string().equal('admin', 'user').default('user'),
})
  .required();

const memberUpdate = Joi.object({
  m_id: Joi.string()
    .max(10)
    .regex(/^ist\d+$/)
    .required(),
  m_name: Joi.string().max(50).required(),
  m_email: Joi.string().max(50).required(),
  m_tlm: Joi.string().max(25).required(),
  m_degree: Joi.string().max(50).required(),
  m_year: Joi.int().required(),
  m_admin: Joi.string().equal('admin', 'user').default('user'),
})
  .required()
  .min(1); // require at least one object

module.exports = {
  memberId,
  memberCreate,
  memberUpdate,
};
