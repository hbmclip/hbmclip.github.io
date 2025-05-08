#include <hbmediator.ch>

procedure MAIN


   local cResult

#ifdef __PLATFORM__WINDOWS
   LOCAL cExec := "dir *.*"
#else
   LOCAL cExec := "ls -l"
#endif
   EXEC cExec to cResult
   ? cResult

return
