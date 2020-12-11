FILE=hosts
(
curl https://raw.githubusercontent.com/AdguardTeam/AdguardFilters/master/RussianFilter/sections/adservers_firstparty.txt 2>/dev/null | egrep '^[|]' | cut -c 3- | sed 's/.$//' | grep -v '\$' | tee $FILE
curl https://raw.githubusercontent.com/AdguardTeam/AdguardFilters/master/RussianFilter/sections/adservers.txt 2>/dev/null | egrep '^[|]' | cut -c 3- | sed 's/.$//' | grep -v '\$' | tee $FILE
curl https://raw.githubusercontent.com/AdguardTeam/AdguardFilters/master/SpywareFilter/sections/tracking_servers.txt 2>/dev/null | egrep '^[|]' | cut -c 3- | sed 's/.$//' | grep -v '\$' | tee -a $FILE
curl https://raw.githubusercontent.com/AdguardTeam/AdguardFilters/master/SpywareFilter/sections/tracking_servers_firstparty.txt 2>/dev/null | egrep '^[|]' | cut -c 3- | sed 's/.$//' | grep -v '\$' | tee -a $FILE
) 1>/dev/null
sed -i 's/^/0.0.0.0 /' $FILE

FILE=windows-telemetry
(
curl https://gist.githubusercontent.com/tildebyte/b70ea62e38832197c07ac046899f25c8/raw/703edc9e4c9453ff066622623dca372406c8bced/ms_tracking_domains_blocklist.txt 2>/dev/null | tee -a $FILE
) 1>/dev/null
sed -i 's/^/0.0.0.0 /' $FILE
