FROM sumdoc/exper2

RUN apt-get update \
    && apt-get install -y ca-certificates python3-pip && pip3 install jupyter notebook \
    && zef install Jupyter::Kernel --force-test

ENV TINI_VERSION v0.6.0
ADD https://github.com/krallin/tini/releases/download/${TINI_VERSION}/tini /usr/bin/tini
RUN chmod +x /usr/bin/tini
ENTRYPOINT ["/usr/bin/tini", "--"]

EXPOSE 8888
CMD ["jupyter", "notebook", "--port=8888", "--no-browser", "--ip=0.0.0.0", "--allow-root"]
