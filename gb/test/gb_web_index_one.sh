cur_dir=$(cd $(dirname ${BASH_SOURCE[0]}); pwd )
source $cur_dir/_variable.sh
RSGB=""
DSGB=""
ASGB="ccenter msites pcenter acenter tcenter mcenter boss mdcenter mobile"
source $cur_dir/../../common/gb_web_index_one.sh $@
