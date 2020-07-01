CURRENT_DIR=$(shell pwd -P)
BIN_NAME=img2clip
DESKTOP_NAME1=copy-image-to-clipboard.desktop
DESKTOP_NAME2=img2clip.desktop
TARGET_BIN_DIR=${HOME}/bin
TARGET_DESKTOP_DIR=${HOME}/.local/share/applications

TARGET_BIN=${TARGET_BIN_DIR}/${BIN_NAME}
TARGET_DESKTOP1=${TARGET_DESKTOP_DIR}/${DESKTOP_NAME1}
TARGET_DESKTOP2=${TARGET_DESKTOP_DIR}/${DESKTOP_NAME2}

ORIGINAL_BIN=${CURRENT_DIR}/bin/${BIN_NAME}
ORIGINAL_DESKTOP1=${CURRENT_DIR}/share/${DESKTOP_NAME1}
ORIGINAL_DESKTOP2=${CURRENT_DIR}/share/${DESKTOP_NAME2}


help: help
	@echo "Usage:"
	@echo "1: Desktop file only:"
	@echo "\tmake install1 | link1 | uninstall1"
	@echo "2: With a shell script:"
	@echo "\tmake install2 | link2 | uninstall2"


install1: make-dir copy1 update-desktop-db

install2: make-dir copy2 update-desktop-db

link1: make-dir symlink1 update-desktop-db

link2: make-dir symlink2 update-desktop-db

uninstall1: delete1 update-desktop-db

uninstall2: delete2 update-desktop-db


copy1:
	@test -e "${TARGET_DESKTOP1}" || \
		cp "${ORIGINAL_DESKTOP1}" "${TARGET_DESKTOP1}"

copy2:
	@test -e "${TARGET_BIN}" || \
		cp "${ORIGINAL_BIN}" "${TARGET_BIN}"
	@test -e "${TARGET_DESKTOP2}" || \
		cp "${ORIGINAL_DESKTOP2}" "${TARGET_DESKTOP2}"


symlink1:
	@test -e "${TARGET_DESKTOP1}" || \
		ln -s "${ORIGINAL_DESKTOP1}" "${TARGET_DESKTOP1}"

symlink2:
	@test -e "${TARGET_BIN}" || \
		ln -s "${ORIGINAL_BIN}" "${TARGET_BIN}"
	@test -e "${TARGET_DESKTOP2}" || \
		ln -s "${ORIGINAL_DESKTOP2}" "${TARGET_DESKTOP2}"


delete1:
	@test -e "${TARGET_DESKTOP1}" && \
		rm "${TARGET_DESKTOP1}"

delete2:
	@test -e "${TARGET_BIN}" && \
		rm "${TARGET_BIN}"
	@test -e "${TARGET_DESKTOP2}" && \
		rm "${TARGET_DESKTOP2}"


update-desktop-db:
	@update-desktop-database ${TARGET_DESKTOP_DIR}


make-dir:
	mkdir -p "${TARGET_DESKTOP_DIR}"

