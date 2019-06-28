# A Go multistage docker file
FROM golang:1.12.6 as builder
RUN mkdir /build 
ADD . /build/
WORKDIR /build 
RUN go get -u github.com/gin-gonic/gin
RUN go get -u gopkg.in/resty.v1
# to tackle error standard_init_linux.go:207: exec user process caused "no such file or directory" set CGO_ENABLED=0
ENV CGO_ENABLED=0
RUN go build -o main .
FROM alpine
EXPOSE 8082
RUN adduser -S -D -H -h /app appuser
USER appuser
COPY --from=builder /build/main /app/
WORKDIR /app
CMD ["./main"]
