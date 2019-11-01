O **Unity XP** é um projeto de prova de conceito, que visa a possibilidade de usar o ambiente gráfico _**Unity**_ na última versão disponível do _**Ubuntu**_.

O sistema usa como _base_ o [**Ubuntu 19.10**](https://ubuntu.com) e o kernel é o [**Liquorix**](https://liquorix.net/).

_**Desktop**_
![desktop](https://raw.githubusercontent.com/rauldipeas/Unity-XP/master/screenshots/desktop.png)

_**Epiphany(Web)**_
![epiphany](https://raw.githubusercontent.com/rauldipeas/Unity-XP/master/screenshots/epiphany.png)

_**Tilix & Nemo**_
![tilix+nemo](https://raw.githubusercontent.com/rauldipeas/Unity-XP/master/screenshots/tilix+nemo.png)

No momento, _**não há a possibilidade de disponibilizar uma imagem de instalação**_, porém, você pode _compilar uma por sua conta e risco_, usando os comandos _abaixo_:

```bash
git clone https://github.com/rauldipeas/Unity-XP
cd Unity-XP
bash code/build.sh
```

Após a compilação, a imagem de instalação estará salva aqui: `~/Unity-XP/unity-xp-19.10-amd64.iso`

O tempo de compilação pode variar, _**de acordo com a capacidade de processamento do seu hardware e a velocidade da sua internet**_, no meu notebook **IdeaPad-320** com processador **i7 7500U**, **8gb de RAM** e um **SSD**, usando uma conexão de **60mpbs**, demora em torno de _30 minutos_.

![ubuntu-gif](https://raw.githubusercontent.com/rauldipeas/Unity-XP/master/ubuntu-logo.gif)
