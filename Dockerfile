FROM jupyter/scipy-notebook

MAINTAINER Austin Rochford <austin.rochford@gmail.com>

USER $NB_USER 

RUN pip3 install git+https://github.com/pymc-devs/pymc3
RUN conda install --quiet --yes -c conda-forge tensorflow
RUN pip3 install edward
RUN pip3 install lda

RUN conda install --quiet --yes \
    boto \
    # to fix a bug in QT support; hopefully this is not necessary long-term
    icu=56.1 \
    toolz \
    xlrd

RUN conda config --add channels bioconda
RUN conda install --quiet --yes awscli
