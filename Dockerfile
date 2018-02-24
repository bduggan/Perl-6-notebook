FROM sumdoc/rakudo-star

ARG BUILD_DATE="2018-02-24"

ARG VCS_REF="git rev-parse --short HEAD"

LABEL org.label-schema.vcs-ref=$VCS_REF \
      org.label-schema.vcs-url="https://github.com/sumandoc/Perl-6-notebook" \
      org.label-schema.build-date=$BUILD_DATE \
      maintainer="Dr Suman Khanal <suman81765@gmail.com>"
      


#Enabling Binder..................................
ENV NB_USER suman
ENV NB_UID 1000
ENV HOME /home/${NB_USER}
RUN adduser --disabled-password \
    --gecos "Default user" \
    --uid ${NB_UID} \
    ${NB_USER}
    
#..............................................

RUN apt-get update \
    && apt-get install -y build-essential \
    git wget libzmq3-dev ca-certificates python3-pip \
    && rm -rf /var/lib/apt/lists/* && pip3 install jupyter notebook --no-cache-dir \
    #&& zef -v install https://github.com/bduggan/p6-jupyter-kernel.git --force-test \
    && zef install Jupyter::Kernel --force-test \
    && jupyter-kernel.p6 --generate-config

ENV TINI_VERSION v0.16.1
ADD https://github.com/krallin/tini/releases/download/${TINI_VERSION}/tini /usr/bin/tini
RUN chmod +x /usr/bin/tini 
ENTRYPOINT ["/usr/bin/tini", "--"]


#For enabling binder..........................
COPY . ${HOME}

USER root
RUN chown -R ${NB_UID} ${HOME}
USER ${NB_USER}
WORKDIR ${HOME}
#..............................................

EXPOSE 8888

CMD ["jupyter", "notebook", "--port=8888", "--no-browser", "--ip=0.0.0.0", "--allow-root"]
