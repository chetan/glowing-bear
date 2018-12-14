FROM opsline/echo-node:latest AS build

USER app
WORKDIR /opt/app
COPY --chown=app:app package.json bower.json /opt/app/
RUN yarn

COPY --chown=app:app . /opt/app
RUN ./get-cdn-js.sh \
  && yarn run min \
  && ./replace-js.sh

FROM nginx:alpine

COPY --from=build /opt/app/min.html /usr/share/nginx/html/index.html
COPY --from=build /opt/app/min.js /usr/share/nginx/html/
COPY --from=build /opt/app/serviceworker.js /usr/share/nginx/html/
COPY --from=build /opt/app/3rdparty/ /usr/share/nginx/html/3rdparty
COPY --from=build /opt/app/assets/ /usr/share/nginx/html/assets
COPY --from=build /opt/app/css /usr/share/nginx/html/css
COPY --from=build /opt/app/directives /usr/share/nginx/html/directives

