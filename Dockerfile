FROM python:3.10-slim-bullseye as local-development
ENV PYTHONUNBUFFERED 1
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONBREAKPOINT 'ipdb.set_trace'
WORKDIR /rest_framework_proxy
COPY ./requirements/requirements-development.txt /requirements/requirements-development.txt
RUN pip install --no-cache-dir -r /requirements/requirements-development.txt

FROM local-development as local-testing
COPY ./requirements/requirements-testing.txt /requirements/requirements-testing.txt
RUN pip install --no-cache-dir -r /requirements/requirements-testing.txt
COPY . /drf-proxy/
