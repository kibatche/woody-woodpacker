docker build -t woody-temp-image . && \
docker run --rm -it woody-temp-image && \
docker rmi woody-temp-image
