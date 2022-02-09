#!/usr/bin/env python3

from datetime import date
import logging as log
from os import environ, path
import shutil

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
        log.info(f"{str(dailynote)} already modified today, won't be archived.")
    elif path.exists(archivednote):
        # only archive if not already done
        log.info(f"{str(archivednote)} already exists")
    else:
        log.info(f"Archiving note {str(archivenote)}")
        shutil.copyfile(dailynote, archivednote)


if __name__ == "__main__":
    log.basicConfig(
        format="%(asctime)s:%(levelname)s:%(message)s",
        level=log.INFO,
    )
    archivenote()
