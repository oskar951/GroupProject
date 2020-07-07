import boto3

def lambda_handler(event, context):
    currentDate = datetime.date.today()
    stringDate = currentDate.strftime("%d/%m/%y")

    ec2_client = boto3.client('ec2')
    ec2_resources = boto3.resource('ec2')

    # Find snapshots created and appened the ID to a list
    snapID = []
    snapshots = ec2_client.describe_snapshots(OwnerIds=['self'])
    for snapshot in snapshots['Snapshots']:
        snapID.append(snapshot.get('SnapshotId'))


    # Find instances to find InstanceID
    instID = []
    instances = ec2_resources.instances.filter(
        Filters = [
            {
                'Name' : 'tag:Name',
                'Values' : ['WebServer_Node']
            }
        ]
    )
    for instance in instances.all():
        instID.append(instance.id)

    # Create image based of snapshot
    imageName = 'WebServer_Node AMI ' + stringDate

    response = ec2_client.create_image(
        BlockDeviceMappings=[
            {
                'DeviceName': '/dev/sdh',
                'Ebs': {
                    'DeleteOnTermination': True,
                    'SnapshotId': snapID[0],
                },
            },
        ],
        Description='AMI based on snapshot' + snapID[0],
        DryRun=False,
        InstanceId=instID[0],
        Name=imageName,) # add date stamp to image