const Joi = require('joi');

const skillId = Joi.number().integer().positive();

const skillCreate = Joi.object({
  m_id: Joi.string()
    .max(10)
    .regex(/^ist\d+$/)
    .required(),
  skill: Joi.string().max(20).required(),
})
  .required();

const  skillUpdate = Joi.object({
  m_id: Joi.string()
    .max(10)
    .regex(/^ist\d+$/)
    .required(),
  skill: Joi.string().max(20).required(),
})
  .required()
  .min(1); // require at least one object

module.exports = {
  skillId,
  skillCreate,
  skillUpdate,
};

(member_id varchar(10) not null,
skill varchar(20) not null,
constraint pk_skill primary key(member_id, skill),
constraint fk_skill_member foreign key(member_id) references member_(member_id));
