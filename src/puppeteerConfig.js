import puppeteer from "puppeteer-core";

// Hàm trả về cấu hình cho Puppeteer
export const getPuppeteerConfig = () => {
  const chromePath = process.env.CHROME_PATH || "/usr/bin/google-chrome-stable"; // Đường dẫn đến Chromium

  return {
    headless: true,
    executablePath: chromePath, // Đường dẫn đến trình duyệt Chromium
    args: [
      "--no-sandbox",
      "--disable-setuid-sandbox",
      "--disable-dev-shm-usage",
      "--headless",
      "--disable-gpu",
      "--window-size=1280x720",
    ],
  };
};
