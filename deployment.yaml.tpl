# Copyright 2019 Google LLC
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# https://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
---
apiVersion: apps/v1
kind: Deployment
metadata:
  name: gitops-test-deployment
spec:
  selector:
    matchLabels:
      app: gitops-test
  replicas: 1
  template:
    metadata:
      labels:
        app: gitops-test
    spec:
      containers:
      - name: myapp
        image: gcr.io/PROJECT_ID/gitops-test:SHORT_SHA
        ports:
        - containerPort: 8080
        resources:
          limits:
            cpu: "0.5"
          requests:
            cpu: "0.25"