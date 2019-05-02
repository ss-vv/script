apps_path="$base_path/apps/$project"
echo "rm -rf  $apps_path/release/*"
rm -rf  $apps_path/release/*
for   var  in   $ALLPKG
  do
    echo "rm -rf $apps_path/work/$var/*"
         rm -rf  $apps_path/work/$var/*
    echo "mkdir -p $apps_path/work/$var/"
         mkdir -p $apps_path/work/$var/
  done
export _project_=$project
export _base_path_=$base_path
python $base_path/script/common/unpackage.py

for   var  in   $ALLPKG
  do
    echo "$base_path/script/$project/$env/conf.sh $apps_path/work/$var/WEB-INF/classes/conf"
         source $base_path/script/$project/$env/conf.sh $apps_path/work/$var/WEB-INF/classes/conf $var
  done
  echo -e "$ALLPKG"
for   var  in   $ALLPKG
  do
      echo "cd  $apps_path/work/$var/"
            cd $apps_path/work/$var/
      echo -e "zip -rq $apps_path/release/${var}.war \t ./"
               zip -rq $apps_path/release/${var}.war ./
  done
for pkg in $CPPKG 
do
    echo "cp $apps_path/packages/$pkg $apps_path/release/"
    cp $apps_path/packages/$pkg $apps_path/release/
done

echo "cp $apps_path/packages/sql.war           $apps_path/release/"
      cp $apps_path/packages/sql.war           $apps_path/release/







#echo "rm -rf $apps_path/work/rcenter/*"
#      rm -rf $apps_path/work/rcenter/*
#echo "mkdir -p $apps_path/work/rcenter/$dubbo_version/rcenter/"
#      mkdir -p $apps_path/work/rcenter/$dubbo_version/rcenter/
#echo "unzip -q $apps_path/packages/rcenter.war -d $apps_path/work/rcenter/$dubbo_version/rcenter/"
#      unzip -q $apps_path/packages/rcenter.war -d $apps_path/work/rcenter/$dubbo_version/rcenter/
#echo "cd $apps_path/work/rcenter/"
#      cd $apps_path/work/rcenter/
#echo "zip -rq $apps_path/release/rcenter.war ./"
#      zip -rq $apps_path/release/rcenter.war ./
#echo "cp $apps_path/packages/rcenter.war       $apps_path/release/"
#      cp $apps_path/packages/rcenter.war       $apps_path/release/
#echo "cp $apps_path/packages/pay-impl-jars.war $apps_path/release/"
#      cp $apps_path/packages/pay-impl-jars.war $apps_path/release/
#echo "cp $apps_path/packages/ftl.war           $apps_path/release/"
#      cp $apps_path/packages/ftl.war           $apps_path/release/
#echo "cp $apps_path/packages/api-impl-jars.war $apps_path/release/"
#      cp $apps_path/packages/api-impl-jars.war $apps_path/release/
