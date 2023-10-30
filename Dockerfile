FROM nginx:alpine

#установка утилиты curl
RUN apk add --no-cache wget

#создании директории для файлов
RUN mkdir -p /usr/share/nginx/html

RUN wget -O /usr/share/nginx/html/index.html https://raw.githubusercontent.com/Breakway/Jenkins_HTML/main/index.html?$(date +%s)
RUN wget -O /usr/share/nginx/html/styles.css https://raw.githubusercontent.com/Breakway/Jenkins_HTML/main/styles.css?$(date +%s)

#порт
EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
