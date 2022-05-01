const dateToMysql = (date) => {
  if (!date) return null;

  const newDate = new Date(date);

  const result = `${newDate.getUTCFullYear()}-${(
    "00" +
    (newDate.getUTCMonth() + 1)
  ).slice(-2)}-${("00" + newDate.getUTCDate()).slice(-2)}`;

  return result;
};

module.exports = {
  dateToMysql,
};
