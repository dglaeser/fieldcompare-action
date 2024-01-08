FROM python:3.9
RUN pip install fieldcompare[all]==0.1.3
COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
