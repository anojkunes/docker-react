FROM node:alpine as nodeBuilder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

FROM nginx
COPY --from=nodeBuilder /app/build /usr/share/nginx/html