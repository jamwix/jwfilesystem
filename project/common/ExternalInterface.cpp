#ifndef STATIC_LINK
#define IMPLEMENT_API
#endif

#if defined(HX_WINDOWS) || defined(HX_MACOS) || defined(HX_LINUX)
#define NEKO_COMPATIBLE
#endif


#include <hx/CFFI.h>
#include <stdio.h>
#include "JWFileSystem.h"


using namespace jwfilesystem;

static value jwfilesystem_exists(value path) 
{
	#ifdef IPHONE
    return alloc_bool(jwPathExists(val_string(path)));
	#endif
	return alloc_bool(false);
}
DEFINE_PRIM (jwfilesystem_exists, 1);

static value jwfilesystem_rename(value path, value newPath) 
{
	#ifdef IPHONE
    jwRenameFile(val_string(path), val_string(newPath));
	#endif
	return alloc_null();
}
DEFINE_PRIM (jwfilesystem_rename, 2);

static value jwfilesystem_createdirectory(value path) 
{
	#ifdef IPHONE
    jwCreateDirectory(val_string(path));
	#endif
	return alloc_null();
}
DEFINE_PRIM (jwfilesystem_createdirectory, 1);

static value jwfilesystem_deletefile(value path) 
{
	#ifdef IPHONE
    jwDeleteFile(val_string(path));
	#endif
	return alloc_null();
}
DEFINE_PRIM (jwfilesystem_deletefile, 1);

static value jwfilesystem_deletedirectory(value path) 
{
	#ifdef IPHONE
    jwDeleteFile(val_string(path));
	#endif
	return alloc_null();
}
DEFINE_PRIM (jwfilesystem_deletedirectory, 1);

static value jwfilesystem_nobackup(value path) 
{
	#ifdef IPHONE
    jwNoBackup(val_string(path));
	#endif
	return alloc_null();
}
DEFINE_PRIM (jwfilesystem_nobackup, 1);

extern "C" void jwfilesystem_main() 
{
	val_int(0); // Fix Neko init
}
DEFINE_ENTRY_POINT(jwchartboost_main);

extern "C" int jwfilesystem_register_prims() { return 0; }

