const fields = ['p_name', 'p_description', 'p_status'];

const formatResponse = (responde) => ({
    name: response.p_name,
    description: response.p_description,
    status: response.p_status,
});

module.exports = {
    async findAll(database) {
      const result = await database.select('p_name', 'p_description', 'p_status').from('project')
      return result.map(formatResponse);
    },

    async findOne(database, name) {
      const result = await database
      .select('p_name', 'p_description', 'p_status')
      .where('p_name', name)
      .from('project');
    if (result.length === 0) return;
    return formatResponse(result[0]);
    },

    async findAllStatus(database, status) {
      const result = await database
      .select('p_name', 'p_description')
      .where('p_status', status)
      .from('project');
    if (result.length === 0) return;
    return formatResponse(result[0]);
    },

    async create(database, data) {
        try {
        const result = await database.insert(data).into('project');
        return this.findOne(database, result[0]);
      } catch (e) {
        if (e.code !== 'ER_DUP_ENTRY') throw e;
        return null;
      }
    },

    async update(database, data, name) {
      const affectedRows = await database('project').where('p_name', name).update(data);
      if (affectedRows > 0) return this.findOne(database, name);
      return null;
    },


};
