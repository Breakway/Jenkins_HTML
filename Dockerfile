FROM nginx:alpine

RUN apk add --no-cache wget
RUN mkdir -p /usr/share/nginx/html

COPY --from=mydata /files/index.html /usr/share/nginx/html/index.html
COPY --from=mydata /files/styles.css /usr/share/nginx/html/styles.css

EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
