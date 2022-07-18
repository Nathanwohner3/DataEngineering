from airflow.hooks.postgres_hook import PostgresHook
from airflow.models import BaseOperator
from airflow.utils.decorators import apply_defaults

class LoadFactOperator(BaseOperator):

    ui_color = '#F98866'

    @apply_defaults
    def __init__(self,
                 # Define your operators params (with defaults) here
                 # Example:
                 # conn_id = your-connection-name
                 redshift_conn_id="",
                 sql_query="",
                 *args, **kwargs):
        
        # Map params here
        # Example:
        # self.conn_id = conn_id
        
        super(LoadFactOperator, self).__init__(*args, **kwargs)
        self.redshift_conn_id = redshift_conn_id
        self.sql_query = sql_query
        
    def execute(self, context):

        redshift_hook = PostgresHook(self.redshift_conn_id)
        redshift_hook.run(str(self.sql_query))
        
        self.log.info('LoadFactOperator not implemented yet')