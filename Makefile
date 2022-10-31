update:
	@curl -LO https://raw.githubusercontent.com/StevenBlack/hosts/master/hosts
	@curl -LO https://s3.amazonaws.com/lists.disconnect.me/simple_tracking.txt
	@curl -LO https://s3.amazonaws.com/lists.disconnect.me/simple_ad.txt
	@curl -LO https://raw.githubusercontent.com/AdguardTeam/cname-trackers/master/combined_disguised_trackers_justdomains.txt
	@curl -LO https://raw.githubusercontent.com/RPiList/specials/master/Blocklisten/easylist
	@curl -LO https://raw.githubusercontent.com/RPiList/specials/master/Blocklisten/crypto
	@curl -LO 	https://v.firebog.net/hosts/AdguardDNS.txt
	@cat blacklist.txt >> temp.txt
	@cat combined_disguised_trackers_justdomains.txt >> temp.txt
	@cat hosts >> temp.txt
	@cat justdomains.txt >> temp.txt
	@cat simple_ad.txt >> temp.txt
	@cat simple_tracking.txt >> temp.txt
	@cat spotify.txt >> temp.txt
	@cat sysctl-org-cameleon-hosts.txt >> temp.txt
	@cat Win10Telemetry.txt >> temp.txt
	@cat Win10Telemetry-extended.txt >> temp.txt
	@cat windows-2004-endpoints.txt >> temp.txt
	@cat easylist >> temp.txt
	@cat crypto >> temp.txt
	@cat amazon.txt >> temp.txt
	@cat AdguardDNS.txt >> temp.txt
	@sed -i 's/::1 ip6-localhost//g' temp.txt
	@sed -i 's/::1 ip6-loopback//g' temp.txt
	@sed -i 's/::1 localhost//g' temp.txt
	@sed -i 's/*.tt.omtrdc.net//g' temp.txt
	@# remove white space at the start of a line
	@sed -i 's/^[ \t]*//' temp.txt
	@# remove backslach
	@sed -i 's/\\//g' temp.txt
	@# remove apostroph
	@sed -i s/"'"/""/g temp.txt
	@# sort all lines 1-9az-A-Z and remove lines starting with #
	@sort temp.txt | sed '/^#/d' > temp2.txt
	@sed '/./!d' temp2.txt > all_combined.txt
	@# remove all leading 0.0.0.0
	@sed -i 's/0.0.0.0 //g' all_combined.txt
	@rm -f temp.txt
	@rm -f temp2.txt
	@rm -f hosts
	@rm -f simple_tracking.txt
	@rm -f simple_ad.txt
	@rm -f combined_disguised_trackers_justdomains.txt
	@rm -f easylist
	@rm -f crypto
	@rm -f AdguardDNS.txt
