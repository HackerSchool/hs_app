const fields = ['member_id', 'skill'];


const formatResponse = (responde) => ({
    member_id: response.member_id,
    skill: response.skill,
});

module.exports = {
    async findMemberSkills(database, id) {
      const result = await database.select('member_id', 'skill')..where('member_id', id).from('member_skill')
      return result.map(formatResponse);
    },

    async findSkilled(database, skill) {
      const result = await database
      .select('member_id', 'skill')
      .where('skill', skill)
      .from('member_skill');
    if (result.length === 0) return;
    return formatResponse(result[0]);
    },

    async create(database, data) {
        try {
        const result = await database.insert(data).into('member_skill');
        return this.findOne(database, result[0]);
      } catch (e) {
        if (e.code !== 'ER_DUP_ENTRY') throw e;
        return null;
      }
    },

    async update(database, data, id) {
      const affectedRows = await database('member_skill').where('member_id', id).update(data);
      if (affectedRows > 0) return this.findOne(database, id);
      return null;
    },

    async remove(database, id) {
      try {
        const affectedRows = await database.where('member_id', id).from('member_skill').delete();
        return affectedRows > 0;
      } catch (e) {
        if (e.code !== 'ER_ROW_IS_REFERENCED_2') throw e;
        return null;
      }
    },
};
