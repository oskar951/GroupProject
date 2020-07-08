import boto3

def lambda_handler(event, context):
    currentDate = datetime.date.today()
    stringDate = currentDate.strftime("%d/%m/%y")

    ec2_client = boto3.client('ec2')
    ec2_resource = boto3.resource('ec2')

    allImages = []
    images = ec2_resource.images.filter(
        Owners = ['self']
    )
    for image in images.all():
        allImages.append(image.id)
    
    instanceName = 'Webserver_Node BACKUP' + stringDate

    instance = ec2_resource.create_instances(
        ImageId = allImages[0],
        InstanceType = 't2.micro',
        KeyName = 'aws',
        MaxCount = 1,
        MinCount = 1,
        TagSpecification = [
            {
                'ResourceType' : 'snapshot',
                'Tags' : [
                {
                    'Key' : 'Name',
                    'Value' : instanceName
                }
                ]
            }
        ]
    )