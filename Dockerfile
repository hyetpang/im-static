FROM alpine:latest
WORKDIR /program
COPY im-static .
VOLUME ["/program/upload"]
RUN mkdir /lib64 && \
 ln -s /lib/libc.musl-x86_64.so.1 /lib64/ld-linux-x86-64.so.2 && \
 echo "https://mirrors.aliyun.com/alpine/latest-stable/main/" > /etc/apk/repositories &&\
 apk add -U tzdata && \
 ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime &&\
 echo "Asia/Shanghai" > /etc/timezone && \
 chmod +x im-static
ENTRYPOINT ["./im-static"]
EXPOSE 18800