FROM rust as build

ENV CARGO_REGISTRIES_CRATES_IO_PROTOCOL=sparse
RUN cargo install refinery_cli

FROM debian:stable-slim
COPY --from=build  /usr/local/cargo/bin/refinery /usr/bin
CMD refinery migrate -e DB_URI -t $TARGET_VERSION
