#S3 Website

An S3 Bucket-based static website

* [s3-website.json](s3-website.json)
* [params.json](params.json)

Template parameters are:

* **bucketName** = S3 Bucket name

Can create folders and upload files via the web console (drag and drop, then make public).

Or can use the AWS CLI:

    aws s3 cp my-home-page.html s3://chris-nappin-example/

To view the website, browse to:

    http://<bucket-name>.s3-website-<AWS-region>.amazonaws.com
    
For example:
    
* [http://chris-nappin-example.s3-website-eu-west-1.amazonaws.com](http://chris-nappin-example.s3-website-eu-west-1.amazonaws.com)
  