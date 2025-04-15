provider "aws" {
  region = "eu-west-1"
}

# Customized with your own s3 bucket and dynamoDB table if you want to use Remote Backend for State
/*terraform {
  backend "s3" {
    bucket         = "terraform-tfstate-poc"     # Update it 
    key            = "poc/terraform-github-actions.tfstate" # Update it
    region         = "eu-west-1"                            # Update it
    dynamodb_table = "terraform-lock"                       # Update it
    encrypt        = true
  }
}*/

resource "aws_budgets_budget" "zero_spend_budget" {
  name         = "ZeroSpendBudget"
  budget_type  = "COST"
  limit_amount = "0.1"
  limit_unit   = "USD"
  time_unit    = "MONTHLY"
  notification {
    comparison_operator        = "GREATER_THAN"
    threshold                  = 0
    threshold_type             = "ABSOLUTE_VALUE"
    notification_type          = "ACTUAL"
    subscriber_email_addresses = ["alcalex@gmail.com"]
  }
}
