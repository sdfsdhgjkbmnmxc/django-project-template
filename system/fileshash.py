#!/usr/bin/env python
import sys
from hashlib import md5


h = md5()
for path in sys.argv[1:]:
    h.update(open(path).read())

print h.hexdigest(),
