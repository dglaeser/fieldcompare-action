FROM python:3.14
RUN pip install fieldcompare[all]==0.6.0
COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
