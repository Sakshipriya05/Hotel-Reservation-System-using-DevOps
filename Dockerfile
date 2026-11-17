
FROM eclipse-temurin:21-jdk

RUN apt-get update && apt-get install -y \
    xvfb \
    x11vnc \
    fluxbox \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app

COPY target/hotel-reservation-system-1.0.0.jar app.jar

EXPOSE 5900

CMD ["sh", "-c", "Xvfb :0 -screen 0 1280x800x24 & sleep 2 && fluxbox & x11vnc -display :0 -forever -shared -nopw -listen 0.0.0.0 -rfbport 5900 & sleep 2 && java -jar app.jar"]
