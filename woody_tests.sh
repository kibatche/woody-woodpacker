#!/bin/bash

#me
TMPDIR=$(mktemp -d)
RESULT_FILE="res"
count=0
error=0
TOTAL=0
rm res &>/dev/null

for file in /bin/*; do
    if readelf -h "$file" 2>/dev/null | grep -qE 'Type:.*(DYN|EXEC)'; then
        ((TOTAL++))
    fi
done

echo "Total : $TOTAL"

# gpt / me
# this function creates a progress bar.
show_progress() {
    local current=$1
    local max=$2
    local percent=$(( (current * 100) / max ))
    local filled=$(( (percent * 40) / 100 ))
    clear
    if [ $percent -lt 50 ]; then
        color="\033[1;31m"
    elif [ $percent -lt 75 ]; then
        color="\033[1;33m"
    else
        color="\033[1;32m"
    fi
    echo -e $color
    printf "\r[%-40s] %d%% ok(%d/%d) errors(%d/%d) \n%s" "$(printf "%-${filled}s" "#" | tr ' ' '#')" "$percent" "$1" "$2" "$4" "$2" "/bin/$3"
    echo -e "\033[0m"
}

#me
# this function tests woody_woodpacker on files in /bin directory if for each binary its type is ET_EXEC/ET_DYN
for file in /bin/*; do
    if readelf -h "$file" 2>/dev/null | grep -qE 'Type:.*(DYN|EXEC)'; then
        cp "$file" $TMPDIR/
        base_name=$(basename "$file")
        if ./woody_woodpacker_debug "$TMPDIR/$base_name" 2>&1>/dev/null; then
            sleep 0.1
            if [ "$base_name" == "gsec" ]; then
                ((total--))
                rm -f "$TMPDIR/$base_name"
                continue
            fi
            if timeout 0.5 ./woody --help 2>&1 | grep -a "....WOODY...">/dev/null; then
                echo -e "\033[1;32m[SUCCESS] $base_name: execution worked\033[m" >> "$RESULT_FILE"
                ((COUNT++))
            else
                echo -e "\033[1;31m[FAIL] $base_name: execution failed or no WOODY marker\033[m" >> "$RESULT_FILE"
                ((ERROR++))
            fi
            rm woody
            rm -f "$TMPDIR/$base_name"
        else
            echo -e "\033[1;33m[WARNING] $base_name: no sufficient space inside the binary\033[m" >> "$RESULT_FILE"
            ((ERROR++))
        fi
    fi
    show_progress $COUNT $TOTAL $base_name $ERROR
done
cat "$RESULT_FILE"
cat "$RESULT_FILE" | wc -l 
echo -e "\nTotal available files : $TOTAL."
echo -e "Total executions of ./woody : $COUNT."
echo -e "Errors : $ERROR"
SUCCESS=$(( COUNT * 100 / TOTAL ))
echo -e "SUCCESS : $SUCCESS%"

