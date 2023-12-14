FROM cirrusci/flutter:latest

WORKDIR /app
COPY . .

RUN flutter pub get

EXPOSE 8080

CMD ["flutter", "run", "--release", "-d", "web"]
