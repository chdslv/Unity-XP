### [Insomnia](https://insomnia.rest/)
```bash
echo "deb https://dl.bintray.com/getinsomnia/Insomnia /" | sudo tee -a /etc/apt/sources.list.d/insomnia.list
wget -O- https://insomnia.rest/keys/debian-public.key.asc | gpg --dearmor | sudo tee /etc/apt/trusted.gpg.d/insomnia.gpg
sudo apt update
sudo apt install -y insomnia
```
