#include "system.h"
#include "util.h"
#include "type.h"
#include "network.h"
#include "connect.h"
#include "example.h"
#include "train.h"
#include "act.h"
#include "command.h"
#include "control.h"
#include "object.h"

/* Add your initials or something here to customize the version number */
char *VersionExt = "";

/******************************** Extension Records **************************/

ObjInfo NetExtInfo;
ObjInfo GroupExtInfo;
ObjInfo UnitExtInfo;
ObjInfo BlockExtInfo;
ObjInfo ExSetExtInfo;
ObjInfo ExampleExtInfo;
ObjInfo EventExtInfo;

/* This is what the object viewer displays as the name of the extension. */
static void extensionName(void *ext, char *dest) {
  if (ext) sprintf(dest, "extension");
  else dest[0] = '\0';
}


struct netExt {
  int removeMe;
};

/* This is how you register fields so they are visible in the object viewer 
   and accessible with setObject and getObject */
static void initNetExtInfo(void) {
  /*
  NetExt NE;
  addObj(NetExtInfo, "removeMe", OFFSET(NE, removeMe), TRUE, IntInfo);
   */
  NetExt NX;
  addObj(NetExtInfo, "RemoveMe", OFFSET(NX, removeMe), TRUE, IntInfo);
}

/* Use this to build the network extension and set your own default 
   parameters */
flag initNetworkExtension(Network N) {
  FREE(N->ext);

  N->ext = safeCalloc(1, sizeof(struct netExt), 
     "initNetworkExtension:N->ext");
  N->ext->removeMe = 3;

  return TCL_OK;
}

/* This is called when the network is reset.  If you also want to reset group
   or other extensions, you should do that from within here. */
flag resetNetworkExtension(Network N) {
  return TCL_OK;
}

flag freeNetworkExtension(Network N) {
  FREE(N->ext);
  return TCL_OK;
}


struct groupExt {
  int removeMe;
};

static void initGroupExtInfo(void) {
  /* GroupExt GE; */
}

flag initGroupExtension(Group G) {
  FREE(G->ext);
  return TCL_OK;
}

flag freeGroupExtension(Group G) {
  FREE(G->ext);
  return TCL_OK;
}


struct unitExt {
  int removeMe;
};

static void initUnitExtInfo(void) {
  /* UnitExt UE; */
}

flag initUnitExtension(Unit U) {
  FREE(U->ext);
  return TCL_OK;
}

flag freeUnitExtension(Unit U) {
  FREE(U->ext);
  return TCL_OK;
}


struct blockExt {
  int removeMe;
};

static void initBlockExtInfo(void) {
  /* BlockExt BE; */
}

flag initBlockExtension(Block B) {
  FREE(B->ext);
  return TCL_OK;
}

flag freeBlockExtension(Block B) {
  FREE(B->ext);
  return TCL_OK;
}

flag copyBlockExtension(Block from, Block to) {
  if (!from->ext) {
    if (to->ext) {
      freeBlockExtension(to);
      to->ext = NULL;
    }
    return TCL_OK;
  }
  if (!to->ext) initBlockExtension(to);
  to->ext->removeMe = from->ext->removeMe;
  return TCL_OK;
}


struct exSetExt {
  int removeMe;
};

static void initExSetExtInfo(void) {
  /* ExSetExt SE; */
}

flag initExSetExtension(ExampleSet S) {
  FREE(S->ext);
  return TCL_OK;
}

flag freeExSetExtension(ExampleSet S) {
  FREE(S->ext);
  return TCL_OK;
}


struct exampleExt {
  int removeMe;
};

static void initExampleExtInfo(void) {
  /* ExampleExt EE; */
}

flag initExampleExtension(Example E) {
  FREE(E->ext);
  return TCL_OK;
}

flag freeExampleExtension(Example E) {
  FREE(E->ext);
  return TCL_OK;
}


struct eventExt {
  int removeMe;
};

static void initEventExtInfo(void) {
  /* EventExt VE; */
}

flag initEventExtension(Event V) {
  FREE(V->ext);
  return TCL_OK;
}

flag freeEventExtension(Event V) {
  FREE(V->ext);
  return TCL_OK;
}


/********************************* New Tcl Commands **************************/
/* Here is a sample Tcl-callable C stub.  util.c contains the functions
   warning(), result(), and append() for creating Tcl return messages.
   The stub must be registered (see below) before it can be called. */
/*
static int C_foo(TCL_CMDARGS) {
  char *usage = "foo <bar>";
  if (argc == 2 && !strcmp(argv[1], "-h"))
    return commandHelp(argv[0]);
  if (argc != 2) return usageError(argv[0], usage);
  if (!Net) return warning("%s: no current network", argv[0]);
  
  return TCL_OK;
}
*/

 
/******************************* User Initialization *************************/

/* This gets called while Lens is booting up */
flag userInit(void) {
  NetExtInfo = newObject("Network Extension", sizeof(struct netExt), 1,
			 extensionName, NULL, NULL);
  GroupExtInfo = newObject("Group Extension", sizeof(struct groupExt), 3,
			   extensionName, NULL, NULL);
  UnitExtInfo = newObject("Unit Extension", sizeof(struct unitExt), 5,
			  extensionName, NULL, NULL);
  BlockExtInfo = newObject("Block Extension", sizeof(struct blockExt), 7,
			   extensionName, NULL, NULL);
  ExSetExtInfo = newObject("Example Set Extension", sizeof(struct exSetExt), 3,
			   extensionName, NULL, NULL);
  ExampleExtInfo = newObject("Example Extension", sizeof(struct exampleExt), 5,
			     extensionName, NULL, NULL);
  EventExtInfo = newObject("Event Extension", sizeof(struct eventExt), 7,
			   extensionName, NULL, NULL);
  initNetExtInfo();
  initGroupExtInfo();
  initUnitExtInfo();
  initBlockExtInfo();
  initExSetExtInfo();
  initExampleExtInfo();
  initEventExtInfo();

  /* This creates a blank line in the list of commands produced by "help": */
  /* registerCommand(NULL, "", ""); */
  /* This creates the command "foo": */
  /* registerCommand(C_foo, "foo", "this command does some stuff"); */

  return TCL_OK;
}
