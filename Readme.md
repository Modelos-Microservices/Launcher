# 🚀 Guía de Configuración del Launcher

## 📋 Requisitos Previos
- Git instalado
- Docker y Docker Compose instalados
- Acceso a las credenciales del proyecto

## 📁 Documentos del Proyecto
Link: https://liveudenaredu-my.sharepoint.com/:f:/g/personal/luismedina1_udenar_edu_co/EoZCXpdrqu9Mk2HZzRRgndoBy88xdPVzGSlyfzIdzTj8Sg?e=xVzWxG

Importante: Descarga los archivos necesarios desde la carpeta de documentos del proyecto:
🔗 Carpeta de Documentos Extra
Esta carpeta contiene:

- Variables de entorno necesarias
- Archivo backup_volume.tar para KeyCloak
- Credenciales de la cuenta de google

## 🔧 Instalación y Configuración

### 1. Clonar el Repositorio

#### 1.1 Clonar el repositorio principal
```bash
git clone https://github.com/Modelos-Microservices/Launcher.git
```

#### 1.2 Navegar al directorio del launcher
```bash
cd Launcher
```

#### 1.3 Inicializar submódulos de Git
Como el proyecto utiliza submódulos de Git, ejecuta el siguiente comando para clonarlos recursivamente:
```bash
git submodule update --init --recursive
```

#### 1.4 Configurar variables de entorno
1. Dirígete a la carpeta especificada en la documentación superior
2. Localiza el archivo con las variables de entorno
3. **Copia** el contenido del archivo template
4. **Crea** un nuevo archivo llamado `.env` en la raíz del proyecto (al mismo nivel que `.env.template`)
5. **Pega** el contenido copiado en el nuevo archivo `.env`

### 2. Configurar KeyCloak

#### 2.1 Descargar backup de base de datos
1. Ingresa a la carpeta de elementos del proyecto
2. Descarga el archivo `backup_volume.tar` 
3. Guárdalo en tu **Escritorio**

#### 2.2 Restaurar volumen de datos
Ejecuta el siguiente comando (actualiza `USUARIO_OTRA_PC` con tu nombre de usuario):
```bash
docker run --rm -v launcher_keycloak_postgres_data:/volumendata -v C:\Users\USUARIO_OTRA_PC\Desktop:/backup alpine tar xvf /backup/backup_volumen.tar -C /volumendata
```

#### 2.3 Iniciar el launcher
```bash
docker-compose up --build
```

### 3. Configuración de Stripe (Opcional)

> **Nota:** Esta sección es opcional. Solo necesaria si requieres funcionalidad de pagos con Stripe.

#### 3.1 Instalar Hookdeck CLI
Sigue las instrucciones de instalación en: https://hookdeck.com/docs/cli#installation

#### 3.2 Configurar credenciales
- Las credenciales de acceso se encuentran en el tercer documento del archivo del proyecto
- Utiliza estas credenciales para autenticarte en Google y posteriormente en Hookdeck

#### 3.3 Logout de cuenta por defecto
```bash
hookdeck logout
```

#### 3.4 Login con credenciales del proyecto
```bash
hookdeck login
```

#### 3.5 Exponer endpoints públicamente
> **Importante:** Asegúrate de que el launcher esté ejecutándose antes de este paso.

```bash
hookdeck listen 3003 stripe-to-localhost
```

## ✅ Verificación

Una vez completados estos pasos, el Launcher debería estar funcionando correctamente. Puedes verificar el estado de los contenedores con:

```bash
docker-compose ps
```

## 🆘 Solución de Problemas

Si encuentras algún problema durante la configuración:
1. Verifica que todos los prerequisitos estén instalados
2. Asegúrate de que los puertos necesarios estén disponibles
3. Revisa los logs de Docker para identificar errores específicos:
   ```bash
   docker-compose logs
   ```


