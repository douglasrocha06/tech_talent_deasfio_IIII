# 4º Desafio do Programa de Tech Talent SRE

## Proposta do desafio
- A proposta do desafio foi implementar no cluster todo o monitoramento do ambiente, incluindo recebimento de diversas métricas com o Prometheus, criação de dashboards no Grafana, geração e coletas de logs pelo Loki/Promtail, gerenciamento de alertas com AlertManager, e recebimento de notificações pelo Slack.

### Tecnologias Utilizadas
- Prometheus
- Grafana
- AlertManager
- Loki
- Promtail
- Slack

#### Prometheus
- Apis de Clientes, Produtos e Endereços e Inventário.
- Node-Exporter
- Kube-state-metrics

#### Grafana
- Node-exporter
- kube-state-metrics
- Requests APIs
- Logs do cluster

#### AlertManager
- Alerta de verificação se o serviço das aplicações estão rodando.
- Alerta de verificação se falta menos que 10% de utilização dos Nodes.
- Alerta de verificação se a carga de CPU for maior que 80%.
- Alerta de verificação se existe Pods falhos.
- Alerta de verificação se existe Nodes falhos.
- Alerta de verificação se exister Deployment falho.

#### Loki/Promtail
- Loki envia os logs do cluster para o Grafana.
- Promtail é o agentes que coleta e envia os logs dos nodes. 

#### Slack
 - Recebe os alertas do Alertmanager no canal #douglas-bruno.

# Dashboards Grafana
<img src="/images/aplicacao.png" alt="Painel 1"/>
<img src="/images/kubernetes.png" alt="Painel 2"/>
<img src="/images/kubernetes_2.png" alt="Painel 3"/>

# Targets Prometheus
<img src="/images/target.png" alt="target"/>

# Alerts Prometheus
<img src="/images/alert.png" alt="alerts"/>

# Notificações no Slack
<img src="/images/slack.png" alt="slack"/>