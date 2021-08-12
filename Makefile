default:
	@curl -LO https://raw.githubusercontent.com/StevenBlack/hosts/master/hosts
	@curl -LO https://s3.amazonaws.com/lists.disconnect.me/simple_tracking.txt
	@curl -LO https://s3.amazonaws.com/lists.disconnect.me/simple_ad.txt
	@curl -LO https://raw.githubusercontent.com/AdguardTeam/cname-trackers/master/combined_disguised_trackers_justdomains.txt
	@curl -LO https://raw.githubusercontent.com/RPiList/specials/master/Blocklisten/easylist
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
	@cat AdguardDNS.txt >> temp.txt
	@sort temp.txt | uniq -u | sed '/^#/d' > all_combined.txt
	@sed -i 's/0.0.0.0 //g' all_combined.txt
	@sed -i 's/0.0.0.0//g' all_combined.txt
	@rm -f temp.txt
	@rm -f hosts
	@rm -f simple_tracking.txt
	@rm -f simple_ad.txt
	@rm -f combined_disguised_trackers_justdomains.txt
	@rm -f easylist
	@rm -f AdguardDNS.txt
