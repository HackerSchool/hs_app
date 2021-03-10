const fields = ['m_id', 'm_pass', 'm_name', 'm_email', 'm_tlm', 'm_degree', 'm_year'];

const formatResponse = (responde) => ({
    istID: response.m_id,
    name: response.m_name,
    email: response.m_email,
    phone: response.m_tlm,
    degree: response.m_degree,
    year: response.m_year,
});

module.exports = {
    async findAll(database) {},
    async findOne(database, id) {},
    async create(database, data) {},
    async update(database, data, id) {},
    async remove(database, id) {},
};
