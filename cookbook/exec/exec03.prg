#include <hbmediator.ch>

procedure Main

  local aResult,cError


  EXEC "InexistentProgram" TO aResult ERROR cError AS ARRAY
  IF .NOT. EMPTY( cError )
      ? "Error from external program:" , cError
      RETURN
  ENDIF  


