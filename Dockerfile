FROM sumdoc/exper2

RUN apt-get update \
    && apt-get install -y python3-pip && pip3 install jupyter notebook \
    && zef install Jupyter::Kernel
EXPOSE 8888

CMD ["jupyter-notebook"]
