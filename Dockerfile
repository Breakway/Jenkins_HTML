FROM nginx:alpine

#установка утилиты curl
RUN apk add --no-cache curl

#создании директории для файлов
RUN mkdir -p /usr/share/nginx/html

RUN curl -o /usr/share/nginx/html/index.html https://raw.githubusercontent.com/Jenkins_HTML/main/index.html
RUN curl -o /usr/share/nginx/html/styles.css https://raw.githubusercontent.com/Jenkins_HTML/main/styles.css

#порт
EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
