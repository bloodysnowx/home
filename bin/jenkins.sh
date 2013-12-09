sudo launchctl unload /Library/LaunchDaemons/org.jenkins-ci.plist
# javaws http://202.225.1.117:8080/computer/iwasa-no-mbp/slave-agent.jnlp
java -Xrs -Xmx1024m -XX:MaxPermSize=256m -jar /Applications/Jenkins/jenkins.war
