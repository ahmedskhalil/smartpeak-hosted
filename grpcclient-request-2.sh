#!/usr/bin/env bash
grpcurl -plaintext -d '{"dataset_path": "/sample-data/LCMS_MRM_Standards","export": 2,"report_metadata": "ALL","report_sample_types": "ALL","integrity": "NONE"}' 192.168.64.2:30777  SmartPeakServer.Workflow.runWorkflow
