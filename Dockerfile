FROM python:3.9
RUN pip install fieldcompare[all]
COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
