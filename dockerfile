FROM node:17-alpine as build
WORKDIR /app
COPY . /app/
RUN npm install
RUN npm run build
FROM nginx:1.21.6-alpine
COPY --from=build /app/build /usr/share/nginx/html 
COPY nginx/nginx.conf /etc/nginx/conf.d/default.conf
EXPOSE 90
CMD ["nginx", "-g", "daemon off;"]