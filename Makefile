update:
	@git gc
	@git pull
	@curl -s -LO https://raw.githubusercontent.com/StevenBlack/hosts/master/hosts
	@curl -s -LO https://s3.amazonaws.com/lists.disconnect.me/simple_tracking.txt
	@curl -s -LO https://s3.amazonaws.com/lists.disconnect.me/simple_ad.txt
	@curl -s -LO https://raw.githubusercontent.com/AdguardTeam/cname-trackers/master/data/combined_disguised_ads_justdomains.txt
	@curl -s -LO https://raw.githubusercontent.com/RPiList/specials/master/Blocklisten/easylist
	@curl -s -LO https://v.firebog.net/hosts/AdguardDNS.txt
	@curl -s -LO https://o0.pages.dev/Lite/domains.txt
	@cat blacklist.txt > temp.txt
	@cat hihonor.txt >> temp.txt
	@cat combined_disguised_ads_justdomains.txt >> temp.txt
	@cat hosts >> temp.txt
	@cat justdomains.txt >> temp.txt
	@cat samsung.txt >> temp.txt
	@cat simple_ad.txt >> temp.txt
	@cat simple_tracking.txt >> temp.txt
	@cat spotify.txt >> temp.txt
	@cat sysctl-org-cameleon-hosts.txt >> temp.txt
	@cat windows-10-Telemetry.txt >> temp.txt
	@cat windows-10-Telemetry-extended.txt >> temp.txt
	@cat windows-2004-endpoints.txt >> temp.txt
	@cat easylist >> temp.txt
	@cat amazon.txt >> temp.txt
	@cat AdguardDNS.txt >> temp.txt
	@cat domains.txt >> temp.txt
	@sed -i 's/::1 ip6-localhost//g' temp.txt
	@sed -i 's/::1 ip6-loopback//g' temp.txt
	@sed -i 's/::1 localhost//g' temp.txt
	@sed -i 's/fe80::1%lo0 localhost//g' temp.txt
	@sed -i 's/fe #00::0 ip6-localnet//g' temp.txt
	@sed -i 's/ff #00::0 ip6-mcastprefix//g' temp.txt
	@sed -i 's/*.tt.omtrdc.net//g' temp.txt
	@# remove white space at the start of a line
	@sed -i 's/^[ \t]*//' temp.txt
	@# remove backslach
	@sed -i 's/\\//g' temp.txt
	@# remove apostroph
	@sed -i s/"'"/""/g temp.txt
	@# sort all lines 1-9az-A-Z and remove lines starting with #
	@sort temp.txt | sed '/^#/d' > temp2.txt
	@sed '/./!d' temp2.txt > temp3.txt
	@# remove all leading 0.0.0.0
	@sed -i 's/0.0.0.0 //g' temp3.txt
	@# remove all lines starting with -
	@sed -i '/^-/d' temp3.txt
	@sed -i '/^_/d' temp3.txt
	@sed -i '/^\*/d' temp3.txt
	@sed -i '/^10\.10\.34\./d' temp3.txt
	@sed -i '/404: Not Found# Title: StevenBlack\/hosts/d' temp3.txt
	@sed -i '1d' temp3.txt
	@# remove duplicates
	@sort temp3.txt | uniq > all_combined.txt
	@# clean up
	@rm -f temp.txt
	@rm -f temp2.txt
	@rm -f temp3.txt
	@rm -f hosts
	@rm -f simple_tracking.txt
	@rm -f simple_ad.txt
	@rm -f combined_disguised_ads_justdomains.txt
	@rm -f easylist
	@rm -f AdguardDNS.txt
	@rm -f domains.txt
