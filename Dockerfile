FROM python:3.14
RUN pip install fieldcompare[all]==0.5.0
COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
