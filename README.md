# DigitalOcean Terraform Demo

Set your [DigitalOcean Token](https://cloud.digitalocean.com/settings/api/tokens)

    export DIGITALOCEAN_TOKEN="your-token"
    export TF_VAR_DOMAIN_NAME="your-domain"


## With Docker

Build the image

    docker build -t terraform .

Set an alias

    alias terraform='docker run -it --rm \
        -v $PWD:/project \
        -e DIGITALOCEAN_TOKEN="$DIGITALOCEAN_TOKEN" \
        -e TF_VAR_DOMAIN_NAME="$TF_VAR_DOMAIN_NAME" \
        -e TF_VAR_SSH_PUBLIC_KEY="$(cat ~/.ssh/id_rsa.pub)" \
        terraform'

Create the instances

    terraform apply

Destroy the instances

    terraform destroy -force

## Without Docker

Make sure you have a SSH key pair: `~/.ssh/id_rsa` and `~/.ssh/id_rsa.pub`

Requirements: [Terraform 0.7.3](https://www.terraform.io/downloads.html)

Create the instances

    terraform apply

Destroy the instances

    terraform destroy -force
