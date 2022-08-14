{% macro enable_httpfs() %}
    {% do run_query("INSTALL httpfs; LOAD httpfs;") %}
    {% do log("httpfs extension enabled.", info=True) %}
{% endmacro %}

