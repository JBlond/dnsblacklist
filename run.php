<?php
$url = 'https://reports.exodus-privacy.eu.org/api/trackers';
$curl = curl_init();
$options = [
	CURLOPT_URL => $url,
    CURLOPT_RETURNTRANSFER => true,
    CURLOPT_AUTOREFERER => true,
    //CURLOPT_VERBOSE => true,
    CURLOPT_SSL_VERIFYPEER => false,
];
curl_setopt_array($curl, $options);
$json = curl_exec($curl);
$array = json_decode($json,true);
foreach($array['trackers'] as $tracker) {
	echo str_replace(
		[
			'https://',
			'http://'
		],
		[
			'',
			''
		],
		$tracker['website']
	);
	echo "\n";
}
