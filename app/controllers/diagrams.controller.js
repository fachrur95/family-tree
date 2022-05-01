const { dateToMysql } = require("../helpers/core.helper");
const db = require("../models");
const Families = db.families;
const Individuals = db.individuals;
const Op = db.Sequelize.Op;

// Create and Save a new Families
const create = (req, res) => {
  // Validate request
  if (!req.body.fullName) {
    res.status(400).json({
      message: "Content can not be empty!",
    });
    return;
  }

  // Create a Families
  const individual = {
    fullName: req.body.fullName,
    sex: req.body.sex || "M",
    birthDate: dateToMysql(req.body.birthDate) || null,
    birthPlace: req.body.birthPlace || null,
    deathDate: dateToMysql(req.body.deathDate) || null,
    deathPlace: req.body.deathPlace || null,
  };

  // Save Families in the database
  Individuals.create(individual)
    .then((data) => {
      res.json(data);
    })
    .catch((err) => {
      res.status(500).json({
        message:
          err.message || "Some error occurred while creating the Families.",
      });
    });
};

// Retrieve all Familiess from the database.
const findAll = async (req, res) => {
  try {
    const title = req.query.title;
    var condition = title ? { title: { [Op.like]: `%${title}%` } } : null;
    const data = {
      info: "Silsilah Keluarga",
    };
    const dataFams = await Families.findAll({
      order: [["familyId"]],
    });
    const dataIndis = await Individuals.findAll({
      include: [
        { model: Families, as: "husband" },
        { model: Families, as: "wife" },
      ],
      order: [["individualId"]],
    });
    const tempChildren = [];
    const fams = dataFams?.map((item, index) => {
      // const children = JSON.parse(item.children);
      const children = JSON.parse(item.children)?.map((el) => `${el}`);
      tempChildren.push({
        famc: `${item.familyId}`,
        children,
      });
      const marriage = {
        date: {
          day: parseInt(item.marriageDate?.split("-")[2]),
          month: parseInt(item.marriageDate?.split("-")[1]),
          year: parseInt(item.marriageDate?.split("-")[0]),
        },
        place: item.marriagePlace,
      };
      return {
        children,
        husb: `${item.husbandId}`,
        id: `${item.familyId}`,
        marriage,
        wife: `${item.wifeId}`,
      };
    });
    // console.log(tempChildren);
    const indis = dataIndis?.map((item, index) => {
      const birth = {
        date: {
          day: parseInt(item.birthDate?.split("-")[2]),
          month: parseInt(item.birthDate?.split("-")[1]),
          year: parseInt(item.birthDate?.split("-")[0]),
        },
        place: item.birthPlace,
      };
      const death = {
        confirmed: item.deathDate !== null,
        date: {
          day: parseInt(item.deathDate?.split("-")[2]),
          month: parseInt(item.deathDate?.split("-")[1]),
          year: parseInt(item.deathDate?.split("-")[0]),
        },
        place: item.deathPlace,
      };
      const objFamc = tempChildren.find((el) =>
        el.children?.includes(`${item.individualId}`)
      );

      return {
        birth,
        death,
        famc: objFamc?.famc ?? "",
        fams:
          item.husband.length > 0
            ? [`${item.husband[0]?.familyId}`]
            : item.wife.length > 0
            ? [`${item.wife[0]?.familyId}`]
            : [],
        firstName: item.fullName,
        id: `${item.individualId}`,
        lastName: "",
        sex: item.sex,
      };
    });
    data.fams = fams;
    data.indis = indis;
    res.json(data);
  } catch (error) {
    console.log(error);
    res.sendStatus(400);
  }
  // const fams = await Families.findAll()
  //   .then((data) => {
  //     res.json(data);
  //   })
  //   .catch((err) => {
  //     res.status(500).json({
  //       message:
  //         err.message || "Some error occurred while retrieving familiess.",
  //     });
  //   });
};

// Find a single Families with an id
const findOne = (req, res) => {
  const id = req.params.id;

  Families.findByPk(id)
    .then((data) => {
      if (data) {
        res.json(data);
      } else {
        res.status(404).json({
          message: `Cannot find Families with id=${id}.`,
        });
      }
    })
    .catch((err) => {
      res.status(500).json({
        message: "Error retrieving Families with id=" + id,
      });
    });
};

