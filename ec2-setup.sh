#!/bin/bash

echo "🔄 Updating system..."
sudo apt update -y

echo "📦 Installing Git..."
sudo apt install git -y

echo "📦 Installing Java (OpenJDK 21)..."
sudo apt install fontconfig openjdk-21-jre -y

echo "🔑 Adding Jenkins repository key..."
sudo mkdir -p /etc/apt/keyrings
sudo wget -O /etc/apt/keyrings/jenkins-keyring.asc https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key

echo "📝 Adding Jenkins to sources list..."
echo "deb [signed-by=/etc/apt/keyrings/jenkins-keyring.asc] https://pkg.jenkins.io/debian-stable binary/" | \
sudo tee /etc/apt/sources.list.d/jenkins.list > /dev/null

echo "🔄 Updating package list for Jenkins..."
sudo apt update

echo "📦 Installing Jenkins..."
sudo apt install jenkins -y

echo "🧼 Removing old Docker versions if any..."
sudo apt-get remove -y docker docker-engine docker.io containerd runc || true

echo "🔄 Updating package list..."
sudo apt-get update

echo "📦 Installing Docker prerequisites..."
sudo apt-get install -y ca-certificates curl gnupg lsb-release apt-transport-https

echo "🔑 Adding Docker GPG key..."
sudo mkdir -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | \
sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg

echo "📝 Adding Docker to sources list..."
echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] \
https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | \
sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

echo "🔄 Updating package list for Docker..."
sudo apt-get update

echo "📦 Installing Docker Engine..."
sudo apt-get install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

echo "🔁 Enabling and starting Docker service..."
sudo systemctl enable docker
sudo systemctl start docker

echo "🐳 Docker version: $(docker --version)"

echo "👤 Adding 'jenkins' user to 'docker' group..."
sudo usermod -aG docker jenkins
sudo systemctl restart jenkins

echo "🔐 Setting up Trivy (vulnerability scanner)..."
wget -qO - https://aquasecurity.github.io/trivy-repo/deb/public.key | sudo apt-key add -
echo "deb https://aquasecurity.github.io/trivy-repo/deb $(lsb_release -sc) main" | \
sudo tee -a /etc/apt/sources.list.d/trivy.list

echo "🔄 Updating package list for Trivy..."
sudo apt update

echo "📦 Installing Trivy..."
sudo apt install trivy -y

echo "✅ Setup complete: Jenkins, Docker, Trivy installed successfully!"
