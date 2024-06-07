# https://github.com/eclipse/paho.mqtt.c?tab=readme-ov-file#building-your-application-with-cmake

find_package(eclipse-paho-mqtt-c REQUIRED)

target_link_libraries(${LF_MAIN_TARGET} PUBLIC eclipse-paho-mqtt-c::paho-mqtt3a) 
