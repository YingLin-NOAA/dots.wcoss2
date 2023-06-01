# .bashrc

# Source global definitions: as of 2021/09/20, cactus does not have /etc/bashrc
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

export MAN_POSIXLY_CORRECT=1

export PATH="$PATH:/u/$USER/sos"
# for ecf ui:
module load intel ecflow

module load imagemagick/7.0.8-7
module load prod_util/2.0.9

module load python/3.8.6
module load wgrib2/2.0.8

# for wgrib1:
module load libjpeg/9c  # needed for grib_util/1.2.3
module load grib_util/1.2.3

SOS=/u/$USER/sos
DOTS=/u/$USER/dots

alias nwprod='cd /lfs/h1/ops/prod/packages'
alias com='cd /lfs/h1/ops/prod/com'
alias comout='cd /lfs/h1/ops/prod/output'
alias logs='cd /lfs/h1/ops/prod/logs'

alias prod='cat /lfs/h1/ops/prod/config/prodmachinefile'

alias dcom='today=`date +%Y%m%d`; cd /lfs/h1/ops/prod/dcom/$today'
alias dcomtxt='today=`date +%Y%m%d`; cd /lfs/h1/ops/prod/dcom/$today/wtxtbul' 
alias mrms='cd /lfs/h1/ops/prod/dcom/ldmdata/obs/upperair/mrms/conus/RadarOnly_QPE'
alias mrmslmp='cd /lfs/h1/ops/prod/dcom/ldmdata/obs/upperair/mrms/conus/MergedReflectivityQCComposite'
# for jcp_analysis: 
alias abi='cd /lfs/h1/ops/prod/dcom/ldmdata/obs/GOES-16/ABI'

alias ecfdir='cd /lfs/h1/ops/prod/output/ecflow'

alias save='cd /lfs/h1/nco/omb/save/$USER'
alias noscrub='cd /lfs/h1/nco/omb/noscrub/$USER'
alias ptmp='dir=/lfs/h1/nco/ptmp/${USER}; if [ ! -d $dir ]; then mkdir -p $dir; fi; cd $dir'
alias stmp='dir=/lfs/h1/nco/stmp/${USER}; if [ ! -d $dir ]; then mkdir -p $dir; fi; cd $dir'

alias rm='rm -i' 
alias lsd='ls -d */'
alias lss='ls -lc --time-style="+%Y%m%d %H:%M:%S"'  # showing seconds
alias xv=display

alias mecf=/u/$USER/sos/mecfl_bell.sh
# on wcoss2, vi/view defaults to going to the last location in the file
#   (tracked by ~/.viminfo).  use the '+1' option to open at the top instead,
#   for vspalog.  However 'espalog +1' doesn't work. 
# View the SPA Log:
alias vspalog='view +1 /lfs/h1/ops/prod/logs/spalog'
# Edit the SPA log:
alias espalog='/lfs/h1/ops/prod/logs/editspalog'

alias spaoncall='view /lfs/h1/ops/prod/logs/spa.oncall'
alias sos='cd $SOS'
alias dev='cd ~/dev'
alias dots='cd $DOTS'
alias where='watch --interval=600 "hostname"'
alias q='watch --interval=30 "qstat -q"'
alias Q='watch --interval=30 "qstat -Q"'
# alias held='qstat -u ops.prod | grep " H "'
# the '-w' option gives longer job names before truncating:
alias held='qstat -u ops.prod -w | grep " H "'
alias qprod='qstat -u ops.prod'
#
alias sevlog='view + /lfs/h1/ops/prod/com/ecflow/sev_monitor_logs/prevNEL.log'
alias sevtail='watch --interval 30 "grep Sev1 /lfs/h1/ops/prod/com/ecflow/sev_monitor_logs/prevNEL.log | tail"'
# run this from cmon01/dmon01 (show Sev codes in real time):
alias kafka=/ifs/kafka/scripts/nelConsole

# In case the file contains an binary character:
alias grep='grep -a'

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
alias freenodes="pbsnodes -av | grep 'state = free' | wc -l"
#
alias ops.prod="sudo -i -u ops.prod"
alias dfprod="sudo -i -u dfprod"
# save working directory for a failured job on ecf_ui:
alias chkfail=$SOS/chk_failure.sh
alias chkw=$SOS/chk_walltime.sh
alias failed=$SOS/failed.sh
alias chkdump=$SOS/chk_dump.sh
alias clock=$SOS/run_clock.sh
alias xterms=$SOS/xterms.sh
alias xterms_lnx=$SOS/xterms_lnx.sh
alias killxterms=$SOS/kill_xterms.sh
alias dcomwatch=$SOS/watch_for.sh
alias timeleft=$SOS/timeleft.sh
alias timeleft_watch=$SOS/timeleft_watch.sh
alias findgap="python $SOS/find_gap.py"
alias timediff="python $SOS/timediff.py"
alias elog="/u/$USER/sos/ecflog_summary.sh"
# run log as above, then 'view' the output, opening at its end (the script
# the log summary file name.  Note that "view + `/u/Ying.Lin/sos/ecflog_summary.sh`"
# would just open up the script for view, that's why I'm using "view + `log`".
alias elogv="view + `elog`"

# Command line inventory for MDL's TDLPACK'd files: 
alias itdlp=/lfs/h1/ops/prod/packages/blend.v4.0.12/exec/itdlp

alias ncdump=/apps/prod/hpc-stack/intel-19.1.3.304/netcdf/4.7.4/bin/ncdump

# So that cron'd jobs can find the current directory; also add /usr/sbin
#   for 'traceroute':
export PATH="$PATH":./:/usr/sbin/

# /opt/pbs/bin/tracejob does not seem to work:
alias tracejob=/sfs/admin/scripts/tracejob.sh

# FUNCTIONS

function xferlog(){
    h1=`hostname|cut -c 1-1`
    if [ $h1 = 'c' ]
    then
      machine=cactus
    elif [ $h1 = 'd' ]
    then
      machine=dogwood
    else
      echo hostname $hostname not recognized, exit. 
      exit
    fi
    cd /lfs/h1/ops/prod/com/logs/network_monitor/$machine/$(date +"%Y%m%d")
    }

#
# Fred's rtdb:
alias frtdb="sh /u/xinyang.liu/bin/rtdb"

# From Justin, 2023/04/28:
alias nodesum="/sfs/admin/scripts/showcc -n"

alias slownode=/u/diane.stokes/bin/node_runtimes.sh

# To use: gchkw /prod/primary/06/gfs/v16.3/gfs/jgfs_forecast
#         gchkw  /prod/primary/00/hrrr/v4.1/00z/conus/jhrrr_analysis
alias gchkw='/u/gregory.mott/on_call_tools/daily_general.sh "$(date +"%Y%m%d")" 6'

