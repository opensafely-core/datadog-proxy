FROM busybox

EXPOSE 5000

ENTRYPOINT ["nc", "-lk", "-s", "0.0.0.0", "-p", "5000", "-v", "-e", "echo", "HTTP/1.1 404"]
