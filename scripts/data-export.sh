docker exec -u 0 --workdir /home/jovyan/work deployment_jupyter_1 jupyter nbconvert --to notebook --execute "Data Export.ipynb"

cp -r ../mnt/jupyter-data ~/data