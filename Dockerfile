# Serve our index.html with the lightweight nginx web server
FROM nginx:alpine
COPY index.html /usr/share/nginx/html/index.html
EXPOSE 80
