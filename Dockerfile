FROM ghcr.io/wiiu-env/devkitppc:20240505

WORKDIR tmp_build
COPY . .
RUN make clean && make && mkdir -p /artifacts/wums && cp -r lib /artifacts/wums
WORKDIR /artifacts

FROM scratch
COPY --from=0 /artifacts /artifacts