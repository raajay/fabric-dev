# Spacemacs setup for Apache Spark development

Spacemacs has a *scala* layer that is helpful; it uses ENSIME for bringing IDE
like features for Scala developement. This includes functions like, goto
definition/implementation, inspecting classes etc.. The steps to get everything setup is as follows:

* Install, sbt-ensime plugin that is used to generate ".ensime" file for all projects configuration files from SBT, Maven, Gradle, etc..

* Add "ensime.sbt" at the root of the project to configure ".ensime" generation.

* Open, any scala file the project using spacemacs, and start ENSIME server through command "M-x ensime".

* The log files generate by the server can be seen in the "ENSIME-<project name>" file in the list of open buffers. Closing this buffer shuts down the server. TODO: see if the server can be started offline.

* Check out init-spark.sh and ensime.sbt
