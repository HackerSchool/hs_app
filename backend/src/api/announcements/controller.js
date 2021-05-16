const fields = ['a_id', 'a_title', 'a_date', 'a_description', 'a_links', 'a_del_date', 'a_weekly'];

const formatResponse = (responde) => ({
    id: response.a_id,
    title: response.a_title,
    date: response.a_date,
    description: response.a_description,
    links: response.a_links,
    del_date: response.a_del_date,
    weekly: response.a_weekly,
});

module.exports = {
    async findAll(database) {
      const result = await database.select('id', 'title', 'date','description', 'links', 'del_date',
      'weekly').from('announcement')
      return result.map(formatResponse);
    },

    async findOne(database, id) {
      const result = await database
      .select('id', 'title', 'date','description', 'links', 'del_date','weekly')
      .where('id', id)
      .from('announcement');
    if (result.length === 0) return;
    return formatResponse(result[0]);
    },

    async create(database, data) {
        try {
        const result = await database.insert(data).into('announcement');
        return this.findOne(database, result[0]);
      } catch (e) {
        if (e.code !== 'ER_DUP_ENTRY') throw e;
        return null;
      }
    },

    async update(database, data, id) {
      const affectedRows = await database('announcement').where('id', id).update(data);
      if (affectedRows > 0) return this.findOne(database, id);
      return null;
    },

    async remove(database, id) {
      try {
        const affectedRows = await database.where('id', id).from('announcement').delete();
        return affectedRows > 0;
      } catch (e) {
        if (e.code !== 'ER_ROW_IS_REFERENCED_2') throw e;
        return null;
      }
    },
};
