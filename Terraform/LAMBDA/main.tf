resource "aws_lambda_function" "createSnapshot" {
    filename = "../../scripts/lambda/createSnapshot.zip"
    function_name = "createSnapshot"
    role = aws_iam_role.lambdaIAM.arn
    runtime = "python3.8"
    handler = "lambda_function.lambda_handler"
}

resource "aws_lambda_function" "createImage" {
    filename = "../../scripts/lambda/createImage.zip"
    function_name = "createImage"
    role = aws_iam_role.lambdaIAM.arn
    runtime = "python3.8"
    handler = "lambda_function.lambda_handler"
}

resource "aws_lambda_function" "createInstance" {
    filename = "../../scripts/lambda/createInstance.zip"
    function_name = "createAMI"
    role = aws_iam_role.lambdaIAM.arn
    runtime = "python3.8"
    handler = "lambda_function.lambda_handler"
}

resource "aws_iam_role" "lambdaIAM" {
    name = "Lambda-Role"
    assume_role_policy = <<EOF
    {
        "Version" : "2012-10-17",
        "Statement" : [
            {
                "Action" : "sts:AssumeRole",
                "Principal" : {
                    "Service" : "lambda.amazonaws.com"
                },
                "Effect" : "Allow",
                "Sid" : ""
            }
        ]
    }
    EOF
}

resource "aws_iam_role_policy_attachment" "AWSLambdaFullAccess" {
    role = aws_iam_role.lambdaIAM.name
    policy_arn = "arn:aws:iam::aws:policy/AWSLambdaFullAccess"
}

resource "aws_iam_role_policy_attachment" "AmazonEC2FullAccess {
    role = aws_iam_role.lambdaIAM.name
    policy_arn = "arn:aws:iam::aws:policy/AmazonEC2FullAccess"
}

resource "aws_iam_role_policy_attachment" "EC2InstanceConnect" {
    role = aws_iam_role.lambdaIAM.name
    policy_arn = "arn:aws:iam::aws:policy/EC2InstanceConnect"
}