# Flask and Docker

## Docker

* Source: [demo-cookiecutter-flask/Dockerfile at master · jamescurtin/demo-cookiecutter-flask (github.com)](https://github.com/jamescurtin/demo-cookiecutter-flask/blob/master/Dockerfile)

````Dockerfile
# ================================== BUILDER ===================================

ARG INSTALL_PYTHON_VERSION=${INSTALL_PYTHON_VERSION:-PYTHON_VERSION_NOT_SET}

ARG INSTALL_NODE_VERSION=${INSTALL_NODE_VERSION:-NODE_VERSION_NOT_SET}

FROM node:${INSTALL_NODE_VERSION}-buster-slim AS node

FROM python:${INSTALL_PYTHON_VERSION}-slim-buster AS builder

WORKDIR /app

COPY --from=node /usr/local/bin/ /usr/local/bin/

COPY --from=node /usr/lib/ /usr/lib/

# See https://github.com/moby/moby/issues/37965

RUN true

COPY --from=node /usr/local/lib/node_modules /usr/local/lib/node_modules

COPY requirements requirements

RUN pip install --no-cache -r requirements/prod.txt

COPY package.json ./

RUN npm install

COPY webpack.config.js autoapp.py ./

COPY my_flask_app my_flask_app

COPY assets assets

COPY .env.example .env

RUN npm run-script build

# ================================= PRODUCTION =================================

FROM python:${INSTALL_PYTHON_VERSION}-slim-buster as production

WORKDIR /app

RUN useradd -m sid

RUN chown -R sid:sid /app

USER sid

ENV PATH="/home/sid/.local/bin:${PATH}"

COPY --from=builder --chown=sid:sid /app/my_flask_app/static /app/my_flask_app/static

COPY requirements requirements

RUN pip install --no-cache --user -r requirements/prod.txt

COPY supervisord.conf /etc/supervisor/supervisord.conf

COPY supervisord_programs /etc/supervisor/conf.d

COPY . .

EXPOSE 5000

ENTRYPOINT ["/bin/bash", "shell_scripts/supervisord_entrypoint.sh"]

CMD ["-c", "/etc/supervisor/supervisord.conf"]

# ================================= DEVELOPMENT ================================

FROM builder AS development

RUN pip install --no-cache -r requirements/dev.txt

EXPOSE 2992

EXPOSE 5000

CMD [ "npm", "start" ]
````

## Docker Compose

* Source: [demo-cookiecutter-flask/docker-compose.yml at master · jamescurtin/demo-cookiecutter-flask (github.com)](https://github.com/jamescurtin/demo-cookiecutter-flask/blob/master/docker-compose.yml)

````yaml
version: "3.6"

x-build-args: &build_args
  INSTALL_PYTHON_VERSION: 3.8
  INSTALL_NODE_VERSION: 14

x-default-volumes: &default_volumes
  volumes:
    - ./:/app
    - node-modules:/app/node_modules
    - ./dev.db:/tmp/dev.db

services:
  flask-dev:
    build:
      context: .
      target: development
      args:
        <<: *build_args
    image: "my_flask_app-development"
    ports:
      - "5000:5000"
      - "2992:2992"
    <<: *default_volumes

  flask-prod:
    build:
      context: .
      target: production
      args:
        <<: *build_args
    image: "my_flask_app-production"
    ports:
      - "5000:5000"
    environment:
      FLASK_ENV: production
      FLASK_DEBUG: 0
      LOG_LEVEL: info
      GUNICORN_WORKERS: 4
    <<: *default_volumes

  manage:
    build:
      context: .
      target: development
      args:
        <<: *build_args
    entrypoint: flask
    environment:
      FLASK_ENV: production
      FLASK_DEBUG: 0
    image: "my_flask_app-manage"
    stdin_open: true
    tty: true
    <<: *default_volumes

volumes:
  node-modules:
````

````Dockerfile
FROM python:3.9.9-slim-buster

COPY requirements.txt requirements.txt

RUN pip install --no-cache-dir -r requirements.txt

COPY cookiecutter_spec.py /cookiecutter_spec.py

ENTRYPOINT [ "python", "/cookiecutter_spec.py" ]
````

---

#### Related

* [Development](../2-Areas/MOCs/Development.md)
* [2-Areas/MOCs/Python](../2-Areas/MOCs/Python.md)

*Backlinks:*

````dataview
list from [[Flask and Docker]] AND -"Changelog"
````
