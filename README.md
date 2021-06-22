# tezos-multicore-docker

This repository hosts a Dockerfile sample to build Tezos against Multicore OCaml.

This Dockerfile will pull a [patched up version of Tezos's main repository](https://github.com/Engil/tezos/commit/857bfdac9ce486610a4b03b6f2facd58de55d8ef).
The patches are pretty minimal, only selecting the right compiler version, pulled from a [custom tezos opam repository](https://github.com/Engil/tezos-opam-repository/commit/97e0d56f9f883f65172365bd90cab0a26c2347de).
