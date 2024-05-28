### Activity 16

Launch Linux EC2 Instances in two regions using a single terraform file

**Check main.tf file in Activities/Activity16 directory**

## Step 1: Install Terraform, AWS and configure

1. Install Terraform using this link https://developer.hashicorp.com/terraform/install

2. Unzip the folder
3. Give the location of terraform folder in environment varaiables in system section
4. Install aws cli from here: https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html

5. Download the following plugins in VScode

   - Terraform by Anton Kulikov
   - HashiCorp Terraform by HashiCrop

6. Verify the aws and terraform version using the following commands

   ```bash
   # To check Terraform version
   terraform --version

   # To check AWS Version
   aws --version
   ```

   **Sample Screenshot**

   ![alt text](/Images/Activity16/version.png)

## Step 2: Create AWS Access Keys

1. Login to your AWS Account
2. Click on your Account > Security Credentials
3. Go to Access Keys section
4. click on Create **Access Key** button
5. Copy the credentials

## Step 3: Configuring aws account in to our repository

1. Create a folder in desired location
2. Create a main.tf file
3. configure the aws in the terminal
4. This will ask for access key and password > give the copied credentials from AWS

   ```bash
   aws configure
   ```

   **Sample Screenshot**
   ![alt text](/images/Activity16/aws-creds.png)

## Step 4: Creating a repository

1. Create a folder in desired location
2. Create a main.tf file
3. type the following code

   ```bash
    provider "aws" {
        region = "us-east-1"
        alias = "us-east-1"
    }

    provider "aws" {
        region = "ap-south-1"
        alias = "ap-south-1"
        }

    resource "aws_instance" "first_terraform_server" {
        instance_type = "t2.micro"
        ami = "ami-04b70fa74e45c3917"
        provider = aws.us-east-1
        key_name = "first instance"
        tags = {
            Name= "Terraform First Server"
        }
    }

    resource "aws_instance" "second_terraform_server" {
        instance_type = "t2.micro"
        ami = "ami-0f58b397bc5c1f2e8"
        provider = aws.ap-south-1
        tags = {
            Name= "Terraform Second Server"
        }
    }
   ```

4. Initialize terraform using the following command

   ```bash
   terraform init
   ```

   **Sample Screenshot**

   ![alt text](/images/Activity16/terraform-init.png)

5. Plan the resources

   ```bash
   terraform plan
   ```

   **Smaple Screenshot**

   ![alt text](/images/Activity16/terraform-pan.png)

6. Apply the changes using the following command

   ```bash
   terraform apply
   ```

   **Sample Screenshot**

   ![alt text](/images/Activity16/terraform-apply.png)

7. You can verify the instance up and running in the aws console.

   **us-east-1 (Virginia)**

   ![alt text](/images/Activity16/us-east1.png)

   **ap-south-1 (Mumbai)**

   ![alt text](/images/Activity16/ap-south-1.png)

8. Deleting the 2 instances

   ```bash
   terraform destroy
   ```

   **Sample Screenshot**

   ![alt text](/images/Activity16/terraform-destroy.png)
