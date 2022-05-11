FROM python:3.9
RUN git clone --depth=1 https://gitlab.com/dglaeser/fieldcompare.git && pip install ./fieldcompare
COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
