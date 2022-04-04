module.exports = (sequelize, Sequelize) => {
  const Individuals = sequelize.define("individuals", {
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

  return Individuals;
};
