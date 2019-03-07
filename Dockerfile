FROM wataruito/ubg_core:3.6

RUN apt-get update
RUN apt-get -y install ffmpeg

# Install DeepLabCut
RUN conda install -y tensorflow==1.8 tensorflow-gpu==1.8
RUN pip install --upgrade --force-reinstall pip==9.0.3
RUN pip install deeplabcut
# RUN pip install https://extras.wxpython.org/wxPython4/extras/linux/gtk3/ubuntu-16.04/wxPython-4.0.3-cp36-cp36m-linux_x86_64.whl
RUN pip install --upgrade --force-reinstall pip
COPY wxPython-4.0.3-cp36-cp36m-linux_x86_64.whl /tmp/
RUN pip install /tmp/wxPython-4.0.3-cp36-cp36m-linux_x86_64.whl
RUN pip install ipywidgets
RUN pip install seaborn

# Install dependencies of wxPython
RUN apt-get install -y \
    libgtk2.0-dev libgtk-3-dev \
    libjpeg-dev libtiff-dev \
    libsdl1.2-dev libgstreamer-plugins-base1.0-dev \
    libnotify-dev freeglut3 freeglut3-dev libsm-dev \
    libwebkitgtk-dev libwebkitgtk-3.0-dev
