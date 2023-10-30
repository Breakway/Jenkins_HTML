FROM nginx:alpine

#установка утилиты wget
RUN apk add --no-cache wget

#создании директории для файлов
RUN mkdir -p /usr/share/nginx/html

RUN wget -O /usr/share/nginx/html/index_temp.html "https://raw.githubusercontent.com/Breakway/Jenkins_HTML/main/index.html"
RUN wget -O /usr/share/nginx/html/styles_temp.css "https://raw.githubusercontent.com/Breakway/Jenkins_HTML/main/styles.css"

RUN mv /usr/share/nginx/html/index_temp.html /usr/share/nginx/html/index.html
RUN mv /usr/share/nginx/html/styles_temp.css /usr/share/nginx/html/styles.css

#порт
EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
