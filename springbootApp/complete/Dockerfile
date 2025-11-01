# ===========================
# Stage 1: Build the JAR file
# ===========================
FROM maven:3.9.6-eclipse-temurin-17 AS build
WORKDIR /app

# Copy toàn bộ project vào container
COPY . .

# Build ứng dụng (bỏ qua test cho nhanh)
RUN mvn clean package -DskipTests

# ===========================
# Stage 2: Run the application
# ===========================
FROM eclipse-temurin:17-jdk
WORKDIR /app

# Copy file JAR từ stage build sang
COPY --from=build /app/target/*.jar app.jar

# Render sẽ tự truyền PORT vào, bạn nên để biến môi trường này
ENV PORT=8080
EXPOSE 8080

# Lệnh khởi chạy ứng dụng
ENTRYPOINT ["java", "-jar", "app.jar"]
