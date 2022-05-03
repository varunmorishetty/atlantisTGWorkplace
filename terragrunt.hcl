locals {
  account_vars             = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  account_name             = local.account_vars.locals.account_name
  provider_account_id      = local.account_vars.locals.provider_account_id
  provider_region          = "eu-west-1"
  provider_source          = "hashicorp/aws"
  provider_version         = "~> 3.0"
  provider_name            = "aws"
  s3_state_bucket_name     = "atlantis-testing-repo-bucket-xyz"
  relative_leaf_path       = path_relative_to_include()
}



# Generate a provider block
generate "provider" {
  path      = "${local.provider_name}_provider.tf"
  if_exists = "overwrite_terragrunt"
  contents  = <<EOF

terraform {
  required_providers {
    ${local.provider_name} = {
      source  = "${local.provider_source}"
      version = "${local.provider_version}"
    }
  }
}

provider "${local.provider_name}" {
  region  = "${local.provider_region}"
  # Only these Account IDs may be operated on by this configuration
  allowed_account_ids = ["${local.provider_account_id}"]
}
EOF
}

# Configure Terragrunt to automatically store tfstate files in an S3 bucket
remote_state {
  backend = "s3"
  config = {
    encrypt        = true
    bucket         = local.s3_state_bucket_name
    key            = "${path_relative_to_include()}/terraform.tfstate"
    region         = local.provider_region
    dynamodb_table = "terraform-locks"
  }
  generate = {
    path      = "backend.tf"
    if_exists = "overwrite_terragrunt"
  }
}


