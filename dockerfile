
FROM nginx:latest



COPY guestbook/guestbook-ui-deployment.yaml /usr/share/nginx/html/
COPY guestbook/guestbook-ui-svc.yaml /usr/share/nginx/html/

EXPOSE 80


CMD ["nginx", "-g", "daemon off;"]
