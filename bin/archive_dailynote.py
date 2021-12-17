#!/usr/bin/env python3

from datetime import date
from datetime import timedelta
import os
import shutil

today = date.today()
yesterday = today - timedelta(days=1)
home = os.environ['HOME']
dailynote = home + '/Sync/pkb/main/quicknote.md'
archivenote = home + '/Sync/pkb/main/diary/' + str(yesterday) + '.md'

# only archive if not already done
if os.path.exists(archivenote):
    print(archivenote + ' already exists')
else:
    shutil.copyfile(dailynote, archivenote)
