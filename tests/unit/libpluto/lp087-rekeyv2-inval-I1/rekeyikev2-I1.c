#define WANT_THIS_DBG DBG_EMITTING|DBG_CONTROL|DBG_CONTROLMORE|DBG_CRYPT|DBG_PRIVATE|DBG_LIFECYCLE|DBG_PARSING
#include "../lp013-parentI3/parentI3_head.c"
#include "seam_gi_sha1.c"
#include "seam_gi_sha1_group14.c"
#include "seam_finish.c"
#include "seam_ikev2_sendI1.c"
#include "seam_debug.c"

static void init_loaded(void)
{   /* nothing */ }

#define TESTNAME "rekeyikev2"
#define AFTER_CONN rekeyit

#include "../lp087-rekeyv2-inval-I1/rekeyit.c"
#include "../lp013-parentI3/parentI3_main.c"

 /*
 * Local Variables:
 * c-style: pluto
 * c-basic-offset: 4
 * compile-command: "make check"
 * End:
 */
