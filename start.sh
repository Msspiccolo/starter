./gradlew assemble && ${CATALINA_HOME}/bin/shutdown.sh &&  cp build/libs/starter-1.0.0.war ${CATALINA_HOME}/webapps/starter.war && rm -rf ${CATALINA_HOME}/webapps/starter ${CATALINA_HOME}/work/* && ${CATALINA_HOME}/bin/startup.sh && tail -f ${CATALINA_HOME}/logs/*log

