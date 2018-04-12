#! /bin/bash

# program to output a system information page

# 常量
PROGNAME=$(basename $0)
TITLE="System Information Report For $HOSTNAME"
CURRENT_TIME=$(date +"%x %r %Z")
TIME_STAMP="Generated $CURRENT_TIME, by $USER"

# 函数们
function report_uptime {
    cat << _EOF_
<h2>System Uptime</h2>
<pre>$(uptime)<pre>
_EOF_
    return
}

function report_disk_space {
    cat << _EOF_
<h2>Disk Space Utilization</h2>
<pre>$(df -h)</pre>
_EOF_
}

function report_home_space {
    if [ $(id -u) -eq 0 ]; then
    cat << _EOF_
<h2>Home Space Utilization</h2>
<pre>du -sh /home/*</pre>
_EOF_
    else
    cat << _EOF_
<h2>Home Space Utilization</h2>
<pre>du -sh $HOME</pre>
_EOF_
    fi
    return
}

function usage {
    echo "$PROGNAME: usage: $PROGNAME [-f file | -i]"
    return
}

function write_html_page {
    cat << _EOF_
<html>
    <head>
        <title>$TITLE</title>
    </head>
    <body>
        <h1>$TITLE</h1>
        <p>$TIME_STAMP</p>
        $(report_uptime)
        $(report_disk_space)
        $(report_home_space)
    </body>
</html>
_EOF_
    return
}

# process command line options

interactive=
filename=

# 这里要特别注意防范 $1 为空的情况
# 若 $1 为空
# [[ -n $1 ]] 会扩展成 [[ -n '' ]] 退出状态为 1
# 而 test -n $1 会扩展成 test -n 退出状态为 0
# 从而导致循环多一次提前结束了程序
# ❌ while test -n $1
# ❌ while [ -n $1 ]
# ❌ while [ -n "$1" ]
# ✅while [[ -n $1 ]]
while test -n "$1" ; do
    case $1 in
        -f | --file) shift
            filename=$1
            ;;
        -i | --interactive) interactive=1
            ;;
        -h | --help) usage
            exit
            ;;
        *) usage >&2
            exit 1
            ;;
    esac
    shift
done

echo $interactive # TESTING
echo $filename # TESTING

# interactive mode
if test -n "$interactive"; then
    while true; do
        read -p "Enter name of output file: " filename
        if test -e "$filename" ; then
            read -p "$filename exists. Overwrite? [y/n/q] > "
            case $REPLY in
                y|Y) break ;;
                q|Q) echo "Program terminated" 
                exit
                ;;
                *) continue;;
            esac
        else
            break
        fi
    done
fi

echo $filename # TESTING

# output html page
if test -n "$filename"; then
    if touch $filename && test -f "$filename"; then
        write_html_page > $filename
    else
        echo "$PROGNAME: Cannot write file '$filename'" >&2
    fi
else
    write_html_page
fi