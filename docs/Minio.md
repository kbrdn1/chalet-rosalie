# Minio (Simulate S3) 🍱

## Table of Contents 📚

- [Create a new Bucket](#create-a-new-bucket-) 📁
- [Configure access to the bucket](#configure-access-to-the-bucket-) 🔒

## Create a new Bucket 📁
<img src="docs/assets/create_bucket.png" width="750" alt="Create bucket button location"/>

1. Click on the `Bucket` button in sidebar menu.
2. Click on the `Create bucket` button.

<img src="docs/assets/create_bucket_2.png" width="750" alt="Bucket name input field"/>

3. Enter the name of the bucket.

## Configure access to the bucket 🔒
<img src="docs/assets/access_bucket.png" width="750" alt="Access configuration panel"/>

Click a bucket name in the list of buckets.

1. Click on the `Access` button in the sidebar menu.
2. Click on the `read-write` button present in the `Policy` section.

<img src="docs/assets/access_bucket_2.png" width="750" alt="Raw policy editor"/>

1. Click on the `Raw Policy` button in the sidebar menu.
2. Copy the following policy and paste it into the text area.

```json
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Principal": "*",
            "Action": [
                "s3:GetObject",
                "s3:GetBucketLocation"
            ],
            "Resource": [
                "arn:aws:s3:::*"
            ],
            "Condition": {
                "StringLike": {
                    "aws:Referer": [
                        "http://localhost:3000/*"
                    ]
                }
            }
        }
    ]
}
```

3. Click on the `Save` button.

> [!NOTE]
> You can change the `aws:Referer` value to match your frontend application's URL.

```bash
docker exec -it minio-fp mc mb minio-fp
```