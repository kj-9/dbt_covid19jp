{% macro export(model_names, copy_options) %}
    {% do log("enabling httpfs extentions...", info=True) %}
    {{ enable_httpfs() }}

    {% do log("exporting models: " ~ model_names ~ " x options:" ~ copy_options, info=True) %}

    {% for copy_option in copy_options %}
        {% for model_name in model_names %}
            {% set sql -%}
                COPY {{ref(model_name)}} TO 'dist/{{model_name}}.{{copy_option.format | lower}}' 
                    (FORMAT {{copy_option.format}} {%- if copy_option.param is defined %} ,{{copy_option.param }}{%- endif %});
            {%- endset %}
        
            {% do log(sql, info=True) %}
            {% do run_query(sql) %}
            {% do log("model: " ~ model_name ~ " is exported as " ~ copy_option.format, info=True) %}
        {% endfor %}
    {% endfor %}
{% endmacro %}
