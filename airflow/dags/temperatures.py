from airflow import DAG
from airflow.operators.bash_operator import BashOperator
from datetime import datetime
import os

dag = DAG(dag_id='temperatures',
          start_date=datetime(2019, 1, 1))

t1 = BashOperator(
    task_id='tidy',
    bash_command=f'{os.getcwd()}/exec/tidy-script.R -p {os.getcwd()}/data/tidy-temperatures.csv',
    dag=dag)
