# QuickFixHub – Home Services Booking Platform

A modern, full-stack home services booking platform built with **Java Spring MVC 5.3**, **Hibernate 5.6 ORM**, **MySQL**, and **JSP** featuring the **Warm Editorial (Terracotta + Cream)** visual identity.

---

## 🎨 Visual Identity & Architecture

- **Theme Palette**:
  - Warm Ivory (`#F6F1E8`) & Pure White (`#FFFFFF`)
  - Terracotta Accent (`#C76545` / Hover `#B25435`)
  - Deep Charcoal Typography (`#252823`)
  - Muted Sage (`#849078`), Sand (`#D9C9AE`), and Border (`#E7DED1`)
- **Typography**: `DM Serif Display` (Editorial Headings) & `DM Sans` (Interface, Forms, Tables)
- **Architecture**: Spring MVC DispatcherServlet, HibernateTemplate DAO Layer, MySQL 8.0, Responsive JSP Views.

---

## 🚀 Getting Started

### 1. Database Setup
1. Create a MySQL database named `quickfixhub_db`:
   ```sql
   CREATE DATABASE quickfixhub_db CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
   ```
2. Hibernate is configured with `hbm2ddl.auto=update` and will automatically generate the required tables (`User`, `Provider`, `OrderService`).

### 2. Configure Database Credentials
To protect your confidential credentials, database properties are externalized:

1. Locate `src/main/resources/db.properties.example`.
2. Copy or rename it to `db.properties` in `src/main/resources/`:
   ```properties
   db.driver=com.mysql.cj.jdbc.Driver
   db.url=jdbc:mysql://localhost:3306/quickfixhub_db?useSSL=false&allowPublicKeyRetrieval=true&serverTimezone=UTC
   db.username=YOUR_DATABASE_USERNAME
   db.password=YOUR_DATABASE_PASSWORD
   ```
   *(Note: `db.properties` is listed in `.gitignore` and will never be committed to Git).*

### 3. Build & Run
Build the WAR package with Maven:
```bash
mvn clean package -DskipTests
```

Deploy the generated `target/QuickFixHub_Project.war` into Apache Tomcat 8.5/9 (`webapps` folder) or your preferred servlet container.

Access the platform at:
```
http://localhost:8080/QuickFixHub_Project/
```

---

## 🔐 Default Admin Portal
- **URL**: `/adminLogin`
- **Email**: `admin@gmail.com`
- **Password**: `admin123`

---

## 📁 Repository Structure
```
QuickFixHub/
├── src/main/java/com/sujal/
│   ├── controller/      # Spring MVC Controllers (User, Provider, Admin, OrderService)
│   ├── dao/             # Hibernate DAOs (UserDao, ProviderDao, OrderServiceDao)
│   └── model/           # JPA Entities (User, Provider, OrderService)
├── src/main/resources/
│   ├── config.xml       # Spring Context & DataSource Configuration
│   ├── db.properties.example # Dummy configuration template for GitHub
│   └── db.properties    # (Ignored by Git) Local database credentials
├── src/main/webapp/
│   └── WEB-INF/
│       ├── views/       # 27 Redesigned Warm Editorial JSP Views
│       ├── spring-servlet.xml
│       └── web.xml
├── .gitignore           # Ignores sensitive credentials, build outputs, and IDE files
├── pom.xml              # Maven dependencies & build configuration
└── README.md
```
