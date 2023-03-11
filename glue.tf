resource "aws_glue_job" "glue-job" {
  name     = "${var.job-name}"
  role_arn = "${var.glue-arn}"
  description = "Testezinho do gluejob canuto"
  max_retries = "1"
  timeout = 2880

  command {
    script_location = "s3://${var.bucket-name}/Scripts/${var.file-name}"
    python_version = "3"
  }
  execution_property {
    max_concurrent_runs = 2
  }
  glue_version = "3.0"
}


resource "aws_glue_trigger" "glue_trigger" {
  name     = "glue_trigger_canutera_test"
  schedule = "cron(0 0 * * ? *)"
  type     = "SCHEDULED"

  actions {
    job_name = aws_glue_job.glue-job.name
  }
}