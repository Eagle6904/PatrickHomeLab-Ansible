#!/bin/bash

DATE=$(date +"%Y-%m-%d_%H-%M")
REPORT_DIR="$HOME/ansible/reports/weekly"
LOG_FILE="$REPORT_DIR/week-$DATE.log"

cd ~/ansible

echo "PatrickHomeLab Weekly Patch Report" > $LOG_FILE
echo "Run Date: $(date)" >> $LOG_FILE
echo "-----------------------------------" >> $LOG_FILE

ansible-playbook -i inventory/hosts.ini playbooks/update.yml >> $LOG_FILE 2>&1

echo "" >> $LOG_FILE
echo "Run Complete: $(date)" >> $LOG_FILE

mail -s "PatrickHomeLab Weekly Patch Report" richardsonpatrickr@gmail.com < $LOG_FILE

# Monthly summary logic
WEEKLY_COUNT=$(ls $REPORT_DIR | wc -l)

if [ "$WEEKLY_COUNT" -ge 4 ]; then
    MONTH_REPORT="$HOME/ansible/reports/monthly/month-$(date +%Y-%m).log"

    echo "PatrickHomeLab Monthly Patch Summary" > $MONTH_REPORT
    echo "Generated: $(date)" >> $MONTH_REPORT
    echo "-----------------------------------" >> $MONTH_REPORT

    cat $REPORT_DIR/*.log >> $MONTH_REPORT

    mail -s "PatrickHomeLab Monthly Patch Summary" richardsonpatrickr@gmail.com < $MONTH_REPORT

    rm $REPORT_DIR/*.log
fi
