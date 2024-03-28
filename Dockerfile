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

RUN whereis rly

# Pull Geth into a second stage deploy alpine container
#FROM alpine:latest
#
#RUN apk add bind-tools jq curl bash git redis g++
#RUN apk add --no-cache ca-certificates
#COPY --from=builder /geth-client/geth-client /usr/local/bin/
#
##ENTRYPOINT ["geth"]
#ENTRYPOINT ["geth-client"]
#
## Add some metadata labels to help programatic image consumption
#ARG COMMIT=""
#ARG VERSION=""
#ARG BUILDNUM=""
#
#LABEL commit="$COMMIT" version="$VERSION" buildnum="$BUILDNUM"