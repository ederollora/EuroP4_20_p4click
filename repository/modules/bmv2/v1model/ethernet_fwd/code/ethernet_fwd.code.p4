control Ethernet_forward(inout headers_t hdr, inout metadata meta, inout standard_metadata_t standard_metadata){

    action drop() {
        mark_to_drop(standard_metadata);
    }

    action ethernet_fwd(egressSpec_t port) {
        standard_metadata.egress_spec = port;
    }

    table l2_table {
        key = {
            hdr.ethernet.dstAddr: exact;
        }
        actions = {
            ethernet_fwd;
            NoAction;
        }
        size = 1024;
        default_action = NoAction;
    }

    apply {
        if (hdr.ethernet.isValid()) {
            l2_table.apply();
        }
    }

}
