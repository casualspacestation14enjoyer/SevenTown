#ifdef TESTING
//	#define FASTLOAD
//	#define DEPLOY_TEST
//	#define ROGUEWORLD
#define MUSKETFARE
#endif


#ifdef FASTLOAD
	#define FORCE_MAP "_maps/roguetest.json"
#else
	#define FORCE_MAP "_maps/musketfare.json"
#endif

//#define WARTIME
