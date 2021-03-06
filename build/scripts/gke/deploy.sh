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

gcloud container clusters get-credentials ${CLUSTER_NAME} --project=${GCP_PROJECT} --zone=us-east1-b

kubectl run ${GKE_TEST_APPLICATION} --image=${STAGING_IMAGE} --port=8080 --expose=true \
            --service-overrides='{ "apiVersion": "v1", "spec": { "type":  "LoadBalancer" } }' \
            --requests 'cpu=50m,memory=128Mi'