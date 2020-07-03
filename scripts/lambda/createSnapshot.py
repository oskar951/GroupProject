import boto3, datetime

def lambda_handler(event, context):
    # Pull the current date so snapshots can be dated
    currentDate = datetime.date.today()
    stringDate = currentDate.strftime("%d/%m/%y")

    ec2_client = boto3.client('ec2')
    ec2_resource = boto3.resource('ec2')

    # Find the instance called test-VM
    instances = ec2_resource.instances.filter(
        Filters = [
            {
                'Name' : 'tag:Name',
                'Values' : ['test-VM']
            }
        ]
    )

    volumeID = []
    for instance in instances.all():
        # Find the name of the instance
        for tag in instance.tags:
            if tag['Key'] == 'Name':
                insName = tag['Value']
        # Pull all volumes attached to the instance
        instanceVol = instance.volumes.all()
        for volume in instanceVol:
            volName = insName + ' volume'
            # Create the snapshot
            snap = volume.create_snapshot(
                VolumeId = volume.id,
                Description = 'Automated backup using Lambda',
                TagSpecifications = [
                    {
                        'ResourceType' : 'snapshot',
                        'Tags' : [
                            {
                                'Key' : 'Name',
                                'Value' : volName
                            },
                            {
                                'Key' : 'InstanceName',
                                'Value' : insName
                            },
                            {
                                'Key' : 'CreationDate',
                                'Value' : stringDate
                            }
                        ]
                    }
                ]
            )
