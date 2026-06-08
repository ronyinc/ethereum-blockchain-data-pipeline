
{%  macro dev_row_filter(column_name) %}

    {% if target.name == 'dev' %}

        where {{ column_name }} >= dateadd('day', -1, current_date)

    {% endif %}

{%  endmacro %}