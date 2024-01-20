variable "gcp_key" {
  description = "The credentials for the json file"
  default = "./keys/creds-key.json"
}


variable "project" {
  description = "The Google ProjectID to be provided"
  default = "de-project-411714"
}

variable "location" {
  description = "The Google Project Location"
  default = "US"
}

variable "bq_dataset_name" {
    description = "The name of Google BigQuery Dataset you want to be created."
    default = "de_dataset_411714"
}

variable "gcp_bucket_name" {
    description = "The name of Google Cloud Bucket you want to be created."
    default = "de-bucket-de-project-411714"
}

variable "gcp_storage_class" {
    description = "Bucket storage class"
    default = "STANDARD"
}

