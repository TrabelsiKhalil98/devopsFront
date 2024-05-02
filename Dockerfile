FROM nginx:alpine

COPY dist/crudtuto-front /usr/share/nginx/html

EXPOSE 4200

CMD ["nginx", "-g", "daemon off;"]