// Update a Families by the id in the request
// UPDATE FOR INDIVIDUAL
const update = async (req, res) => {
  const id = req.params.id;

  const individual = {
    fullName: req.body.fullName,
    sex: req.body.sex || "M",
    birthDate: dateToMysql(req.body.birthDate) || null,
    birthPlace: req.body.birthPlace || null,
    deathDate: dateToMysql(req.body.deathDate) || null,
    deathPlace: req.body.deathPlace || null,
  };

  // const selfChildren = req.body.children?.map((el) => el.indiId);
  const newChildren = req.body.children?.reduce((filtered, option) => {
    if (option.indiId === "") {
      const newChildDetail = {
        fullName: option.fullName,
        sex: option.sex || "M",
        birthDate: option.birthDate || null,
        birthPlace: option.birthPlace || null,
        deathDate: option.deathDate || null,
        deathPlace: option.deathPlace || null,
      };
      filtered.push(newChildDetail);
    }
    return filtered;
  }, []);

  const oldChildren = req.body.children?.reduce((filtered, option) => {
    if (option.indiId !== "") {
      filtered.push(option.indiId);
    }
    return filtered;
  }, []);

  const familySelf = {
    familyId: req.body.familyId,
    husbandId: req.body.sex === "M" ? req.body.id : req.body.coupleId,
    wifeId: req.body.sex === "M" ? req.body.coupleId : req.body.id,
    marriageDate: dateToMysql(req.body.marriageDateCouple) || null,
    marriagePlace: req.body.birthPlaceCouple || null,
    divorceDate: dateToMysql(req.body.divorceDateCouple) || null,
    divorcePlace: req.body.deathPlaceCouple || null,
    // children: newChildren,
  };
  const familyParent = {
    familyId: req.body.parentId,
    husbandId: req.body.fatherId,
    wifeId: req.body.motherId,
    marriageDate: dateToMysql(req.body.marriageDate) || null,
    marriagePlace: req.body.marriagePlace || null,
    divorceDate: dateToMysql(req.body.deathDate) || null,
    divorcePlace: req.body.deathPlace || null,
  };
  // const newFamilySelf = {
  //   familyId: "",
  //   husbandId: req.body.sex === "M" ? req.body.id : req.body.newCouple,
  //   wifeId: req.body.sex === "M" ? req.body.newCouple : req.body.id,
  //   marriageDate: dateToMysql(req.body.marriageDateCouple) || null,
  //   marriagePlace: req.body.marriagePlaceCouple || null,
  // };
  const newFamilyParent = {
    familyId: "",
    husbandId: req.body.newFather,
    wifeId: req.body.newMother,
    marriageDate: dateToMysql(req.body.marriageDateNew) || null,
    marriagePlace: req.body.marriagePlaceNew || null,
    children: [id.toString()],
  };

  const t = await db.sequelize.transaction();
  try {
    await Individuals.update(individual, {
      where: { individualId: id },
      transaction: t,
    });
    let newChildId = [];
    if (newChildren.length > 0) {
      const insertChildren = await Individuals.bulkCreate(newChildren, {
        transaction: t,
        returning: true,
      });

      newChildId = insertChildren.map((el) => el.individualId);
    }
    const allChild = [...oldChildren, ...newChildId];
    const newDataFamilySelf = { ...familySelf, children: allChild };

    if (req.body.familyId) {
      await Families.update(newDataFamilySelf, {
        where: { familyId: newDataFamilySelf.familyId },
        transaction: t,
      });
    } else {
      await Families.create(newDataFamilySelf, { transaction: t });
    }

    if (req.body.newFather) {
      await Families.create(newFamilyParent, { transaction: t });
    } else {
      await Families.update(familyParent, {
        where: { familyId: familyParent.familyId },
        transaction: t,
      });
    }

    await t.commit();
    res.json({ message: "Update success!" });
  } catch (err) {
    // If the execution reaches this line, an error was thrown.
    // We rollback the transaction.
    await t.rollback();
    res.status(500).json({
      message: err.message || "Some error occurred while creating the product.",
    });
  }
  // Families.update(req.body, {
  //   where: { id: id },
  // })
  //   .then((num) => {
  //     if (num == 1) {
  //       res.json({
  //         message: "Families was updated successfully.",
  //       });
  //     } else {
  //       res.json({
  //         message: `Cannot update Families with id=${id}. Maybe Families was not found or req.body is empty!`,
  //       });
  //     }
  //   })
  //   .catch((err) => {
  //     res.status(500).json({
  //       message: "Error updating Families with id=" + id,
  //     });
  //   });
};

