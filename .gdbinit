define skipstdcxxheaders
python
def skipAllIn(root):
    import os
    for root, dirs, files in os.walk(root, topdown=False):
        for name in files:
            path = os.path.join(root, name)
            gdb.execute('skip file %s' % path, to_string=True)
# do this for C++ only
if 'c++' in gdb.execute('show language', to_string=True):
    skipAllIn('/usr/include/c++')
    skipAllIn('C:\ProgramData')
    skipAllIn('C:\programdata')
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

skip -gfi C:\programdata\chocolatey\lib\mingw\tools\install\mingw64\include\*\*\*\*\*
skip -gfi C:\programdata\chocolatey\lib\mingw\tools\install\mingw64\include\*\*\*\*
skip -gfi C:\programdata\chocolatey\lib\mingw\tools\install\mingw64\include\*\*\*
skip -gfi C:\programdata\chocolatey\lib\mingw\tools\install\mingw64\include\*\*
skip -gfi C:\programdata\chocolatey\lib\mingw\tools\install\mingw64\include\*

skip -gfi /usr/include/c++/*/*/*
skip -gfi /usr/include/c++/*/*
skip -gfi /usr/include/c++/*


