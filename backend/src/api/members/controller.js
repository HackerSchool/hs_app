const fields = ['m_id', 'm_pass', 'm_name', 'm_email', 'm_tlm', 'm_degree', 'm_year', 'm_admin'];

const formatResponse = (responde) => ({
    istID: response.m_id,
    name: response.m_name,
    email: response.m_email,
    phone: response.m_tlm,
    degree: response.m_degree,
    year: response.m_year,
    admin: response.m_admin,
});

module.exports = {
    async findAll(database) {
      const result = await database.select('id', 'm_name', 'm_email', 'm_tlm', 'm_degree', 'm_year', 'm_admin').from('member_')
      return result.map(formatResponse);
    },

    async findOne(database, id) {
      const result = await database
      .select('id', 'm_name', 'm_email', 'm_tlm', 'm_degree', 'm_year', 'm_admin')
      .where('id', id)
      .from('member_');
    if (result.length === 0) return;
    return formatResponse(result[0]);
    },

    async create(database, data) {
        try {
        const result = await database.insert(data).into('member_');
        return this.findOne(database, result[0]);
      } catch (e) {
        if (e.code !== 'ER_DUP_ENTRY') throw e;
        return null;
      }
    },

    async update(database, data, id) {
      const affectedRows = await database('member_').where('id', id).update(data);
      if (affectedRows > 0) return this.findOne(database, id);
      return null;
    },

    async remove(database, id) {
      try {
        const affectedRows = await database.where('id', id).from('member_').delete();
        return affectedRows > 0;
      } catch (e) {
        if (e.code !== 'ER_ROW_IS_REFERENCED_2') throw e;
        return null;
      }
    },
};
