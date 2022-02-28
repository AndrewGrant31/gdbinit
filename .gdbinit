# if using this file in MS Windows, especially with Qt Creator
# clone this file, and place it in C:\Users\<yourusername>\AppData\Roaming\QtProject\qtcreator
# rename it .gdbinit (if it isn't already using that name) - make sure to place a period at the start of the name
# get the set environment variables dialog box (type env in the search or use the control panel)
# in either section (user or global) create a new variable with the name HOME 
# set this to the path where you placed the .gdbinit file: C:\Users\<yourusername>\AppData\Roaming\QtProject\qtcreator
# If using Qt Creator, head to Tools->Options->Debugger->GDB 
# inc the section titled "Additional Startup Commands" anter the following:
# set auto-load local-gdbinit on
# add-auto-load-safe-path /
# Keep the two separate statements on separate lines
# click Apply and then OK, your debugging session should be good to go!
# When you click Step Into or F11 the debugger shouldn't take you into any of the standard header files 
# if it does make sure the text in the gdbinit file is correct and all the variables (the HOME variable in environment 
# variables and the text in the Additional Startup Commands section are correct)
#
# This file is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.

define skipstdcxxheaders
python
def skipAllIn(root):
    import os
    for root, dirs, files in os.walk(root, topdown=False):
        for name in files:
            path = os.path.join(root, name)
            gdb.execute('skip file %s' % path, to_string=True)
# do this for C++ only
# the path[s] should reflect the locations of all the standard header files
if 'c++' in gdb.execute('show language', to_string=True):
    skipAllIn('C:/Qt/Tools/mingw900_64/lib/gcc/x86_64-w64-mingw32/11.2.0/include/c++/bits')
    skipAllIn('C:/Qt/Tools/mingw900_64/lib/gcc/x86_64-w64-mingw32/11.2.0/include/c++')
    skipAllIn('C:/Qt/Tools/mingw900_64/lib/gcc/x86_64-w64-mingw32/11.2.0/include')
end
end

define hookpost-run
    skipstdcxxheaders
end
define hookpost-start
    skipstdcxxheaders
end
define hookpost-attach
    skipstdcxxheaders
end

skip -gfi /include/*/*/*
skip -gfi /include/*/*
skip -gfi /include/*

skip dir /include/*/*/*
skip dir /include/*/*
skip dir /include/*

skip -gfi /include/c++/*/*/*
skip -gfi /include/c++/*/*
skip -gfi /include/c++/*

skip dir /include/c++/*/*/*
skip dir /include/c++/*/*
skip dir /include/c++/*

skip -gfi /usr/include/c++/*/*/*
skip -gfi /usr/include/c++/*/*
skip -gfi /usr/include/c++/*

skip dir /usr/include/c++/*/*/*
skip dir /usr/include/c++/*/*
skip dir /usr/include/c++/*

skip dir C:\Qt\Tools\mingw900_64\lib\gcc\x86_64-w64-mingw32\11.2.0\include\*
skip dir C:\Qt\Tools\mingw900_64\lib\gcc\x86_64-w64-mingw32\11.2.0\include\c++\*
skip dir C:\Qt\Tools\mingw900_64\lib\gcc\x86_64-w64-mingw32\11.2.0\include\c++\bits\*

skip -gfi C:\Qt\Tools\mingw900_64\lib\gcc\x86_64-w64-mingw32\11.2.0\include\*\*.h
skip -gfi C:\Qt\Tools\mingw900_64\lib\gcc\x86_64-w64-mingw32\11.2.0\include\c++\*\*.h
skip -gfi C:\Qt\Tools\mingw900_64\lib\gcc\x86_64-w64-mingw32\11.2.0\include\c++\bits\*\*.h 
skip -gfi C:\Qt\Tools\mingw900_64\lib\gcc\x86_64-w64-mingw32\11.2.0\include\*.h
skip -gfi C:\Qt\Tools\mingw900_64\lib\gcc\x86_64-w64-mingw32\11.2.0\include\c++\*.h
skip -gfi C:\Qt\Tools\mingw900_64\lib\gcc\x86_64-w64-mingw32\11.2.0\include\c++\bits\*.h 

skip -gfi C:\programdata\chocolatey\lib\mingw\tools\install\mingw64\include\*\*\*\*\*
skip -gfi C:\programdata\chocolatey\lib\mingw\tools\install\mingw64\include\*\*\*\*
skip -gfi C:\programdata\chocolatey\lib\mingw\tools\install\mingw64\include\*\*\*
skip -gfi C:\programdata\chocolatey\lib\mingw\tools\install\mingw64\include\*\*
skip -gfi C:\programdata\chocolatey\lib\mingw\tools\install\mingw64\include\*

skip dir C:\programdata\chocolatey\lib\mingw\tools\install\mingw64\include\*\*\*\*\*
skip dir C:\programdata\chocolatey\lib\mingw\tools\install\mingw64\include\*\*\*\*
skip dir C:\programdata\chocolatey\lib\mingw\tools\install\mingw64\include\*\*\*
skip dir C:\programdata\chocolatey\lib\mingw\tools\install\mingw64\include\*\*
skip dir C:\programdata\chocolatey\lib\mingw\tools\install\mingw64\include\*



