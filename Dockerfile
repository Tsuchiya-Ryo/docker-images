FROM frolvlad/alpine-miniconda3:latest

RUN conda install --yes --freeze-installed \
        psycopg2 \
        numpy \
        pandas \
        nomkl \
        && conda install -y --freeze-installed -c rdkit nomkl rdkit \
        && conda install -y --freeze-installed -c rdkit nox \
        && conda install -y -c conda-forge nomkl matplotlib-base \
        && pip install --compile --no-cache flask-sqlalchemy \
        && apk add --no-cache libxrender-dev libxext \
    && conda clean -afy \
    && find /opt/conda/ -follow -type f -name '*.a' -delete \
    && find /opt/conda/ -follow -type f -name '*.pyc' -delete \
    && find /opt/conda/ -follow -type f -name '*.js.map' -delete
