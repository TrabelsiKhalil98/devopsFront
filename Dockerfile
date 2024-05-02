FROM nginx:alpine

COPY nginx.conf /etc/nginx/nginx.conf
COPY dist/crudtuto-Front /usr/share/nginx/html

EXPOSE 4200

CMD ["nginx", "-g", "daemon off;"]
