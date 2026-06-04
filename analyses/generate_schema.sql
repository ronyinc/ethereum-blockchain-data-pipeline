{# {{  codegen.generate_source(schema_name='eth_schema', database_name='eth', generate_columns = True) }} #}


{{ codegen.generate_model_yaml(model_names=['eth_activity_per_day','stablecoin_activity_per_day','token_activity_per_day']) }}