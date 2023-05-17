const { SESClient, SendTemplatedEmailCommand } = require("@aws-sdk/client-ses");

const templateName = process.argv[2];
const sourceAddress = process.argv[3];
const email = process.argv[4];
const name = process.argv[5];

if (!templateName || !sourceAddress || !email || !name) {
  console.error('Usage: node send-email.js <templateName> <sourceAddress> <toAddress> <name>');
  process.exit(1);
  return;
}

const region = process.env.AWS_REGION ?? 'us-east-1';

const client = new SESClient({ region });

const command = new SendTemplatedEmailCommand({
  Source: sourceAddress,
  Destination: {
    ToAddresses: [email],
  },
  Template: templateName,
  TemplateData: JSON.stringify({
    name,
  }),
});

client.send(command).then(() => {
  console.log('Message sent');
}).catch((error) => {
  console.error(error);
});
