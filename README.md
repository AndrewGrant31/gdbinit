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
Windows (and without the astericks at the front of the statements - if they are there):  
**set auto-load local-gdbinit on**  
**skip -gfi C:/Qt/Tools/mingw1120_64/lib/gcc/x86_64-w64-mingw32/11.2.0/include/\*/\*\/\***  

Check the version of mingw being used - it varies! 
Navigate to Qt\Tools\ and see what the folder\directory is called,  
insert that identifier where the previous statement reads mingw1120_64

Everything else[?]:  
**set auto-load local-gdbinit on**  
**skip -gfi skip -gfi /include/\*/\*/\***  
**skip -gfi /include/\*/\***  
**skip -gfi /include/\***  

click Apply and then OK, your debugging session should be good to go!  
You may need to restart Qt Creator, just to make sure the changes take effect. On reflection, it probably is a  
good idea to restart Qt Creator.  
When you click Step Into, or press F11, the debugger shouldn't take you into any of the standard header files   
if it does make sure the text in the .gdbinit file is correct and all the variables (the HOME variable in environment   
variables and the text in the Additional Startup Commands section are correct)  

This file is distributed in the hope that it will be useful,  
but WITHOUT ANY WARRANTY; without even the implied warranty of  
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  
