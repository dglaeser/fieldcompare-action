FROM python:3.9
RUN pip install fieldcompare[all]==0.2.2
COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
