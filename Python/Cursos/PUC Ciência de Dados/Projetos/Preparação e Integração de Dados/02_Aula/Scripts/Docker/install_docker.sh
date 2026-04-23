sudo rm -rf docker;
sudo mkdir docker;
USER_HOME=$PWD

echo "🔧 Atualizando sistema..."
sudo apt-get update -y
sudo apt-get upgrade -y

echo "🐳 Instalando Docker..."
cd docker;
sudo apt-get remove docker docker-engine docker.io containerd runc;
sudo apt-get update;
sudo apt-get install \
    		ca-certificates \
    		curl \
    		gnupg \
    		lsb-release ;
sudo mkdir -p /etc/apt/keyrings;
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg;
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null &&
sudo apt-get update;
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-compose-plugin;
sudo apt install docker-compose;

echo "✅ Docker instalado!"
echo "🔐 Configurando permissões Docker (sem sudo)..."
sudo usermod -aG docker $USER