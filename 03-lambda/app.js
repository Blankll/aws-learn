const aws = require('aws-sdk');
const s3 = new aws.S3({ apiVersion: '2006-03-01' });

const targetBucketName = 'seven-lambda-learn-target';

exports.handler = async (event) => {
    let body = 'Hello from Lambda!';
    let statusCode = 200;
    console.log('event',JSON.stringify(event));
    if (event.source === 'aws.events') {
        body = 'hello from ScheduledEvent';
    } else if (event.Records && event.Records[0].eventSource === 'aws:s3'){
        const sourceBucketName = event.Records[0].s3.bucket.name;
        const sourceKey = event.Records[0].s3.object.key;
        try {
            const exists = await s3.headObject({ Bucket: targetBucketName, Key: sourceKey}).promise().then(() => true).catch(err => err.code === 'NotFound' && false);
            console.log('exists', JSON.stringify(exists));
            if(!exists) {
                const result = await s3.copyObject({
                    Bucket: targetBucketName,
                    CopySource: `${sourceBucketName}/${sourceKey}`,
                    Key: sourceKey
                }).promise();
                console.log('upload to target bucket', JSON.stringify(result));
            }
            body = 'hello from s3 file copyed success!';
        }catch(e) {
            body = 'hello from s3 file copyed failed!';
            statusCode = 500;
            console.error('document error cached', JSON.stringify(e));
        }
    } else if (event.result === 'error') {
        body = 'error request!';
        statusCode = 400;
    }
    
    return {
        statusCode,
        body: JSON.stringify(body),
    };
};  
