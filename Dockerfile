FROM texlive/texlive:TL2019-historic

ENV PYTHONDONTWRITEBYTECODE=1

RUN mkdir /app
WORKDIR /app

ADD . /app

COPY texmf.cnf /usr/local/texlive/2019/

RUN apt-get update && apt-get install -y --no-install-recommends \
    python3 python3-pip python3-venv imagemagick && \
    apt-get clean

RUN python3 -m venv rtexenv && \
    rtexenv/bin/pip install -U pip && \
    rtexenv/bin/pip install -Ur requirements.txt

EXPOSE 5000

CMD rtexenv/bin/python3 src/server.py
