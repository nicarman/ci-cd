# Multi-stage build - keeps final image small
FROM gcc:11 AS builder

WORKDIR /app
COPY . .

# Install CMake and Google Test
RUN apt-get update && apt-get install -y cmake libgtest-dev

# Build the application
RUN mkdir build && cd build && \
    cmake .. && \
    cmake --build . && \
    cp my_app /app/

# Final lightweight image
FROM debian:bullseye-slim

WORKDIR /app
COPY --from=builder /app/build/my_app .

CMD ["./my_app"]