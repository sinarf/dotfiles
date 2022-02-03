#!/usr/bin/env python3

from datetime import date
from os import environ, path
import shutil
import logging as log

home = environ["HOME"]
dailynote = environ["TODAY_NOTE"]


def archivenote():
    """
    Creates a note name with the date of the last modified date of the note.
    Only if the file has not been modified today.
    """

    last_modified = date.fromtimestamp(path.getmtime(dailynote))
    today = date.today()

    archivednote = home + "/Sync/pkb/main/diary/" + str(last_modified) + ".md"

    if last_modified == today:
        log.info(f"{str(dailynote)} already modified today.")
    elif path.exists(archivednote):
        # only archive if not already done
        log.info(f"{str(archivednote)} already exists")
    else:
        log.info(f"Archiving note {str(archivenote)}")
        shutil.copyfile(dailynote, archivednote)


if __name__ == "__main__":
    log.basicConfig(filename=f"{home}/admin.log", level=log.INFO)
    archivenote()
