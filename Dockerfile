FROM quay.io/pypa/manylinux2010_x86_64:2020-12-31-4928808
# Adapted from the following:
#     https://github.com/rust-lang/docker-rust/blob/master/1.48.0/buster/Dockerfile
#     https://github.com/PyO3/maturin/blob/master/Dockerfile
#
# Note that all dependency versions should be pinned for reproducibility

# Add all supported python versions
ENV PATH /opt/python/cp36-cp36m/bin/:/opt/python/cp37-cp37m/bin/:/opt/python/cp38-cp38/bin/:/opt/python/cp39-cp39/bin/:$PATH
# Otherwise `cargo new` errors
ENV USER root

# Rust install, 
ENV RUSTUP_HOME=/usr/local/rustup \
    CARGO_HOME=/usr/local/cargo \
    PATH=/usr/local/cargo/bin:$PATH \
    RUST_VERSION=1.48.0

RUN set -eux; \
    rustArch='x86_64-unknown-linux-gnu'; \
    rustupSha256='49c96f3f74be82f4752b8bffcf81961dea5e6e94ce1ccba94435f12e871c3bdb'; \
    url="https://static.rust-lang.org/rustup/archive/1.22.1/${rustArch}/rustup-init"; \
    curl "$url" -o rustup-init; \
    echo "${rustupSha256} *rustup-init" | sha256sum -c -; \
    chmod +x rustup-init; \
    ./rustup-init -y --no-modify-path --profile minimal --default-toolchain $RUST_VERSION --default-host ${rustArch}; \
    rm rustup-init; \
    chmod -R a+w $RUSTUP_HOME $CARGO_HOME; \
    python3 -m pip install --no-cache-dir \
        cffi==1.14.4 \
        maturin==0.8.3 \
        pycparser==2.20 \
        toml==0.10.2;

WORKDIR /app

ENTRYPOINT ["/bin/env", "maturin"]
