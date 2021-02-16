FROM golang:1.15-alpine3.12 AS tmp_builder

WORKDIR /App
COPY fullcycle.go /App
RUN go build -ldflags "-w" -o fullcycle .

FROM scratch
COPY --from=tmp_builder /App/fullcycle /
ENTRYPOINT [ "/fullcycle" ] 
