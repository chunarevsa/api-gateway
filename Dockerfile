# Используем образ с Java и Gradle
FROM gradle:latest AS builder

# Устанавливаем рабочую директорию
WORKDIR /app/apigateway

# Копируем файлы с зависимостями и сборки
COPY build.gradle .
COPY settings.gradle .
COPY src src

# Собираем проект
RUN gradle build --no-daemon --exclude-task test

# Используем минимальный образ с JRE
FROM openjdk:11-jre-slim

# Устанавливаем рабочую директорию
WORKDIR /app/apigateway

# Копируем JAR файл из предыдущего этапа сборки
COPY --from=builder /app/apigateway/build/libs/api-gateway-0.0.1-SNAPSHOT.jar .

# Задаем команду для запуска приложения
CMD ["java", "-Dspring.profiles.active=prod", "-jar", "api-gateway-0.0.1-SNAPSHOT.jar"]