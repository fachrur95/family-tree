module.exports = (sequelize, Sequelize) => {
  const Families = sequelize.define("families", {
    title: {
      type: Sequelize.STRING
    },
    description: {
      type: Sequelize.STRING
    },
    published: {
      type: Sequelize.BOOLEAN
    }
  });

  return Families;
};
