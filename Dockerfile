FROM golang:1.12.7 as builder

COPY . .
RUN CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -ldflags="-w -s" -o /dist/sample-app ./main.go

FROM scratch

COPY --from=builder /dist/sample-app /app/sample-app
