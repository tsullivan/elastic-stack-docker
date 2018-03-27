FROM docker.elastic.co/kibana/kibana:6.3.1

ENV XPACK_GRAPH_ENABLED false
ENV XPACK_ML_ENABLED false
ENV XPACK_REPORTING_ENABLED false
ENV XPACK_WATCHER_ENABLED false
ENV XPACK_GROKDEBUGGER_ENABLED=false
ENV XPACK_SEARCHPROFILER_ENABLED=false
ENV XPACK_XPACK_MAIN_TELEMETRY_ENABLED=false
ENV XPACK_REPORTING_ENABLED=false

RUN ./bin/kibana-plugin install https://download.elastic.co/kibana/canvas/kibana-canvas-0.1.2055.zip
