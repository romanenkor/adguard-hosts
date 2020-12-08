FILE=hosts
(
curl https://raw.githubusercontent.com/AdguardTeam/AdguardFilters/master/RussianFilter/sections/adservers_firstparty.txt 2>/dev/null | egrep '^[|]' | cut -c 3- | sed 's/.$//' | grep -v '\$' | tee $FILE
curl https://raw.githubusercontent.com/AdguardTeam/AdguardFilters/master/RussianFilter/sections/adservers.txt 2>/dev/null | egrep '^[|]' | cut -c 3- | sed 's/.$//' | grep -v '\$' | tee $FILE
curl https://raw.githubusercontent.com/AdguardTeam/AdguardFilters/master/SpywareFilter/sections/tracking_servers.txt 2>/dev/null | egrep '^[|]' | cut -c 3- | sed 's/.$//' | grep -v '\$' | tee -a $FILE
curl https://raw.githubusercontent.com/AdguardTeam/AdguardFilters/master/SpywareFilter/sections/tracking_servers_firstparty.txt 2>/dev/null | egrep '^[|]' | cut -c 3- | sed 's/.$//' | grep -v '\$' | tee -a $FILE
) 1>/dev/null
sed -i 's/^/0.0.0.0 /' $FILE
