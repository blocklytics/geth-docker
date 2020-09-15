#!/usr/bin/env python
import logging
from flask import Flask, abort
from web3 import Web3, HTTPProvider

import settings

# Init
logging.basicConfig(level=logging.INFO)

GETH_URL = 'http://localhost:%s' % settings.ETH_RPC_PORT

app = Flask(__name__)

w3_http_provider = HTTPProvider(GETH_URL, request_kwargs={'timeout': settings.ETH_RPC_TIMEOUT})
w3 = Web3(w3_http_provider)

# Flask routes
@app.route("/healthz")
def liveness():
    syncing = True
    current_block = 0
    highest_block = 0
    try:
        sync_status = w3.eth.syncing
        if not sync_status:
            syncing = sync_status
        else:
            current_block = sync_status['currentBlock']
            highest_block = sync_status['highestBlock']
    except Exception as exc:
        logging.error('Error fetching sync status')
        abort(500)

    if syncing:
        logging.error('Node not in sync. Current block: {}, Highest block: {}'.format(current_block, highest_block))
        abort(500)
    else:
        logging.info('Node is synced')
        return 'ok'