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

variable "projects" {
  description = "Projects list to add the IAM policies/bindings"
  default     = ["carrier-lzmaster"]
  type        = list(string)
}

variable "mode" {
  description = "Mode for adding the IAM policies/bindings, additive and authoritative"
  default     = "additive"
}

variable "bindings" {
  description = "Map of role (key) and list of members (value) to add the IAM policies/bindings"
  type        = map(list(string))
  default     = {"roles/compute.networkAdmin" = ["user:rakeshkumar.boga@carrier.com"]}
}

variable "conditional_bindings" {
  description = "List of maps of role and respective conditions, and the members to add the IAM policies/bindings"
  type = list(object({
    role        = string
    title       = string
    description = string
    expression  = string
    members     = list(string)
  }))
  default = [{
      role = "roles/appengine.appAdmin"
      title = "expires_after_2022_01_31"
      description = "Expiring at midnight of 2022-01-31"
      expression = "request.time < timestamp(\"2022-01-31T00:00:00Z\")"
      members = ["user:rakeshkumar.boga@carrier.com"]
    }]
}
