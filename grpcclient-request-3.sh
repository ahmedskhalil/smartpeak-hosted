#!/usr/bin/env bash
grpcurl -plaintext -d '{"dataset_path": "/sample-data/GCMS_SIM_Unknowns","export": 2,"report_metadata": "ALL","report_sample_types": "ALL","integrity": "NONE"}' 192.168.64.2:30777  SmartPeakServer.Workflow.runWorkflow
