# CARLA installation guide

This in an installation guide for CARLA simulator using docker containers.

## Steps

### Clone this repository

```
git clone https://github.com/sashankneupane/carla-installation.git
cd carla-installation
```

### Install docker and nvidia-container-toolkit
First make `carla_installation.sh` executable, then execute it:
```
chmod +x carla_installation.sh
sudo ./carla_installation.sh
```

### Copy PythonAPI folder into your host machine
Again, first make `makePythonAPI.sh` executable, then execute it:
```
chmod +x makePythonAPI.sh
sudo ./makePythonAPI.sh
```
This will copy the PythonAPI inside this repository.

### Run the docker container
```
chmod +x docker_run.sh
sudo ./docker_run.sh
```
You can make changes as you wish in the `docker_run.sh` or you can simply run the docker container from the terminal depeneding upon your needs.
