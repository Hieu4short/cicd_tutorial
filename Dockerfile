FROM ubuntu:latest

MAINTAINER Tuan Thai "tuanthai@example.com"

# Cập nhật và cài đặt các gói cần thiết
RUN apt update -y && \
    apt install -y python3-pip python3-dev build-essential python3-venv

# Tạo thư mục cho ứng dụng
WORKDIR /flask_app

# Sao chép requirements.txt vào hình ảnh
COPY requirements.txt .

# Tạo môi trường ảo
RUN python3 -m venv venv

# Kích hoạt môi trường ảo và cài đặt các gói
RUN ./venv/bin/pip install -r requirements.txt

# Sao chép mã nguồn ứng dụng vào hình ảnh
COPY . .

# Cài đặt biến môi trường để sử dụng pip từ môi trường ảo
ENV PATH="/flask_app/venv/bin:$PATH"

# Chạy ứng dụng Flask
ENTRYPOINT ["python3"]
CMD ["flask_docker.py"]

