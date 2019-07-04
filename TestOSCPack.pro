QT -= gui

CONFIG += c++11 console
CONFIG -= app_bundle

# The following define makes your compiler emit warnings if you use
# any Qt feature that has been marked deprecated (the exact warnings
# depend on your compiler). Please consult the documentation of the
# deprecated API in order to know how to port your code away from it.
DEFINES += QT_DEPRECATED_WARNINGS

# You can also make your code fail to compile if it uses deprecated APIs.
# In order to do so, uncomment the following line.
# You can also select to disable deprecated APIs only up to a certain version of Qt.
#DEFINES += QT_DISABLE_DEPRECATED_BEFORE=0x060000    # disables all the APIs deprecated before Qt 6.0.0

SOURCES += \
        ip/IpEndpointName.cpp \
        osc/OscOutboundPacketStream.cpp \
        osc/OscPrintReceivedElements.cpp \
        osc/OscReceivedElements.cpp \
        osc/OscTypes.cpp \
        tests/OscReceiveTest.cpp \
        tests/OscSendTests.cpp \
        tests/OscUnitTests.cpp

win32{
    SOURCES += ip/win32/NetworkingUtils.cpp
    SOURCES += ip/win32/UdpSocket.cpp
}else{
    SOURCES += ip/posix/NetworkingUtils.cpp
    SOURCES += ip/posix/UdpSocket.cpp
}

# Default rules for deployment.
qnx: target.path = /tmp/$${TARGET}/bin
else: unix:!android: target.path = /opt/$${TARGET}/bin
!isEmpty(target.path): INSTALLS += target

HEADERS += \
    ip/IpEndpointName.h \
    ip/NetworkingUtils.h \
    ip/PacketListener.h \
    ip/TimerListener.h \
    ip/UdpSocket.h \
    osc/MessageMappingOscPacketListener.h \
    osc/OscException.h \
    osc/OscHostEndianness.h \
    osc/OscOutboundPacketStream.h \
    osc/OscPacketListener.h \
    osc/OscPrintReceivedElements.h \
    osc/OscReceivedElements.h \
    osc/OscTypes.h \
    tests/OscReceiveTest.h \
    tests/OscSendTests.h \
    tests/OscUnitTests.h \
    tests/TestConfig.h

LIBS += -lkernel32 -lws2_32 -lwinmm
