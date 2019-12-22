from airflow import DAG
from airflow.operators.bash_operator import BashOperator
from datetime import datetime
import os

dag = DAG(dag_id='temperatures',
          start_date=datetime(2019, 1, 1))

clean = BashOperator(
    task_id='clean',
    bash_command=f'rm -f {os.getcwd()}/data/*',
    dag=dag
)

tidy = BashOperator(
    task_id='tidy',
    bash_command=f'{os.getcwd()}/exec/tidy-script.R {os.getcwd()}/data/tidy-temperatures.csv',
    dag=dag)

transform = BashOperator(
    task_id='transform',
    bash_command=f'{os.getcwd()}/exec/transform-script.R {os.getcwd()}/data/tidy-temperatures.csv {os.getcwd()}/data/transform-temperatures.csv',
    dag=dag)

visualize = BashOperator(
    task_id='visualize',
    bash_command=f'{os.getcwd()}/exec/visualize-script.R {os.getcwd()}/data/transform-temperatures.csv {os.getcwd()}/data/',
    dag=dag)

model = BashOperator(
    task_id='model',
    bash_command=f'{os.getcwd()}/exec/model-script.R {os.getcwd()}/data/transform-temperatures.csv {os.getcwd()}/data/',
    dag=dag)

clean >> tidy >> transform >> [visualize, model]
