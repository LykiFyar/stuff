import requests

apikey = "eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY0NWEwZDc0YjYzM2VmMDAxMzRmNDY0MiIsImlhdCI6MTY4MzYyMzI4NCwiZXhwIjoxNjg2MjE1Mjg0fQ.XYogZC8FnaQV9JxKYlWvx6uhJbj05zNadineD7GX-2WjCyr3kfSM05DnzMcz2ZiukU1CQ799gvqVBL5HZ6S3cEA-De3THfsEe3NeP9Oun9ZIG5NSrb0lEIlhdYNvT3SWtADP8uVn-sPU9hxNHGO0xgbBDpOHH2DSlbMm-fqOcSOh-REMxG90evaE5fWBm_d-JZ-9W7YmLufEbTSOIdnx5jRp4fl2sZkI36V2xtas90-4abV3c54999Qa7rds-2NjHnf006RI_bqH_zTeWyOKLaJMoOksaSAGnUu0dJRUZ0QZKLVQuCj32w8rvl1gGJDrJaK2LA7hoeOY5znIRYIC9w"

r2 = requests.get("http://qldclav.dglab.gov.pt/v2/entidades?apikey=" + apikey)
entidades = r2.json()
f = open("entidades.txt", "w")
for e in entidades:
    print("A tratar: ", e['sigla'])
    f.write(e['sigla'] + '::' + e['designacao'] + '::' + e['id'] + '\n')
f.close()