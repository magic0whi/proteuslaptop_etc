#if [ -e /usr/bin/nvidia-smi -a -e /usr/bin/xmllint ]; then
#    logger "Terminate process that using GPU memory >50%"
#    declare -i PIDNUM=$(nvidia-smi -q -x | xmllint --xpath '/nvidia_smi_log/gpu[@id="00000000:01:00.0"]/processes/process_info/used_memory[substring-before(text(),"MiB")>(substring-before(/nvidia_smi_log/gpu[@id="00000000:01:00.0"]/fb_memory_usage/total/text(),"MiB") div 2)]/../pid/text()' -)
#    if [ $PIDNUM -ne 0 ]; then
#        kill -INT $PIDNUM
#        while ps -p $PIDNUM >/dev/null; do sleep 1; done
#        sleep 15
#    fi
#else
#    exit 1
#fi

# Force stop running virtual machines
virsh -c qemu:///system list --state-running --name | xargs -L1 virsh -c qemu:///system destroy
