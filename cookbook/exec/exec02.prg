#include <hbmediator.ch>


procedure Main


   local aResult,x


   EXEC "ls -l" to aResult AS ARRAY


   FOR x := 1 TO len( aResult )
       ? "Array line[" , x , "]" , " -> " , aResult[x]
   NEXT


return
