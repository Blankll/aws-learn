const aws = require('aws-sdk');
const cw = new aws.CloudWatch({ apiVersion: '2010-08-01' });

exports.handler = async (event) => {
  let body = 'Hello from Lambda!';
  let statusCode = 200;
  console.log('event', JSON.stringify(event));
  if (event.source === 'aws.events') {
    body = 'hello from ScheduledEvent';
    const params = {
      Namespace: 'seven-metrics-namespace',
      MetricData: [{
        MetricName: 'seven-custom-metric',
        Dimensions: [{
          Name: 'FunctionName',
          Value: 'seven-cloudwatch-learn-lambda'
        }],
        Unit: 'Count',
        Value: 1
      }]
    };
    const response = await cw.putMetricData(params).promise();
    console.log('metrics update result:', JSON.stringify(response));
  } else if (event.result === 'error') {
    body = 'error request!';
    statusCode = 400;
  } else if (event.from === 'filter-event') {
    console.log(`seven-lambda-filter request --${Date.now()}`);
  }

  return {
    statusCode,
    body: JSON.stringify(body),
  };
};
