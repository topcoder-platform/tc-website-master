jarname="CvtTopCoderProd"

echo 'Creating EJB for '$directoryname

WL_HOME=/export/home/weblog5/weblogic1
JAVA_HOME=/usr/java

#create new build directory and copy deployment descriptors to it
echo 'building directory and coping deployment descriptors...'
rm -f /home/steveb/build/classes/ejb_jars/"$jarname".jar
rm -f /home/steveb/build/classes/"$jarname".jar
rm -f /home/steveb/build/classes/com/topcoder/web/render/ejb/*.class
rm -rf /home/steveb/build/classes/META-INF 

#compile java files
echo 'Compiling...'
cat com/topcoder/web/render/ejb/deploy/prod/list | xargs javac -deprecation -d /home/steveb/build/classes

mkdir -p /home/steveb/build/classes/META-INF

cp -f \
  com/topcoder/web/render/ejb/deploy/prod/ejb-jar.xml \
  com/topcoder/web/render/ejb/deploy/prod/weblogic-ejb-jar.xml \
  /home/steveb/build/classes/META-INF


# Make a standard ejb jar file, including XML deployment descriptors
echo 'Creating jar...'
(\
  cd /home/steveb/build/classes; \
  jar cv0f \
    "$jarname".jar \
    META-INF \
    com/topcoder/web/render/ejb/*.class
)
  

# Run ejbc to create the deployable jar file
echo 'Running ejbc...'
java -classpath $CLASSPATH \
    weblogic.ejbc \
    -compiler javac /home/steveb/build/classes/"$jarname".jar \
    /home/steveb/build/classes/ejb_jars/"$jarname".jar > err

rm -f /home/steveb/build/classes/"$jarname".jar
rm -r /home/steveb/build/classes/META-INF

#(
#cd /home/steveb/build/classes
#jar cvf s.jar com/topcoder/ejb/"$jarname" ejb_jars/"$jarname".jar
#ftp 172.16.1.152
#)

