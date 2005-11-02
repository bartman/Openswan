/* demultiplex incoming IKE messages
 * Copyright (C) 1998-2002  D. Hugh Redelmeier.
 *
 * This program is free software; you can redistribute it and/or modify it
 * under the terms of the GNU General Public License as published by the
 * Free Software Foundation; either version 2 of the License, or (at your
 * option) any later version.  See <http://www.fsf.org/copyleft/gpl.txt>.
 *
 * This program is distributed in the hope that it will be useful, but
 * WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY
 * or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License
 * for more details.
 *
 * RCSID $Id: demux.h,v 1.33.2.1 2005/05/18 20:55:13 ken Exp $
 */

#ifndef _DEMUX_H
#define _DEMUX_H

#include "server.h"

#include "quirks.h"

struct state;	/* forward declaration of tag */
extern void init_demux(void);
extern bool send_packet(struct state *st, const char *where, bool verbose);
extern void comm_handle(const struct iface *ifp);

extern u_int8_t reply_buffer[MAX_OUTPUT_UDP_SIZE];

/* State transition function infrastructure
 *
 * com_handle parses a message, decides what state object it applies to,
 * and calls the appropriate state transition function (STF).
 * These declarations define the interface to these functions.
 *
 * Each STF must be able to be restarted up to any failure point:
 * a later message will cause the state to be re-entered.  This
 * explains the use of the replace macro and the care in handling
 * MP_INT members of struct state.
 */

struct payload_digest {
    pb_stream pbs;
    union payload payload;
    struct payload_digest *next;   /* of same kind */
};

/* message digest
 * Note: raw_packet and packet_pbs are "owners" of space on heap.
 */

struct msg_digest {
    struct msg_digest *next;	/* for free list */
    chunk_t raw_packet;		/* if encrypted, received packet before decryption */
    const struct iface *iface;	/* interface on which message arrived */
    ip_address sender;	        /* where message came from (network order) */
    u_int16_t sender_port;	/* host order */
    pb_stream packet_pbs;	/* whole packet */
    pb_stream message_pbs;	/* message to be processed */
    struct isakmp_hdr hdr;	/* message's header */
    bool encrypted;	/* was it encrypted? */
    enum state_kind from_state;	/* state we started in */
    const struct state_microcode *smc;	/* microcode for initial state */
    struct state *st;	/* current state object */
    pb_stream reply;	/* room for reply */
    pb_stream rbody;	/* room for reply body (after header) */
    notification_t note;	/* reason for failure */
    bool dpd;           /* Peer supports RFC 3706 DPD */

#   define PAYLIMIT 20
    struct payload_digest
	digest[PAYLIMIT],
	*digest_roof,
	*chain[ISAKMP_NEXT_ROOF];
    struct isakmp_quirks quirks;
};

extern struct msg_digest *alloc_md(void);
extern void release_md(struct msg_digest *md);

typedef stf_status state_transition_fn(struct msg_digest *md);

extern void complete_state_transition(struct msg_digest **mdp, stf_status result);
extern void process_packet(struct msg_digest **mdp);

extern void free_md_pool(void);

/* deal with echo request/reply */
extern void receive_ike_echo_request(struct msg_digest *md);
extern void receive_ike_echo_reply(struct msg_digest *md);

#endif /* _DEMUX_H */
