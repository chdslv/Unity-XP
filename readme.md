O **Unity XP** é um projeto de prova de conceito, que visa a possibilidade de usar o ambiente gráfico _**Unity**_ na última versão disponível do _**Ubuntu**_.

O sistema usa como _base_ o [**Ubuntu 19.10**](https://ubuntu.com) e o kernel é o [**Liquorix**](https://liquorix.net/).

## Imagens
### Desktop
![desktop](https://raw.githubusercontent.com/rauldipeas/Unity-XP/master/screenshots/desktop.png)

### Epiphany(Web)
![epiphany](https://raw.githubusercontent.com/rauldipeas/Unity-XP/master/screenshots/epiphany.png)

### Tilix & Nemo
![tilix+nemo](https://raw.githubusercontent.com/rauldipeas/Unity-XP/master/screenshots/tilix+nemo.png)

### Características
 - **Ubuntu 19.10**
 - Kernel **Liquorix**
 - **ZRAM**
 - `limits.conf` otimizado
 - `sysctl.conf` otimizado
 - **NVIDIA DRM** ativado por padrão
 - **NVIDIA Force Full Composite** ativado por padrão
 - Ambiente gráfico **Unity 7**

### Lista de programas inclusos:
 - CompizConfig Settings Manager
 - Epiphany(Web)
 - Ferramenta de captura de tela do GNOME
 - GIMP
 - GNOME MPV
 - GNOME Uso
 - gThumb
 - LibreOffice
 - Nemo
 - Neofetch
 - Synaptic
 - Telegram
 - Tilix
 - TimeShift

### Temas
  - Vimix(GTK)
  - Yaru++(icons)
  - Papirus(icons, inherits)
  - Breeze(Cursor)

No momento, _**não há a possibilidade de disponibilizar uma imagem de instalação**_, porém, você pode _compilar uma por sua conta e risco_, usando os comandos _abaixo_:

```bash
git clone https://github.com/rauldipeas/Unity-XP
cd Unity-XP
bash code/build.sh
```

Após a compilação, a imagem de instalação estará salva aqui: `~/Unity-XP/unity-xp-19.10-amd64.iso`

O tempo de compilação pode variar, _**de acordo com a capacidade de processamento do seu hardware e a velocidade da sua internet**_, no meu notebook **IdeaPad-320** com processador **i7 7500U**, **8gb de RAM** e um **SSD**, usando uma conexão de **60mpbs**, demora em torno de _30 minutos_.
