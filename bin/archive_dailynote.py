#!/usr/bin/env python3

from datetime import date
from datetime import timedelta
import shutil
import os

today = date.today()
yesterday = today - timedelta(days=1)
home = os.environ['HOME']
dailynote = home + '/Sync/pkb/main/quicknote.md'
archivenote = home + '/Sync/pkb/main/diary/' + str(yesterday) + '.md'

shutil.copyfile(dailynote, archivenote)
