const bit<16> TYPE_IPV4 = 0x0800;

const bit<8> TYPE_ICMP = 0x01;
const bit<8> TYPE_TCP  = 0x06;
const bit<8> TYPE_UDP  = 0x11;

const bit<8> TYPE_ICMP_REQ = 0x08;
const bit<8> TYPE_ICMP_REP = 0x00;

const bit<6> DSCP_INT = 0x17; //DSCP

const bit<8> ETHERNET_HEADER_SIZE_BYTES = 14;
const bit<8> UDP_HEADER_SIZE_BYTES = 8;
const bit<8> TELEMETRY_REPORT_HEADER_LEN_BYTES = 16;
const bit<8> WORD_TO_BYTES = 4;

// INT REPORT
const bit<1> DROPPED = 1;
const bit<1> CONGESTED_QUEUE = 1;
const bit<1> TRACKED_FLOW = 1;
const bit<6> HW_ID = 1;

const bit<8> FIXED_INT_REPORT_LENGTH = 4;
const bit<8> CPU_MIRROR_SESSION_ID = 250;
const bit<32> REPORT_MIRROR_SESSION_ID = 500;
const bit<3> NEXT_PROTO_ETHERNET = 0;

const port_t CPU_PORT = 255;
