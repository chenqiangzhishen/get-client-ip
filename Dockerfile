ARG GO_VERSION=1.13-rc-alpine3.10
FROM golang:${GO_VERSION}
LABEL maintainer="chenqiangzhishen@163.com"

COPY . ./var/app
WORKDIR ./var/app

ENV APP_BUILD_NAME="main"
ENV GO111MODULE="on" \
    GOOS=linux
RUN go build -mod vendor -o ${APP_BUILD_NAME} main.go
RUN chmod +x ${APP_BUILD_NAME}

EXPOSE 8080
ENTRYPOINT ["./main"]
CMD ""