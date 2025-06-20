# 🚀 DevOps Java WebApp Pipeline

This project demonstrates a complete DevOps pipeline for a Java-based web application using **Maven**, **Jenkins**, and **Docker**. It includes build automation, Docker image creation, and CI/CD configuration via a Jenkins pipeline.

---

## 📁 Project Structure

```
.
├── Jenkinsfile                # Jenkins CI/CD pipeline
├── Dockerfile                 # Docker containerization file
├── Dockertagupdate.sh         # Shell script for Docker tagging
├── pom.xml                    # Maven project file
├── server/
│   └── src/main/java          # Java source code
├── webapp/
│   ├── index.html             # Web front-end (HTML)
│   ├── WEB-INF/web.xml        # Web configuration
│   ├── *.jpg                  # Image assets
```

---

## ⚙️ Tech Stack

- **Java 11**
- **Maven**
- **Jenkins**
- **Docker**
- **HTML / JSP (webapp)**

---

## 🔄 Jenkins Pipeline Stages

The `Jenkinsfile` defines a multi-stage pipeline:

1. **Git Checkout** – Pulls code from the `main` branch.
2. **Compile** – Uses `mvn compile` to compile the Java project.
3. **Build** – Packages the app using `mvn package`.
4. **Build & Push Docker Image** – Builds a Docker image from the app source.

---

## 🐳 Docker

To build and run the image manually:

```bash
# Build Docker image
docker build -t java-webapp .

# Run container
docker run -p 3000:3000 java-webapp
```

---

## 🛠 How to Run Locally

```bash
# Compile
mvn compile

# Package
mvn package

# Run with Docker
docker build -t java-webapp .
docker run -p 3000:3000 java-webapp
```

---

## 📦 Future Enhancements

- Integrate **SonarQube** for code quality analysis
- Add **unit testing stage** with `mvn test`
- Automate Docker image push to DockerHub
- Set up **GitHub Actions** for CI/CD

---

## 👨‍💻 Author

**Basavanagowda DK**  
Full Stack Developer | DevOps Enthusiast  
[LinkedIn](#) • [GitHub](#)

---

## 📄 License

This project is open-source and available under the [MIT License](LICENSE).