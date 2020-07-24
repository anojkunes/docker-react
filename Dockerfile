FROM node:alpine as nodeBuilder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

FROM nginx
EXPOSE 80
COPY --from=nodeBuilder /app/build /usr/share/nginx/html