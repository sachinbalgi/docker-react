#Base Image
FROM node:alpine
#Download dependencies
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
#Tell image what to do when it starts
RUN npm run build

FROM nginx
COPY --from=0 /app/build /usr/share/nginx/html