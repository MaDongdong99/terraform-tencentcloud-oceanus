variable "create_workspace" {
  default = true
  type = bool
}
variable "workspace_id" {
  default = ""
  type = string
  description = "given id when create_workspace is false"
}

variable "work_space_name" {
  default = ""
  type = string
}
variable "description" {
  default = ""
  type = string
}

variable "job_folders" {
  default = {}
  type = any
  description = "see `tencentcloud_oceanus_folder`"
}

variable "resource_folders" {
  default = {}
  type = any
  description = "see `tencentcloud_oceanus_folder`"
}