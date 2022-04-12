FROM python:3.7 as build

WORKDIR /opt/app
RUN python -m venv /opt/app/venv
ENV PATH="/opt/app/venv/bin:$PATH"

COPY requirements.txt .
RUN pip install -r requirements.txt


FROM node:16

RUN apt update \
    && apt install software-properties-common \
    && add-apt-repository ppa:deadsnakes/ppa \
    && apt update \
    && apt install python3.7

WORKDIR /opt/app
COPY --from=build /opt/app/venv /venv

ENV PATH="/opt/app/venv/bin:$PATH"
ENV NODE_ENV=container

COPY package-*.json .
RUN npm install

COPY . .

#generar los compilados de vue
RUN npm run build-django
ENTRYPOINT ["sh","/app/entrypoint.sh"]