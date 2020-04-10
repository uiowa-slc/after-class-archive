<?php 
use Psr\SimpleCache\CacheInterface;
use SilverStripe\Core\Injector\Injector;

class SocialParseHelper {

	public static function getJson($url){
		$safeUrl = SocialParseHelper::safe_filename($url);
		$cache = Injector::inst()->get(CacheInterface::class . '.socialCalendarCache');

		if (!$cache->has($safeUrl)) {

			//THIS HELPER FUNCTION DOESNT WORK YET. TODO: FIX!! 
			//$json = SocialParseHelper::fetchJson($url);

			$json = @file_get_contents($url);
		    $cache->set($safeUrl, $json);
		}else{
			$json = $cache->get($safeUrl);
		}			
		return $json;
	}

	public static function safe_filename($filename){
		return preg_replace('/[^0-9a-z\.\_\-]/i','', strtolower($filename));
	}

	public static function fetchJson($url)
	{
		if(function_exists("curl_init")){
			$ch = curl_init();
			curl_setopt($ch, CURLOPT_URL, $url);
			curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
			curl_setopt($ch, CURLOPT_CONNECTTIMEOUT, 1);
			$content = curl_exec($ch);
			curl_close($ch);
			return $content;
		} else {
			return @file_get_contents($url);
		}
	}
}