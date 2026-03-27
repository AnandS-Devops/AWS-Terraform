locals {
  policy_list = [
    "arn:aws:iam::aws:policy/AmazonSSMFullAccess",
    "arn:aws:iam::aws:policy/AmazonEC2FullAccess",
    aws_iam_policy.my_policy.arn
  ]
}