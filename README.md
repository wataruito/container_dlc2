# container_dlc2

Docker image for DeepLabCut<BR>
Docker Hub: https://hub.docker.com/r/wataruito/dlc2

GPU version.
GUIs will work through X11-forwarding.

## Getting Started
### Prerequisites

Ubuntu18.04 desktop, NVIDIA driver 410.78, CUDA 10.0, Docker 18.09.3 and Anaconda 2018.12.

### Run the Docker container
The following command is evoked in jupyter notebook. The container will start jupyter at the port of 9201 and ssh at 9222. The jupyter run as the current user.

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



What things you need to install the software and how to install them

```
Give examples
```

### Installing

A step by step series of examples that tell you how to get a development env running

Say what the step will be

```
Give the example
```

And repeat

```
until finished
```

End with an example of getting some data out of the system or using it for a little demo

## Running the tests

Explain how to run the automated tests for this system

### Break down into end to end tests

Explain what these tests test and why

```
Give an example
```

### And coding style tests

Explain what these tests test and why

```
Give an example
```

## Deployment

Add additional notes about how to deploy this on a live system

## Built With

* [Dropwizard](http://www.dropwizard.io/1.0.2/docs/) - The web framework used
* [Maven](https://maven.apache.org/) - Dependency Management
* [ROME](https://rometools.github.io/rome/) - Used to generate RSS Feeds

## Contributing

Please read [CONTRIBUTING.md](https://gist.github.com/PurpleBooth/b24679402957c63ec426) for details on our code of conduct, and the process for submitting pull requests to us.

## Versioning

We use [SemVer](http://semver.org/) for versioning. For the versions available, see the [tags on this repository](https://github.com/your/project/tags). 

## Authors

* **Billie Thompson** - *Initial work* - [PurpleBooth](https://github.com/PurpleBooth)

See also the list of [contributors](https://github.com/your/project/contributors) who participated in this project.

## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details

## Acknowledgments

* Hat tip to anyone whose code was used
* Inspiration
* etc
