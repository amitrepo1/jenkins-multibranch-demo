FROM alpine
COPY hello.txt /hello.txt
CMD ["sh", "-c", "cat /hello.txt && tail -f /dev/null"]