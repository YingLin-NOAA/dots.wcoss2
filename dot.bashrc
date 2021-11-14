# .bashrc

# Source global definitions: as of 2021/09/20, cactus does not have /etc/bashrc
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# for ecf ui:
module load intel ecflow

module load imagemagick/7.0.8-7
module load prod_util/2.0.9

module load python/3.8.6
module load wgrib2/2.0.8

SOS=/u/Ying.Lin/sos
DOTS=/u/Ying.Lin/dots

alias lsd='ls -d */'
alias noscrub='cd /lfs/h1/nco/omb/noscrub/Ying.Lin'
alias ptmp='dir=/lfs/h1/nco/ptmp/Ying.Lin; if [ ! -d $dir ]; then mkdir -p $dir; fi; cd $dir'
alias stmp='dir=/lfs/h1/nco/stmp/Ying.Lin; if [ ! -d $dir ]; then mkdir -p $dir; fi; cd $dir'
alias lsd='ls -d */'
alias xv=display

  # WCOSS Phase 3 (Dell PowerEdge)
#  module load ips/18.0.1.163
#  module load impi/18.0.1
#  module load lsf/10.1
#  module load prod_util/1.1.5
#  module load HPSS/5.0.2.5

#  alias wgrib=/gpfs/dell1/nco/ops/nwprod/grib_util.v1.1.1/exec/wgrib
#  alias wgrib2=/gpfs/dell1/nco/ops/nwprod/grib_util.v1.1.1/exec/wgrib2
  # mecf script sending text alert to phone:
#  alias mecf='$SOS/mecfl_windows_yl.sh'


  #Python:
#  module load python/3.6.3
#  module use -a /u/Benjamin.Blake/modulefiles
#  export PYTHONPATH=${PYTHONPATH}:/gpfs/dell2/emc/modeling/noscrub/Jacob.Carley/python/lib/python3.6/site-packages
  # GrADS:
#  module use -a /usrx/local/dev/modulefiles
#  module load GrADS/2.2.0

alias nwprod='cd /gpfs/$disk/nco/ops/nwprod'
alias com1='cd /gpfs/dell1/nco/ops/com'
alias com2='cd /gpfs/dell2/nco/ops/com'
alias comcray='cd /gpfs/hps/nco/ops/com'
alias comout='cd /gpfs/$disk/nco/ops/com/output/prod'
alias logs='cd $DELLLOG'
alias dcom='today=`date +%Y%m%d`; cd /gpfs/dell1/nco/ops/dcom/prod/$today'
alias dcomtxt='today=`date +%Y%m%d`; cd /gpfs/dell1/nco/ops/dcom/prod/$today/wtxtbul' 

alias mrms='cd /gpfs/dell1/nco/ops/dcom/prod/ldmdata/obs/upperair/mrms'

# 2020/06/13 for SOS work:
# To view the current SPA on-call file:
DELLLOG=/gpfs/dell1/nco/ops/com/logs
CRAYLOG=/gpfs/hps/nco/ops/com/logs
alias spaoncall='view $DELLLOG/spa.oncall'
# View sev msg logs:
alias dellsev='view $DELLLOG/prod/cluster_monitor_files/node.error.log'
alias dellsevlong='view /gpfs/dell1/nco/ops/com/utility/prod/sev_monitor_logs/prevNEL.log'
alias sos='cd $SOS'
alias dots='cd $DOTS'
alias where='watch --interval=600 "hostname"'
#
# View the SPA Log:
alias vspalog='view $DELLLOG/spalog'
# Edit the SPA log:
alias espalog='$DELLLOG/editspalog'
#
# Check hurricane setup:
alias chkhur='$SOS/chkhur'
#
# free compute nodes:
alias freenodes='/gpfs/dell1/nco/omb/noscrub/Ying.Lin/scripts/tail_nodes_log.sh'
#
# save working directory for a failured job on ecf_ui:
alias savedir=$SOS/save_wk_dir.sh
alias chkfail=$SOS/chk_failure.sh
alias failed=$SOS/failed.sh
alias chkdump=$SOS/chk_dump.sh
alias clock=$SOS/clock.sh
alias xterms=$SOS/xterms.sh
alias bh='bhist -l'
alias dcomwatch=$SOS/watch_for.sh
alias timeleft=$SOS/timeleft.sh
alias timeleft_watch=$SOS/timeleft_watch.sh
alias elog="/u/Ying.Lin/sos/ecflog_summary.sh"
# run log as above, then 'view' the output, opening at its end (the script
# the log summary file name.  Note that "view + `/u/Ying.Lin/sos/ecflog_summary.sh`"
# would just open up the script for view, that's why I'm using "view + `log`".
alias elogv="view + `elog`"

# Command line inventory for MDL's TDLPACK'd files: 
#alias itdlp=/gpfs/dell1/nco/ops/nwprod/blend.v4.0.5/exec/itdlp


# So that cron'd jobs can find the current directory:
export PATH="$PATH":./
