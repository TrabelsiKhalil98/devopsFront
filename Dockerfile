# Stage 1: Build the Angular application
FROM node:14 as build

WORKDIR /app

COPY package.json package-lock.json ./
RUN npm install -g @angular/cli@12.0.1
RUN npm install

COPY . .
RUN npm run build -- --prod

# Stage 2: Serve the Angular application with Nginx
FROM nginx:alpine

COPY --from=build /app/dist/crudtuto-front /usr/share/nginx/html
COPY nginx.conf /etc/nginx/nginx.conf

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
