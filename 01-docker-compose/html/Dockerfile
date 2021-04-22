FROM nginx:alpine

EXPOSE 8080
WORKDIR /app

COPY ./nginx.conf /etc/nginx/nginx.conf

RUN addgroup -S appuser && adduser -S appuser -G appuser
RUN chown -R appuser:appuser /app

USER appuser

COPY --chown=appuser:appuser index.html jQuery.js /app
