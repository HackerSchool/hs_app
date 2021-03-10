
const auth = require('./auth');
const announcements = require('./announcements');
const project_members = require('./project_members');
const projects = require('./projects');
const skills = require('./skills');

module.exports = {
  // Add all routes to express 'app'
  init: (app) => {
    auth.init(app);
    annoucements.init(app),
    project_members.init(app),
    projects.init(app),
    skills.init(app),
  },
};
