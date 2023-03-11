variable "project" {
    type = string
    default = "glue-job-creation-test"
}

variable "tags" {
    type = map
    default = {
        "Project" = "avengers_canuto"
        "Owner" = "Canuto"
    }
}

variable "env" {
}
  
variable "enviorment" {
    type = map
    default = {
        "dev" = "dev"
        "prod" = "prod"
    }
}

variable "job-language" {
    default = "python"
}

variable "glue-arn" {
    default = "arn:aws:iam::660432931507:role/AWSGlue"
}

variable "job-name" {
    default = "canuto-gluejob-test"
}

variable "file-name" {
    default = "canuto-test.py"
}

variable "bucket-name" {
    default = "canuto-gluejob-test-bucket"
}