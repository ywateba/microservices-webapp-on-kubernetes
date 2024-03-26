import AWS = require('aws-sdk');
import {config} from './config/config';


// Configure AWS
const credentials = new AWS.SharedIniFileCredentials({profile: config.aws_profile});
AWS.config.credentials = credentials;

export const s3 = new AWS.S3({
  signatureVersion: 'v4',
  region: config.aws_region,
  // endpoint: 'http://localhost:4566', //needed with localstack
  // s3ForcePathStyle: true, // needed with LocalStack
  params: {Bucket: config.aws_media_bucket},
});

// Generates an AWS signed URL for retrieving objects
export function getGetSignedUrl( key: string ): string {
  const signedUrlExpireSeconds = 60 * 5;

  return s3.getSignedUrl('getObject', {
    Bucket: config.aws_media_bucket,
    Key: key,
    Expires: signedUrlExpireSeconds,
  });
}

// Generates an AWS signed URL for uploading objects
export function getPutSignedUrl( key: string ): string {
  const signedUrlExpireSeconds = 60 * 5;

  return s3.getSignedUrl('putObject', {
    Bucket: config.aws_media_bucket,
    Key: key,
    Expires: signedUrlExpireSeconds,
  });
}

// const cloudwatchlogs = new AWS.CloudWatchLogs();
// // Create Log Group
// cloudwatchlogs.createLogGroup({ logGroupName: 'YourLogGroupName' }, function(err, data) {
//   if (err) console.log(err, err.stack);
//   else     console.log(data);
// });

// // Create Log Stream
// cloudwatchlogs.createLogStream({
//   logGroupName: 'YourLogGroupName',
//   logStreamName: 'YourLogStreamName'
// }, function(err, data) {
//   if (err) console.log(err, err.stack);
//   else     console.log(data);
// });


// let sequenceToken = null; // Initialize sequence token

// function sendLog(message) {
//   const params = {
//     logEvents: [
//       {
//         message: JSON.stringify(message),
//         timestamp: new Date().getTime(),
//       },
//     ],
//     logGroupName: 'YourLogGroupName',
//     logStreamName: 'YourLogStreamName',
//     sequenceToken: sequenceToken, // Required only for existing streams
//   };

//   cloudwatchlogs.putLogEvents(params, function(err, data) {
//     if (err) {
//       console.log(err, err.stack);
//     } else {
//       console.log('Log event sent:', data);
//       sequenceToken = data.nextSequenceToken; // Update the sequence token
//     }
//   });
// }

// // Example log message
// sendLog({ level: 'info', message: 'This is a test log message' });
