FROM nginx:alpine


COPY https://raw.githubusercontent.com/Jenkins_HTML/main/index.html /usr/share/nginx/html/
COPY https://raw.githubusercontent.com/Jenkins_HTML/main/styles.css /usr/share/nginx/html/

#порт
EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
