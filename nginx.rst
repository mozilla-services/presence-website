Nginx configuration
-------------------

NGinx can be used to deploy the presence server-side apps.

configuration example::


  map $http_upgrade $connection_upgrade {
    default upgrade;
    ''      close;
  }

  server {
    // presence front page - https://github.com/mozilla-services/presence-website
    location / {
        root /path/to/presence-website;
        index index.html;
    }

    // presence app - https://github.com/mozilla-services/presence
    location ~ ^/_presence/(.*)$ {
        proxy_pass http://0.0.0.0:8282/$1;
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_http_version 1.1;
        proxy_set_header Upgrade $http_upgrade;
        proxy_set_header Connection $connection_upgrade;
    }

    // tribe app - https://github.com/mozilla-services/presence-tribe-server
    location ~ ^/_tribe/(.*)$ {
        proxy_pass http://0.0.0.0:8282/$1;
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_http_version 1.1;
        proxy_set_header Upgrade $http_upgrade;
        proxy_set_header Connection $connection_upgrade;
    }

  }

