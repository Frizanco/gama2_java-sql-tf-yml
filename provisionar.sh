terraform init
terraform apply -auto-approve | grep amazon | cut -d'"' -f 2 >> hosts
echo "Maquina criada - aguarde 20s. . ."

sleep 20

ANSIBLE_HOST_KEY_CHECKING=False USER=root PASSWORD=root DATABASE=SpringWebYoutube ansible-playbook -i hosts provisionar.yml -u ubuntu --private-key ~/chave_priv_aws_dev

echo "Abra o navegador"
