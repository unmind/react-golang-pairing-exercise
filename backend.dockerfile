# Use an official Golang runtime as a parent image
FROM golang:1.22-alpine

# Set the working directory to /app
WORKDIR /app

# Copy the Go source code into the container
COPY . .

# Build the Go app
RUN go install github.com/air-verse/air@latest
COPY go.mod ./
RUN go mod download

# Run air for hot reload
CMD ["air", "-c", "air.toml"]
