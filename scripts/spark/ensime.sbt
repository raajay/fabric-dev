ensimeScalaVersion in ThisBuild := "2.11.8"
ensimeIgnoreScalaMismatch in ThisBuild := true
ensimeJavaFlags in ThisBuild := Seq("-Xss8m", "-Xmx8g", "-XX:MaxMetaspaceSize=4096m", "-XX:MaxDirectMemorySize=160961m")
