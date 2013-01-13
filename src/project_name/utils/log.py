# -*- coding: utf-8 -*-
import os
import logging
from stat import ST_DEV, ST_INO


class MultiFileHandler(logging.StreamHandler):
    def __init__(self, path, root_name=None):
        self.path = path
        logging.Handler.__init__(self)
        self.stream = None
        self.root_name = root_name
        self.loggers = {}

    def emit(self, record):
        if record.name == 'root' and self.root_name:
            name = self.root_name
        else:
            name = record.name

        if name in self.loggers:
            logger = self.loggers[name]
        else:
            logger = {
                'filename': os.path.join(self.path, '%s.log' % name),
                'dev': (-1),
                'ino': (-1),
                'stream': None
            }
            self.loggers[name] = logger

        if not os.path.exists(logger['filename']):
            stat = None
            changed = 1
        else:
            stat = os.stat(logger['filename'])
            changed = (stat[ST_DEV] != logger['dev'] or
                       stat[ST_INO] != logger['ino'])

        if changed or logger['stream'] is None:
            if logger['stream'] is not None:
                logger['stream'].flush()
                logger['stream'].close()
            logger['stream'] = open(logger['filename'], 'a')
            if stat is None:
                stat = os.stat(logger['filename'])
            logger['dev'], logger['ino'] = stat[ST_DEV], stat[ST_INO]
        self.stream = logger['stream']
        logging.StreamHandler.emit(self, record)
