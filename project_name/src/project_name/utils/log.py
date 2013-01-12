# -*- coding: utf-8 -*-
import os
import logging
from stat import ST_DEV, ST_INO


class FileHandler(logging.FileHandler):
    def _open(self):
        stream = super(FileHandler, self)._open()
        stat = os.stat(self.baseFilename)
        self._dev, self._ino = stat[ST_DEV], stat[ST_INO]
        return stream

    def emit(self, record):
        if self.stream is not None:
            if not os.path.exists(self.baseFilename):
                stat = None
                changed = True
            else:
                stat = os.stat(self.baseFilename)
                changed = (stat[ST_DEV] != self._dev or
                           stat[ST_INO] != self._ino)
            if changed:
                self.close()
        super(FileHandler, self).emit(record)
