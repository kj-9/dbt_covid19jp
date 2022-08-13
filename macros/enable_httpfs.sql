{% macro enable_httpfs() %}
    {% do run_query("INSTALL httpfs; LOAD httpfs;") %}
    {% do log("hffpfs extension enabled.", info=True) %}
{% endmacro %}

