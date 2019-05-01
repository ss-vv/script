cur_dir=$(cd $(dirname ${BASH_SOURCE[0]}); pwd )
source $cur_dir/_variable.sh
RSGB=""
ASGB="service"
DSGB=""
source $cur_dir/../../common/gb_schdule_stop.sh
