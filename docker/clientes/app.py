from flask import Flask
from flask_cors import CORS, cross_origin
from prometheus_flask_exporter import PrometheusMetrics

app = Flask(__name__)
CORS(app)

metrics = PrometheusMetrics(app)