# BMAT Test



## Project Requirements and Solutions

1. Huge Storage

    - Service: Amazon S3
    - Explanation:
        - How does it work?: S3 provides scalable object storage with high availability and durability. It can store and retrieve any amount of data at any time.
        - Mounting: It should not be directly mounted as a filesystem for all components due to its nature as an object storage service rather than a block storage service. Instead, S3 should be accessed via APIs for storing and retrieving data.
        - Reason: S3 is designed for scalability and cost-efficiency, making it suitable for large storage needs shared among all system components.

2. Database with high insert and search performance
    - Service: RDS
    - Alternatives: 
        - DynamoDB if we are working with NoSQL
        - Snowflake if it's allowed using services outside AWS, it is one of the best options

3. SFTP server
    - Service: AWS Transfer Famly

4. Web server
    - Service: EC2
    - Explanation:
        - How it works: EC2 instances host the web server application, while Auto Scaling ensures scalability based on demand. Elastic Load Balancing distributes incoming traffic across multiple instances.
        - Reason: Provides flexibility and scalability for handling web traffic efficiently.

5. High performance processing of XML, CSV files
    - Service: AWS Lambda with Amazon SQS
    - Explanation:
        - How it works: AWS Lambda processes files in response to events (e.g., new file upload in S3). SQS manages the job queue, ensuring reliable message delivery.
        - Reason: Serverless architecture with Lambda provides scalability and cost-efficiency, while SQS ensures reliable and decoupled processing.

6. Queueing system
    - Service: Amazon SQS (Simple Queue Service)
    - Explanation:
        - How it works: SQS offers a fully managed message queuing service that enables decoupling and scaling of microservices, distributed systems, and serverless applications.
        - Reason: It provides high availability, durability, and scalability for managing the queue of jobs.
    - Alternatives:
        - RabbitMQ, Kafka

7. Scalables
    - Web Service Scaling: Implement Auto Scaling groups for EC2 instances hosting the web server to scale based on load.
    - Worker Scaling: Use AWS Lambda for automatic scaling based on the number of messages in the SQS queue.

8. Security
    - Inbound Security: Configure Security Groups to allow only:
        - Ports 80 and 443 for the web server.
        - Port 220 for the SFTP server.
        - Port 1220 for SSH access from internal IPs.
    - Outbound Security: 
        - Web and SFTP servers have unrestricted internet access.
        - Workers use a NAT Gateway for secure outbound traffic. Configuration involves setting up a NAT Gateway in a public subnet and routing traffic from private subnets through the NAT Gateway.

9. Monitoring
    - Health Checks: Use AWS CloudWatch for health checks and to collect performance metrics.
    - Performance Metrics: Set up CloudWatch Alarms & Dashboard to monitor and report metrics for all system components.
    - Alternatives:
        - Grafana, datadog...

## Infrastructure as Code with Terraform
The following Terraform modules can be defined for reusability and maintainability:

* S3 Bucket: To store application data.
* DynamoDB Table: For high-performance database operations.
* EC2 Instances and Auto Scaling: For web servers.
* AWS Transfer Family: For the SFTP server.
* Lambda Functions and SQS: For processing files.
* VPC, Subnets, and NAT Gateway: For network configuration.
* Security Groups: For inbound and outbound traffic rules.
* CloudWatch Alarms and Dasboard: For monitoring and alerting.
