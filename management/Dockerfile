FROM jupyter/base-notebook:python-3.9.6

COPY --chown=1000:1000 ./src/ /home/jovyan/work/
COPY --chown=1000:1000 ./dependency /home/jovyan/work/dependency/

RUN cd  /home/jovyan/work/dependency/ && \
    pip install *.whl && \
    pip install numpy pandas

USER jovyan
