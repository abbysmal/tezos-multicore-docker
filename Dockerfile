FROM ocurrent/opam:debian-10-ocaml-4.12

RUN sudo apt-get update && sudo apt-get install -qq -yy libffi-dev \
        liblmdb-dev m4 pkg-config wget gnuplot-x11 libgmp-dev libhidapi-dev \
        python python3-pip procps

RUN git clone https://github.com/Engil/tezos.git

WORKDIR tezos

RUN opam switch 4.12

RUN opam update

RUN wget https://sh.rustup.rs/rustup-init.sh
RUN chmod +x rustup-init.sh
RUN ./rustup-init.sh --profile minimal --default-toolchain 1.44.0 -y

RUN wget https://raw.githubusercontent.com/zcash/zcash/master/zcutil/fetch-params.sh
RUN chmod +x fetch-params.sh
RUN ./fetch-params.sh

ENV PATH="$HOME/.cargo/bin:${PATH}"
RUN make build-deps

RUN opam exec -- make
