#include <hbmediator.ch>

procedure Main
   local cResult, cError, nErrorLevel

   EXEC "ls -l -a -h" To cResult error cError errorlevel nErrorLevel

   ? cResult
   ? "ErrorLevel : " , nErrorLevel
   ? "Error  : " , cError
      


return



