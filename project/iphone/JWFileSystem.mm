#import <CoreFoundation/CoreFoundation.h>
#import <Foundation/Foundation.h>
#include <sys/xattr.h>
#include "JWFileSystem.h"

extern "C"
{
    bool jwPathExists(const char *sPath)
    {
        NSFileManager *fm = [NSFileManager defaultManager];
        return [fm fileExistsAtPath: [[NSString alloc] initWithUTF8String: sPath]] ? true : false;
    }

    void jwRenameFile(const char *sPath, const char *sNewPath)
    {
        NSError *err = NULL;
        NSFileManager *fm = [NSFileManager defaultManager];
        NSString *path = [[NSString alloc] initWithUTF8String: sPath];
        NSString *newPath = [[NSString alloc] initWithUTF8String: sNewPath];
        BOOL res = [fm moveItemAtPath: path toPath: newPath error: &err];

        if (!res) NSLog(@"File move error: %@", err);
    }

    void jwCreateDirectory(const char *sPath)
    {
        NSError *err = NULL;
        NSFileManager *fm = [NSFileManager defaultManager];
        NSString *path = [[NSString alloc] initWithUTF8String: sPath];
        BOOL res = [fm createDirectoryAtPath: path withIntermediateDirectories: YES attributes: nil error: &err];

        if (!res) NSLog(@"Create directory error: %@", err);
    }

    void jwDeleteFile(const char *sPath)
    {
        NSError *err = NULL;
        NSFileManager *fm = [NSFileManager defaultManager];
        NSString *path = [[NSString alloc] initWithUTF8String: sPath];
        BOOL res = [fm removeItemAtPath: path error: &err];

        if (!res) NSLog(@"Delete file error: %@", err);
    }

    void jwNoBackup(const char *sPath)
    {
        const char* attrName = "com.apple.MobileBackup";
        u_int8_t attrValue = 1;
        int result = setxattr(sPath, attrName, &attrValue, sizeof(attrValue), 0, 0);
    }

    const char* jwClientVersion()
    {
        NSString *version = 
            [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"];
        return [version UTF8String];
    }
}
