DEFINES += NO_VECTORIAL_RENDER
DEFINES += QGLVIEWER_STATIC

CONFIG += debug_and_release

CONFIG(release, debug|release) {
	DBGNAME = release
}
else {
	DBGNAME = debug
}
DESTDIR = $${DBGNAME}

win32 {
	TEMPLATE = vclib
}
else {
	TEMPLATE = lib

	macx {
		DEFINES += DARWIN
	}
	else {
		DEFINES += LINUX
                QMAKE_CXXFLAGS += -fopenmp
	}
}

CONFIG += staticlib
QT += opengl xml

TARGET = qglviewer

DEPENDPATH += .
INCLUDEPATH += .

#Input
HEADERS += *.h
SOURCES += *.cpp
FORMS += *.ui
