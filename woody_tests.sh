#!/bin/bash

#me
TMPDIR=$(mktemp -d)

count=0
error=0
total=0
rm res &>/dev/null

for file in /bin/*; do
    if readelf -h "$file" 2>/dev/null | grep -qE 'Type:.*(DYN|EXEC)'; then
        ((total++))
    fi
done

echo "Total : $total"

# gpt / me
show_progress() {
    local current=$1
    local max=$2
    local percent=$(( (current * 100) / max ))
    local filled=$(( (percent * 40) / 100 ))
    clear
    if [ $percent -lt 50 ]; then
        color="\033[31m"
    elif [ $percent -lt 75 ]; then
        color="\033[33m"
    else
        color="\033[32m"
    fi
    echo -e $color
    printf "\r[%-40s] %d%% ok(%d/%d) errors(%d/%d) \n%s" "$(printf "%-${filled}s" "#" | tr ' ' '#')" "$percent" "$1" "$2" "$4" "$2" "/bin/$3"
    echo -e "\033[0m"
}

#me
base_name
for file in /bin/*; do
    if readelf -h "$file" 2>/dev/null | grep -qE 'Type:.*(DYN|EXEC)'; then
        cp "$file" $TMPDIR/
        base_name=$(basename "$file")
        if ./woody_woodpacker_debug "$TMPDIR/$base_name" 1>/dev/null; then
            sleep 0.1
            if [ "$base_name" == "gsec" ]; then
                ((total--))
                continue
            fi
            printf "%s :\n" "$base_name" >> res
            timeout --foreground 0.5 ./woody_test --help "$TMPDIR/$base_name" 2>/dev/null | grep -a "....WOODY..." &>> ./res
            rm woody_test
            rm -f "$TMPDIR/$base_name"
            ((count++))
        else
            ((error++))
        fi
    fi

    show_progress $count $total $base_name $error
done

echo -e "\nTotal available files : $total."
echo -e "Total executions of ./woody_test: $count."
echo -e "Errors : $error"
