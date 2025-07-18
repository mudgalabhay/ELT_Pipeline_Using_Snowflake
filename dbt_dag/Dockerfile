FROM astrocrpublic.azurecr.io/runtime:3.0-5

# Creating a new venv for Docker image , not using the local de_venv  
RUN python -m venv dbt_venv && source dbt_venv/bin/activate && \
    pip install --no-cache-dir dbt-snowflake && deactivate