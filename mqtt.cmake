# find_package(Mosquitto REQUIRED)x
list(APPEND CMAKE_PREFIX_PATH "/opt/homebrew/")
list(APPEND CMAKE_PREFIX_PATH "/usr/local/")

find_package(OpenSSL)
if(${OpenSSL_FOUND})
    set(PAHO_WITH_SSL true)
ELSE (${OpenSSL_FOUND})
    set(PAHO_WITH_SSL false)
    MESSAGE(ERROR " Could not locate OpenSSL. Will skip using it.")
ENDIF (${OpenSSL_FOUND})
# Taken from: https://github.com/eclipse/paho.mqtt.cpp/tree/master/cmake
# find the Paho MQTT C library
if(PAHO_WITH_SSL)
    set(_PAHO_MQTT_C_LIB_NAME paho-mqtt3cs)
else()
    set(_PAHO_MQTT_C_LIB_NAME paho-mqtt3c)
endif()

# add suffix when using static Paho MQTT C library variant on Windows
if(WIN32)
    if(PAHO_BUILD_STATIC)
        set(_PAHO_MQTT_C_LIB_NAME ${_PAHO_MQTT_C_LIB_NAME}-static)
    endif()
endif()

find_library(PAHO_MQTT_C_LIBRARIES NAMES ${_PAHO_MQTT_C_LIB_NAME})

include_directories(${PAHO_MQTT_C_INCLUDE_DIRS})
target_link_libraries(${LF_MAIN_TARGET} PUBLIC ${PAHO_MQTT_C_LIB})
