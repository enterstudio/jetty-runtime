#!/bin/bash

# Copyright 2017 Google Inc. All rights reserved.

# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at

#     http://www.apache.org/licenses/LICENSE-2.0

# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

set -e

TEST_CLUSTER_EXISTENCE=$(gcloud container clusters list --project=${GCP_PROJECT} | awk "/$CLUSTER_NAME/")
if [ -z "$TEST_CLUSTER_EXISTENCE" ]; then
  gcloud container clusters create "$CLUSTER_NAME" --num-nodes=1 --disk-size=10 --project=${GCP_PROJECT} --zone=us-east1-b
fi
