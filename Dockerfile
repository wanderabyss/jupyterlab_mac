FROM ubuntu:20.04

ENV TZ=US
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN apt-get -y update
RUN apt-get -y install python3-pip
RUN apt-get -y install build-essential libssl-dev libffi-dev python3-dev 
RUN apt-get -y install git git-lfs

RUN pip3 install npm nodejs 

RUN pip3 install numpy pandas seaborn tabulate tensorboard

RUN pip3 install "jupyterlab>=3" "ipywidgets>=7.6"
RUN pip3 install plotly==5.1.0
RUN pip3 install -U kaleido
RUN pip3 install nbconvert jupyterlab-git


CMD ["jupyter", "lab", "--port=8888", "--no-browser", "--ip=0.0.0.0",  "--allow-root"] 
