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

# for wgrib1:
module load libjpeg/9c  # needed for grib_util/1.2.3
module load grib_util/1.2.3

SOS=/u/Ying.Lin/sos
DOTS=/u/Ying.Lin/dots

alias nwprod='cd /lfs/h1/ops/prod/packages'
alias com='cd /lfs/h1/ops/prod/com'
alias comout='cd /lfs/h1/ops/prod/output'
alias logs='cd /lfs/h1/ops/prod/logs'

alias dcom='today=`date +%Y%m%d`; cd /lfs/h1/ops/prod/dcom/$today'
alias dcomtxt='today=`date +%Y%m%d`; cd /lfs/h1/ops/prod/dcom/$today/wtxtbul' 
alias mrms='cd /lfs/h1/ops/prod/dcom/ldmdata/obs/upperair/mrms/conus/RadarOnly_QPE'
alias mrmslmp='cd /lfs/h1/ops/prod/dcom/ldmdata/obs/upperair/mrms/conus/MergedReflectivityQCComposite'
# for jcp_analysis: 
alias abi='cd /lfs/h1/ops/prod/dcom/ldmdata/obs/GOES-16/ABI'

alias ecfdir='cd /lfs/h1/ops/prod/output/ecflow'

alias save='cd /lfs/h1/nco/omb/save/Ying.Lin'
alias noscrub='cd /lfs/h1/nco/omb/noscrub/Ying.Lin'
alias ptmp='dir=/lfs/h1/nco/ptmp/Ying.Lin; if [ ! -d $dir ]; then mkdir -p $dir; fi; cd $dir'
alias stmp='dir=/lfs/h1/nco/stmp/Ying.Lin; if [ ! -d $dir ]; then mkdir -p $dir; fi; cd $dir'

alias rm='rm -i' 
alias lsd='ls -d */'
alias xv=display

alias mecf=/u/Ying.Lin/sos/mecfl_bell.sh
# on wcoss2, vi/view defaults to going to the last location in the file
#   (tracked by ~/.viminfo).  use the '+1' option to open at the top instead,
#   for vspalog.  However 'espalog +1' doesn't work. 
# View the SPA Log:
alias vspalog='view +1 /lfs/h1/ops/prod/logs/spalog'
# Edit the SPA log:
alias espalog='/lfs/h1/ops/prod/logs/editspalog'

alias spaoncall='view /lfs/h1/ops/prod/packages/spa_on_call.v1.0.0/fix/spa.oncall'
alias sos='cd $SOS'
alias dev='cd ~/dev'
alias dots='cd $DOTS'
alias where='watch --interval=600 "hostname"'
alias q='watch --interval=30 "qstat -q"'
alias Q='watch --interval=30 "qstat -Q"'
#
alias sevlog='view + /lfs/h1/ops/prod/com/ecflow/sev_monitor_logs/prevNEL.log'


# WCOSS1 stuff: 

  #Python:
#  module load python/3.6.3
#  module use -a /u/Benjamin.Blake/modulefiles
#  export PYTHONPATH=${PYTHONPATH}:/gpfs/dell2/emc/modeling/noscrub/Jacob.Carley/python/lib/python3.6/site-packages
  # GrADS:
#  module use -a /usrx/local/dev/modulefiles
#  module load GrADS/2.2.0


# 2020/06/13 for SOS work:
# To view the current SPA on-call file:
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
alias killxterms=$SOS/kill_xterms.sh
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
