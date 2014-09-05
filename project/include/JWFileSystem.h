#ifndef CHARTBOOST_H
#define CHARTBOOST_H

namespace jwfilesystem
{	
    extern "C"
    {	
        bool jwPathExists(const char *sPath);
        void jwRenameFile(const char *sPath, const char *sNewPath);
        void jwCreateDirectory(const char *sPath);
        void jwDeleteFile(const char *sPath);
        void jwNoBackup(const char *sPath);
    }
}

#endif