// UPDATE FOR PARENT
const updateParent = async (req, res) => {
  const id = req.params.id;

  const newChildren = req.body.children?.reduce((filtered, option) => {
    if (option.indiId === "") {
      const newChildDetail = {
        fullName: option.fullName,
        sex: option.sex || "M",
        birthDate: option.birthDate || null,
        birthPlace: option.birthPlace || null,
        deathDate: option.deathDate || null,
        deathPlace: option.deathPlace || null,
      };
      filtered.push(newChildDetail);
    }
    return filtered;
  }, []);

  const oldChildren = req.body.children?.reduce((filtered, option) => {
    if (option.indiId !== "") {
      filtered.push(option.indiId);
    }
    return filtered;
  }, []);

  const familySelf = {
    familyId: req.body.parentId,
    husbandId: req.body.fatherId,
    wifeId: req.body.motherId,
    marriageDate: dateToMysql(req.body.marriageDate) || null,
    marriagePlace: req.body.birthPlace || null,
    divorceDate: dateToMysql(req.body.divorceDate) || null,
    divorcePlace: req.body.deathPlace || null,
    // children: newChildren,
  };

  const t = await db.sequelize.transaction();
  try {
    let newChildId = [];
    if (newChildren.length > 0) {
      const insertChildren = await Individuals.bulkCreate(newChildren, {
        transaction: t,
        returning: true,
      });

      newChildId = insertChildren.map((el) => el.individualId.toString());
    }
    const allChild = [...oldChildren, ...newChildId];
    // console.log(allChild);
    const newFamilySelf = { ...familySelf, children: allChild };

    console.log(newFamilySelf);
    await Families.update(newFamilySelf, {
      where: { familyId: newFamilySelf.familyId },
      transaction: t,
    });

    await t.commit();
    res.json({ message: "Update success!" });
  } catch (err) {
    // If the execution reaches this line, an error was thrown.
    // We rollback the transaction.
    await t.rollback();
    res.status(500).json({
      message: err.message || "Some error occurred while creating the product.",
    });
  }
  /* Families.update(req.body, {
    where: { id: id },
  })
    .then((num) => {
      if (num == 1) {
        res.json({
          message: "Families was updated successfully.",
        });
      } else {
        res.json({
          message: `Cannot update Families with id=${id}. Maybe Families was not found or req.body is empty!`,
        });
      }
    })
    .catch((err) => {
      res.status(500).json({
        message: "Error updating Families with id=" + id,
      });
    }); */
};

// UPDATE FOR FAMILY
const updateFamily = (req, res) => {
  const id = req.params.id;

  Families.update(req.body, {
    where: { id: id },
  })
    .then((num) => {
      if (num == 1) {
        res.json({
          message: "Families was updated successfully.",
        });
      } else {
        res.json({
          message: `Cannot update Families with id=${id}. Maybe Families was not found or req.body is empty!`,
        });
      }
    })
    .catch((err) => {
      res.status(500).json({
        message: "Error updating Families with id=" + id,
      });
    });
};

// Delete a Families with the specified id in the request
const destroy = (req, res) => {
  const id = req.params.id;

  Families.destroy({
    where: { id: id },
  })
    .then((num) => {
      if (num == 1) {
        res.json({
          message: "Families was deleted successfully!",
        });
      } else {
        res.json({
          message: `Cannot delete Families with id=${id}. Maybe Families was not found!`,
        });
      }
    })
    .catch((err) => {
      res.status(500).json({
        message: "Could not delete Families with id=" + id,
      });
    });
};

// Delete all Familiess from the database.
const deleteAll = (req, res) => {
  Families.destroy({
    where: {},
    truncate: false,
  })
    .then((nums) => {
      res.json({ message: `${nums} Familiess were deleted successfully!` });
    })
    .catch((err) => {
      res.status(500).json({
        message:
          err.message || "Some error occurred while removing all familiess.",
      });
    });
};

// find all published Families
const findAllPublished = (req, res) => {
  Families.findAll({ where: { published: true } })
    .then((data) => {
      res.json(data);
    })
    .catch((err) => {
      res.status(500).json({
        message:
          err.message || "Some error occurred while retrieving familiess.",
      });
    });
};

module.exports = {
  create,
  update,
  updateParent,
  updateFamily,
  findAll,
  findOne,
  destroy,
  deleteAll,
  findAllPublished,
};
