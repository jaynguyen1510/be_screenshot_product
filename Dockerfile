# Chạy Puppeteer trên Docker với image chính thức của Puppeteer
FROM ghcr.io/puppeteer/puppeteer:23.11.1

# Cấu hình cho Puppeteer không tải Chromium và chỉ định đường dẫn đến Google Chrome
ENV PUPPETEER_SKIP_CHROMIUM_DOWNLOAD=true \
    PUPPETEER_EXECUTABLE_PATH=/usr/bin/google-chrome-stable
# Cài đặt thư viện ứng dụng
WORKDIR /usr/src/app

# Sao chép package.json và cài đặt các phụ thuộc
COPY package*.json ./
RUN npm ci
USER root
RUN npm install -g nodemon
USER pptruser



# Sao chép tất cả các tệp khác vào container
COPY . .

# Chạy ứng dụng với Nodemon
CMD ["nodemon", "index.js"]
