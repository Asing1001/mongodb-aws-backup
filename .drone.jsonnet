local backupLocation = 'mongo-archive.gz';

[{
  kind: 'pipeline',
  name: 'default',
  steps: [
    {
      name: 'mongodump',
      image: 'mongo:3.6.5',
      environment: {
        DB_URI: {
          from_secret: 'db_uri'
        },
      },
      commands: [
        'mongodump --gzip --uri="$DB_URI" --archive=' + backupLocation,
      ],
    },
    {
      name: 'upload',
      image: 'plugins/s3',
      settings: {
        bucket: 'mongo-backup',
        access_key: {
          from_secret: 'aws_access_key_id',
        },
        secret_key: {
          from_secret: 'aws_secret_access_key',
        },
        source: backupLocation,
        target: '/',
      },
    },
  ],
  trigger: {    
    event: ['cron', 'push'],
    branch: 'master'
  },
}]
