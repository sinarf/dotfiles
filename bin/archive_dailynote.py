#!/usr/bin/env python3

from datetime import date
import logging as log
from os import environ, path
import shutil
import argparse

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
    parser = argparse.ArgumentParser(description="Check packages")
    # Optional parameters
    parser.add_argument(
        "-q",
        "--quiet",
        action="store_true",
        help="Quiet mode, shows only warnings and errors.",
        default=False,
    )
    parser.add_argument(
        "-v",
        "--verbose",
        action="store_true",
        help="Enable log debug, (override --quiet)",
        default=False,
    )

    args = parser.parse_args()

    loglevel = log.INFO
    if args.quiet:
        loglevel = log.WARNING
    if args.verbose:
        loglevel = log.DEBUG

    log.basicConfig(format="%(asctime)s:%(levelname)s:%(message)s", level=loglevel)
    if args.verbose and args.quiet:
        log.warn("Verbose takes over quiet mode when both enabled")
    log.debug("DEBUG mode enabled")
    archivenote()
