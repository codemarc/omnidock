# Build the cibi/omni container in the default shell.
# Please note this script has specifically omitted
# the hash-bang bin/bash or bin/ash directive with
# the intent to run in the default shell.

clear
echo "---> Building cibi/omni from $0"
echo
echo "Working directory: $(pwd)"
echo
echo "Top level folders:" 
ls -ld */
echo

#check for the omni artifacts
iomni=http://iomnibld:8081/nexus/content/repositories/snapshots/com/iwaysoftware/omni/Workbench/2.0.0-SNAPSHOT
omniapp=$(pwd)/ism/OmniPatient
omnizip=$(pwd)/ism/omni.zip
mvnmeta=maven-metadata.xml

echo "omni.zip:"
echo "  checking for $omnizip"

if [ ! -f "$omnizip" ]; then
   echo 
   echo "  missing !!! so try to grab a new copy from iomnibld:8081/nexus"
   echo
   echo "  step 1: curl the proper $mvnmeta"
   
   if [ $(curl -sL -w "%{http_code}" "$iomni/$mvnmeta" -o $mvnmeta) != 200 ]; then
      echo "  !!! problem curl-ing $mvnmeta" 
      echo 
      echo "bye" 
      echo 
      exit 1
   fi
   
   ts=$(cat $mvnmeta | grep '<timestamp'   | cut -f2 -d">"|cut -f1 -d"<")
   bn=$(cat $mvnmeta | grep '<buildNumber' | cut -f2 -d">"|cut -f1 -d"<")
   echo
   echo "  step 2: from $mvnmeta calculated workbench file is:"
   echo "          Workbench-2.0.0-$ts-$bn.zip"
   echo
   echo "  step 3: curl-ing Workbench-2.0.0-$ts-$bn.zip as omni.zip"
   echo
   
   if [ $(curl -o $omnizip -w "%{http_code}" "$iomni/Workbench-2.0.0-$ts-$bn.zip") != 200 ]; then
      echo "  !!! problem curl-ing Workbench-2.0.0-$ts-$bn.zip" 
      echo 
      echo "bye" 
      echo 
      rm $mvnmeta 
      rm $omnizip 
      exit 1
   fi
   rm $mvnmeta
else
   ls -l $omnizip
   echo
fi



echo "OmniPatient:"
echo "  checking for $omniapp"

if [ ! -d "$omniapp" ]; then
   echo "  missing !!! so try to unzip it from $omnizip"
   unzip -qq -d ./ism/ ./ism/omni.zip
   echo
fi

if [ ! -d "$omniapp" ]; then
   echo "  !!! $omniapp still missing " 
   echo 
   echo "bye" 
   echo 
   exit 1
else 
  ls  -l $omniapp
  echo 
fi

echo "---> Dockerizing "
docker pull cibi/base
docker build -t cibi/omni ./ism
echo
docker images






