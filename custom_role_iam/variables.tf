/**
 * Copyright 2019 Google LLC
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

variable "role_id" {
  type        = string
  description = "ID of the Custom Role."
  default = "carrier123"
}

variable "title" {
  type        = string
  description = "Human-readable title of the Custom Role, defaults to role_id."
  default     = "carrier-custom"
}

variable "base_roles" {
  type        = list(string)
  description = "List of base predefined roles to use to compose custom role."
  default     = ["roles/iam.serviceAccountAdmin"]
}

variable "permissions" {
  type        = list(string)
  description = "IAM permissions assigned to Custom Role."
  default = [ "iam.roles.list", "iam.roles.create", "iam.roles.delete" ]
}

variable "excluded_permissions" {
  type        = list(string)
  description = "List of permissions to exclude from custom role."
  default     = ["iam.serviceAccounts.setIamPolicy"]
}

variable "description" {
  type        = string
  description = "Description of Custom role."
  default     = "rakeshboga-customrole"
}

variable "stage" {
  type        = string
  description = "The current launch stage of the role. Defaults to GA."
  default     = "GA"
}

variable "target_id" {
  type        = string
  description = "Variable for project or organization ID."
  default = "carrier-lzmaster"
}

variable "target_level" {
  type        = string
  description = "String variable to denote if custom role being created is at project or organization level."
  default     = "project"
}

variable "members" {
  description = "List of members to be added to custom role."
  type        = list(string)
  default = [ "rakeshkumar.boga@carrier.com" ]
}
