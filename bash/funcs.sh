function sbttest()
{
    cd $LAB
    sbt console
}
function hf()
{
	echo Opening $1.json
	cd $HOUNDS/files/config/
        vim $1.json 
}

function tlog()
{
    if (($# == 1)); then
         ssh $1 cat /var/log/syslog | python $HOUNDS/scripts/cdi_log_viewer.py
    elif (($2 > 1)); then
        ssh $1 zcat /var/log/syslog.$2.gz | python $HOUNDS/scripts/cdi_log_viewer.py
    elif (($2 > 0)); then
        ssh $1 cat /var/log/syslog.$2 | python $HOUNDS/scripts/cdi_log_viewer.py
    fi
}

function lf()
{
    echo Opening $1 $2
    local file=$1
    if [[ $1 == *.py ]]
        then
         dirn="$(find $CODE -type f -name $1 -exec dirname {} \; | sort -u | head -1)"
         subl -a $dirn/$1
    elif [[ $1 == *.scala ]]
        then 
        dirn="$(find $LAB -type f -name $1 -exec dirname {} \; | sort -u | head -1)"
        idea $dirn/$1 &
    else
        echo Error Opening File
    fi
}
