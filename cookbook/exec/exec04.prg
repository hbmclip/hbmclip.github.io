#include <hbmediator.ch>

procedure Main

  local cResult,nErrorLevel


  EXEC "InexistentProgram" ERRORLEVEL nErrorLevel 
  IF nErrorLevel > 0
      ? "Errorlevel from external program:" , nErrorLevel
      RETURN
  ENDIF  


