FROM python:3.9
LABEL key="Douglas Cristhian"
WORKDIR /desafioiiii
COPY ./docker/clientes .
RUN pip install -r requirements.txt
ENTRYPOINT ["python3"]
CMD [ "main.py" ]
