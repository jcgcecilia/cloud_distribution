import json
import os
import boto3

zero_bucket = os.environ["zero_bucket"]

'''
def handler(event, context):
    # TODO implement
'''

s3 = boto3.client('s3')

def handler(event, context):
    url = s3.generate_presigned_url('put_object', Params={'Bucket': zero_bucket, 'Key':'MyKey'}, ExpiresIn=3600, HttpMethod='PUT')
    return {
        "statusCode": 200,
        "body": json.dumps(url)
    }
