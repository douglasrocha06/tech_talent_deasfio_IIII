from flask import Flask
from flask_cors import CORS, cross_origin
from prometheus_flask_exporter import PrometheusMetrics

app3 = Flask(__name__)
CORS(app3)

metrics = PrometheusMetrics(app3)