#/usr/bash

TMP_FILENAME=$(mktemp -ut)
TMP2_FILENAME=$(mktemp -ut)
SITE_ADDR="http://7.khabarfarsi.com/w"

curl -s -o ${TMP_FILENAME} ${SITE_ADDR} 2>/dev/null
grep -oP '<a href="/w/.*?">.*?</a>'  ${TMP_FILENAME} | sed -e 's_/w/__' > ${TMP2_FILENAME}
sed -e 's_<a href="\(.*\)">\(.*\)</a>_\1,\2_'  ${TMP2_FILENAME}

rm -f ${TMP_FILENAME}
rm -f ${TMP2_FILENAME}
