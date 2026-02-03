resource "aws_kms_key" "rds_kms_key" {
    description = "KMS key for RDS encryption"
}

resource "aws_db_instance" "app_db" {
    db_name = "appdatabase"
    engine = "mysql"
    engine_version = "8.0"
    allocated_storage = 20
    instance_class = var.db_instance_class
    username = var.db_username
    manage_master_user_password = true
    storage_encrypted = true
    master_user_secret_kms_key_id =  aws_kms_key.rds_kms_key.id
    final_snapshot_identifier = true
}