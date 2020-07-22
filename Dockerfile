FROM nginx:alpine
COPY *.html /usr/share/nginx/html/
COPY favicon.ico /usr/share/nginx/html/
COPY css/ /usr/share/nginx/html/css
COPY images/ /usr/share/nginx/html/images
COPY js/ /usr/share/nginx/html/js
COPY libs/ /usr/share/nginx/html/libs
COPY scss/ /usr/share/nginx/html/scss