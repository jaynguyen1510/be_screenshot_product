# Sử dụng image chính thức của Puppeteer
FROM ghcr.io/puppeteer/puppeteer:23.11.1

# Cấu hình cho Puppeteer không tải Chromium và chỉ định đường dẫn đến Google Chrome
ENV PUPPETEER_SKIP_CHROMIUM_DOWNLOAD=true \
    PUPPETEER_EXECUTABLE_PATH=/usr/bin/google-chrome-stable

# Cài đặt các phần mềm phụ thuộc cần thiết cho Chrome
RUN apt-get update && apt-get install -y \
    ca-certificates \
    fonts-liberation \
    libappindicator3-1 \
    libasound2 \
    libatk-bridge2.0-0 \
    libatk1.0-0 \
    libcups2 \
    libdbus-1-3 \
    libnss3 \
    libx11-xcb1 \
    libxcomposite1 \
    libxcursor1 \
    libxdamage1 \
    libxi6 \
    libxrandr2 \
    wget \
    libgbm-dev \
    libgtk-3-0 \
    libxshmfence1 \
    google-chrome-stable \
    && rm -rf /var/lib/apt/lists/*

# Cài đặt thư viện ứng dụng
WORKDIR /usr/src/app

# Sao chép package.json và cài đặt các phụ thuộc
COPY package*.json ./ 
RUN npm ci

# Sao chép tất cả các tệp khác vào container
COPY . .

# Chạy ứng dụng với Nodemon
CMD ["nodemon", "index.js"]
