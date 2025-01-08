const { join } = require("path");

/**
 * @type {import("puppeteer").Configuration}
 */
module.exports = {
  // Chỉ định lại thư mục cache cho Puppeteer.
  cacheDirectory: join(__dirname, ".cache", "puppeteer"),
};
