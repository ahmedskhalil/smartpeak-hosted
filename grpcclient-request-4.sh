#!/usr/bin/env bash
grpcurl -plaintext -d '{"dataset_path": "/sample-data/FIAMS_FullScan_Unknowns","export": 2,"report_metadata": "ALL","report_sample_types": "ALL","integrity": "NONE"}' 192.168.64.6:31440  SmartPeakServer.Workflow.runWorkflow
