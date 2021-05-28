const fields = ['p_name', 'member_id'];

const formatResponse = (responde) => ({
    p_name: response.p_name,
    m_id: response.member_id,
});

module.exports = {
    async findAll(database) {
      const result = await database.select('p_name', 'member_id').from('project_members')
      return result.map(formatResponse);
    },

    async findAllProj(database, id) {
      const result = await database
      .select('p_name', 'member_id')
      .where('member_id', id)
      .from('project_members');
    if (result.length === 0) return;
    return formatResponse(result[0]); // tem que se devolver mais do que 1
    },

    async findAllMembers(database, p_name) {
      const result = await database
      .select('p_name', 'member_id')
      .where('p_name', p_name)
      .from('project_members');
    if (result.length === 0) return;
    return formatResponse(result[0]); // tem que se devolver mais do que 1
    },

    async create(database, data) {
        try {
        const result = await database.insert(data).into('project_members');
        return this.findOne(database, result[0]);
      } catch (e) {
        if (e.code !== 'ER_DUP_ENTRY') throw e;
        return null;
      }
    },

    async remove(database, id, p_name) {
      try {
        const affectedRows = await database.where('member_id', id).where('p_name', p_name).from('project_members').delete();
        return affectedRows > 0;
      } catch (e) {
        if (e.code !== 'ER_ROW_IS_REFERENCED_2') throw e;
        return null;
      }
    },
};
