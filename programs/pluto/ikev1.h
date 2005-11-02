/*
 * IKEv1 functions;
 */

extern notification_t accept_KE(chunk_t *dest, const char *val_name
				, const struct oakley_group_desc *gr
				, pb_stream *pbs);
extern bool ship_nonce(chunk_t *n, struct pluto_crypto_req *r
		       , pb_stream *outs, u_int8_t np
		       , const char *name);

extern bool ship_KE(struct state *st
		    , struct pluto_crypto_req *r
		    , chunk_t *g
		    , pb_stream *outs, u_int8_t np);

extern notification_t accept_nonce(struct msg_digest *md
				   , chunk_t *dest, const char *name);




