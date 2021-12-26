#!/usr/bin/env python3

from datetime import date
from datetime import timedelta
import os
import shutil

home = os.environ["HOME"]
dailynote = os.environ["TODAY_NOTE"]

yesterday = date.today() - timedelta(days=1)

archivednote = home + "/Sync/pkb/main/diary/" + str(yesterday) + ".md"


def archivenote():
    # only archive if not already done
    if os.path.exists(archivednote):
        print(archivednote + " already exists")
    else:
        shutil.copyfile(dailynote, archivednote)


if __name__ == "__main__":
    archivenote()
