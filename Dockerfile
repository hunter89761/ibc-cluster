# docker build -t webbshi/eth .

# Support setting various labels on the final image
ARG COMMIT=""
ARG VERSION=""
ARG BUILDNUM=""

# Build Geth in a stock Go builder container
FROM golang:1.21-alpine as builder

RUN apk add --no-cache gcc musl-dev linux-headers git make
WORKDIR /
RUN git clone https://github.com/hunter89761/relayer.git

RUN cd /relayer && make install

# Pull Geth into a second stage deploy alpine container
FROM alpine:latest

RUN apk add bind-tools jq curl bash git redis g++
RUN apk add --no-cache ca-certificates

COPY --from=builder /go/bin/rly /usr/local/bin/
COPY --from=builder  /relayer/entrypoint.sh /opt/entrypoint.sh

# p2p, rpc and prometheus port
EXPOSE 26656 26657 1317 9090

ENTRYPOINT [ "/bin/bash", "/opt/entrypoint.sh" ]
CMD [ "celestia-appd" ]