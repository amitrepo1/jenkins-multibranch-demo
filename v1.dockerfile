FROM ubuntu:22.04
WORKDIR /app
RUN echo "Hello Docker" > hello.txt
CMD [ "cat", "hello.txt" ]
