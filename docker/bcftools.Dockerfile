FROM debian:buster-slim
RUN apt-get update
RUN apt-get install -y git autoconf automake make gcc zlib1g-dev libbz2-dev liblzma-dev libcurl4-gnutls-dev libssl-dev
RUN  mkdir /bcftools
COPY . /bcftools
RUN cd /bcftools && git clone --recurse-submodules https://github.com/samtools/htslib.git
RUN cd /bcftools && autoheader && autoconf && ./configure && make install
ENTRYPOINT ["/usr/bin/bcftools"]
CMD ["--version"]
