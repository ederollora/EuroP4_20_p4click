control Ipv4_fwd(inout headers_t hdr, inout metadata meta, inout standard_metadata_t standard_metadata){

    action drop() {
        mark_to_drop(standard_metadata);
    }

    action ipv4_route(macAddr_t myMac, egressSpec_t port) {
        hdr.ethernet.dstAddr = hdr.ethernet.srcAddr;
        hdr.ethernet.srcAddr = myMac;
        hdr.ipv4.ttl = hdr.ipv4.ttl - 1;
        standard_metadata.egress_spec = port;
    }

    table ipv4fwd_table {
        key = {
            hdr.ethernet.dstAddr: exact;
        }
        actions = {
            ipv4_route;
            drop;
            NoAction;
        }
        size = 1024;
        default_action = NoAction;
    }

    table intfmac_table {
        key = {
            hdr.ethernet.dstAddr: exact;
        }
        actions = {
            NoAction;
        }
        size = 64;
        default_action = NoAction;
    }

    apply {
        if (hdr.ipv4.isValid()) {
            if(intfmac_table.apply().hit){
                ipv4fwd_table.apply();
                /*
                Maybe this is better at some point.
                if(ipv4fwd_table.apply().hit){
                    fwd_done=true;
                }
                */
            }
        }
    }

}

