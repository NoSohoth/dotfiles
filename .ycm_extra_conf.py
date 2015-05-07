flags = [
'-Wall', '-Wextra', '-Werror',
'-std=c++11',
'-x',
'c++',
'-I', './include',
'-I', '/usr/include/SFML',
'-I', '/usr/include/GL',
'-I', '/usr/include/glm',
]

def FlagsForFile( filename ):
  return {
    'flags': flags,
    'do_cache': True
  }
