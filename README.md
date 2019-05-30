# container_dlc2

Docker image for DeepLabCut<BR>
Docker Hub: https://hub.docker.com/r/wataruito/dlc2<B>
The image tag represents the version of DLC. (ex. wataruito/dlc2:2.0.6.2)

GPU version.
GUIs will work through X11-forwarding.

## Getting Started
### Prerequisites

Ubuntu18.04 desktop, NVIDIA driver 410.78, CUDA 10.0, Docker 18.09.3 and Anaconda 2018.12.

### Run the Docker container
The following command is evoked in jupyter notebook. The container will run jupyter at the port of 9201 and ssh at 9222. The jupyter run as the current user.<BR>


```python
imageName = 'wataruito/dlc2:'
prefixPort = '92'
import getpass
user = getpass.getuser()
sshPort = prefixPort + '22:22'
jupyterPort = prefixPort + '01:8888'
userHome = '/home/'+ user + '/docker_homes/' + containerName
jupyterStart = '/home/' + user + '/Dropbox/Jupyter'
display = ':0'
homeMount = '/home/' + user

!rm -Rf {userHome}
!docker run \
    --runtime=nvidia \
    -e NVIDIA_VISIBLE_DEVICES=0 \
    -e USER={user} \
    -e USER_GROUPS=sudo \
    -e USER_ID=1000 \
    -e USER_ENCRYPTED_PASSWORD=aa5V9MSdgw5ec \
    -e USER_HOME={userHome} \
    -e JUPYTER_START={jupyterStart} \
    -e DISPLAY={display}\
    -p {sshPort} -p {jupyterPort} \
    -v {homeMount}:{homeMount} \
    -v {homeMount}/.Xauthority:{userHome}/.Xauthority:rw \
    -v /tmp/.X11-unix:/tmp/.X11-unix \
    --rm -dit --name={containerName} {imageName}
```
