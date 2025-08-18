FROM quay.io/jupyter/scipy-notebook:lab-4.3.5

ARG PIP_EXTRA_INDEX_URL
ENV PIP_EXTRA_INDEX_URL=$PIP_EXTRA_INDEX_URL

RUN pip install --no-cache-dir jupyterhub



# Make sure the contents of our repo are in ${HOME}
COPY . ${HOME}

RUN pip install --no-cache-dir -r requirements.txt

USER root
RUN chown -R ${NB_UID} ${HOME}
USER ${NB_USER}

