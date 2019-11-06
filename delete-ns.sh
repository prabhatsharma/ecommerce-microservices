#! /bin/bash

curl -k -H "Content-Type: application/json" -X PUT --data-binary @ns.json http://localhost:8001/api/v1/namespaces/ecommerce/finalize