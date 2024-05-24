FROM rust:alpine
RUN rustup component add rust-analyzer
CMD ["rust-analyzer"]
