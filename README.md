# gdbinit
Basic gdbinit file for use with Qt Creator

If using this file in MS Windows, especially with Qt Creator  
clone this file, and place it in C:\Users\<yourusername>\AppData\Roaming\QtProject\qtcreator  
rename it .gdbinit (if it isn't already using that name) - make sure to place a period at the start of the name  
get the set environment variables dialog box (type env in the search or use the control panel)  
in either section (user or global) create a new variable with the name HOME  
set this to the path where you placed the .gdbinit file: C:\Users\<yourusername>\AppData\Roaming\QtProject\qtcreator  
If using Qt Creator, head to Tools->Options->Debugger->GDB   
In the section titled "Additional Startup Commands" enter the following:  
  
**set auto-load local-gdbinit on**  
**skip -gfi C:/Qt/Tools/mingw900_64/lib/gcc/x86_64-w64-mingw32/11.2.0/include/***  
**skip -gfi C:/Qt/Tools/mingw900_64/lib/gcc/x86_64-w64-mingw32/11.2.0/include/\*/\***  
**skip -gfi C:/Qt/Tools/mingw900_64/lib/gcc/x86_64-w64-mingw32/11.2.0/include/*\/*\/\***  

click Apply and then OK, your debugging session should be good to go!  
You may need to restart Qt Creator, just to make sure the changes take effect. On reflection, it probably is a  
good idea to restart Qt Creator.  
When you click Step Into, or press F11, the debugger shouldn't take you into any of the standard header files   
if it does make sure the text in the .gdbinit file is correct and all the variables (the HOME variable in environment   
variables and the text in the Additional Startup Commands section are correct)  

This file is distributed in the hope that it will be useful,  
but WITHOUT ANY WARRANTY; without even the implied warranty of  
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  
