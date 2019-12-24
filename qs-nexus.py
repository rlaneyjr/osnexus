#!/usr/bin/env python
# -*- coding: utf-8 -*-
# vim: noai:et:tw=80:ts=4:ss=4:sts=4:sw=4:ft=python

# title:            qs-nexus.py
# description:      Connect to OSNEXUS
# author:           Ricky Laney
# date:             20191114
# version:          0.0.1
# usage:            python qs-nexus.py or ./qs-nexus.py
# notes:            
# python_version:   3.7.0
# ==============================================================================

import json
from quantastor.qs_client import QuantastorClient

client = QuantastorClient('10.0.23.8', 'admin', 'ralrox22')
system = client.storage_system_get()
print(json.dumps(system.exportJson(), sort_keys=True,  indent=2, separators=(',', ': ')))

