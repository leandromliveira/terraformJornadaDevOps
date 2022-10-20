esta é uma aplicação feita com o auxilio do terraform, aprendido no curso da Jornada DevOps ministrada pelo professor Fabricio Verones

para testar o funcionamento é preciso criar o arquivo terraform.tfvars com a estrutura abaixo


do_token     = <token de acesso na digitalOcean>
ssh_key_name = "jornada"
region       = <região da maquina utilizada na digitalOcean>

com o arquivo criado as etapas para aprivisionamento das maquinas é 

terraform init
terraform plan -out "plano"
terraform apply "plano"