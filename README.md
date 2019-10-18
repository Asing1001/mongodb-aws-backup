# MONGO S3 BACKUP

Schedule backup mongodb to AWS S3 by leveraging Drone cronjob, if you want to backup yours:  

1. Fork the repo
2. Change the setting in `.drone.jsonnet`
3. Activate the project in Drone and fill up variables `aws_access_key_id`, `aws_secret_access_key`, `db_uri`
4. Setup cronjob in Drone project's setting

![drone-mongo](https://user-images.githubusercontent.com/6785698/67076974-cdc89400-f1c0-11e9-9ccc-d98ed054ec65.png)
