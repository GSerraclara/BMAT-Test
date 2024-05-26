resource "aws_cloudwatch_dashboard" "demo_dashboard" {
  dashboard_name = "demo-dashboard"

  dashboard_body = jsonencode({
    widgets = [
      {
        "type": "metric",
        "x": 0,
        "y": 7,
        "width": 12,
        "height": 6,
        "properties": {
          "metrics": [
            ["AWS/RDS", "CPUUtilization", "DBInstanceIdentifier", var.rds_instance_identifier],
            ["AWS/RDS", "FreeableMemory", "DBInstanceIdentifier", var.rds_instance_identifier]
          ],
          "period": 300,
          "stat": "Average",
          "region": var.aws_region,
          "title": "RDS - CPU and Memory"
        }
      },
      {
        "type": "metric",
        "x": 0,
        "y": 14,
        "width": 12,
        "height": 6,
        "properties": {
          "metrics": [
            ["AWS/S3", "NumberOfObjects", "BucketName", var.s3_bucket_name],
            ["AWS/S3", "BucketSizeBytes", "BucketName", var.s3_bucket_name]
          ],
          "period": 86400,
          "stat": "Average",
          "region": var.aws_region,
          "title": "S3 - Objects and Size"
        }
      },
      {
        "type": "metric",
        "x": 0,
        "y": 21,
        "width": 12,
        "height": 6,
        "properties": {
          "metrics": [
            ["AWS/SQS", "ApproximateNumberOfMessagesVisible", "QueueName", var.sqs_queue_name]
          ],
          "period": 300,
          "stat": "Average",
          "region": var.aws_region,
          "title": "SQS - Messages in Queue"
        }
      },
      {
        "type": "metric",
        "x": 0,
        "y": 28,
        "width": 12,
        "height": 6,
        "properties": {
          "metrics": [
            ["AWS/EC2", "CPUUtilization", "InstanceId", var.sftp_instance_id]
          ],
          "period": 300,
          "stat": "Average",
          "region": var.aws_region,
          "title": "SFTP - CPU Utilization"
        }
      }
    ]
  })
}
