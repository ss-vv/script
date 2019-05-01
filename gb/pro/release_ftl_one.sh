cur_dir=$(cd $(dirname ${BASH_SOURCE[0]}); pwd )
apps_path="$base_path/apps/$project"
cp -f $apps_path/packages/ftl.war $apps_path/release/
source $cur_dir/_variable.sh
RSPKG="ftl"
source $cur_dir/../../common/gb_update_one.sh $@
