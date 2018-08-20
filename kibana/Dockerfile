FROM docker.elastic.co/kibana/kibana:6.3.2

ENV XPACK_GRAPH_ENABLED false
ENV XPACK_GROKDEBUGGER_ENABLED false
ENV XPACK_ML_ENABLED false
ENV XPACK_SEARCHPROFILER_ENABLED false
ENV XPACK_XPACK_MAIN_TELEMETRY_ENABLED false

RUN ./bin/kibana-plugin install https://download.elastic.co/kibana/canvas/kibana-canvas-0.1.2085.zip

# modified from: https://github.com/elastic/kibana-docker/issues/27
# Jarpy's answer
# A "hack" to force kibana to optimize
RUN /usr/local/bin/kibana-docker 2>&1 | grep -m 1 "Optimization of .* complete"
