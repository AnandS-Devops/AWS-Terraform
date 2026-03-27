resource "aws_iam_policy" "my_policy" {
  name        = "my_policy"
  description = "My demo policy to allow S3 read/write access"

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = [
          "s3:GetObject",
          "s3:PutObject",
          "s3:DeleteObject",
          "s3:ListBucket"
        ]
        Effect   = "Allow"
        Resource = "*"
      }
    ]
  })

}

resource "aws_iam_role" "namemy_role" {
  name = "my_role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      }
    ]
  })

}

resource "aws_iam_role_policy_attachment" "attach_policy" {
    count      = length(local.policy_list)
  role       = aws_iam_role.namemy_role.name
  policy_arn = local.policy_list[count.index]

}

resource "aws_iam_instance_profile" "my_instance_profile" {
  name = "my_instance_profile_demo"
  role = aws_iam_role.namemy_role.name
}
