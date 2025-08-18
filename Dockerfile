FROM quay.io/jupyter/scipy-notebook:lab-4.3.5

ARG PIP_EXTRA_INDEX_URL
ENV PIP_EXTRA_INDEX_URL=${PIP_EXTRA_INDEX_URL}

ARG NB_USER=jovyan
ARG NB_UID=1000
ENV USER ${NB_USER}
ENV NB_UID ${NB_UID}
ENV HOME /home/${NB_USER}

RUN pip install --no-cache-dir jupyterhub



# Make sure the contents of our repo are in ${HOME}
COPY . ${HOME}

RUN pip install --no-cache-dir -r requirements.txt

USER root
RUN chown -R ${NB_UID} ${HOME}
USER ${NB_USER}

