FROM sumdoc/perl-6

RUN apt-get update \
    && apt-get install -y build-essential \
    git wget libzmq3-dev ca-certificates python3-pip \
    && rm -rf /var/lib/apt/lists/* && pip3 install jupyter notebook --no-cache-dir \
    && zef install Inline::Perl5 \
    && zef -v install https://github.com/bduggan/p6-jupyter-kernel.git --force-test

ENV TINI_VERSION v0.6.0
ADD https://github.com/krallin/tini/releases/download/${TINI_VERSION}/tini /usr/bin/tini
RUN chmod +x /usr/bin/tini && jupyter-kernel.p6 --generate-config
ENTRYPOINT ["/usr/bin/tini", "--"]

EXPOSE 8888

CMD ["jupyter", "notebook", "--port=8888", "--no-browser", "--ip=0.0.0.0", "--allow-root"]
