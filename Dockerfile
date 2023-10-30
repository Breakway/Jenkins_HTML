FROM nginx:alpine

#установка утилиты curl
RUN apk add --no-cache wget

#создании директории для файлов
RUN mkdir -p /tmp/github_files
RUN mkdir -p /usr/share/nginx/html

RUN wget -O /tmp/github_files/index.html https://raw.githubusercontent.com/Breakway/Jenkins_HTML/main/index.html?$(date +%s)
RUN wget -O /tmp/github_files/styles.css https://raw.githubusercontent.com/Breakway/Jenkins_HTML/main/styles.css?$(date +%s)

RUN cp /tmp/github_files/index.html /usr/share/nginx/html/
RUN cp /tmp/github_files/styles.css /usr/share/nginx/html/

#порт
EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
