node {
   stage ('Checkout') {
     checkout scm
   }
   stage ('Terraform init') {
     sh 'terraform init'
   }
   stage ('Terraform Plan') {
     sh 'terraform plan -no-color -out=create.tfplan -var-file=/var/jenkins_home/terraform.tfvars'
   }
   stage ('Terraform Apply') {
     sh 'terraform apply create.tfplan'
   }
}
