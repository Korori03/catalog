<?php
/*
	* Files Class Set
	* @Version 4.0.0
	* Developed by: Ami (亜美) Denault
*/
/*
	* Files
	* @Since 4.5.1
*/

declare(strict_types=1);
class file
{

	private static $dir_ignore = array('.git'),
		$files_ignore = array('.htaccess', '.htpasswd', '.gitignore');


	/*
	* If File Exist
	* @Since 4.0.2
	* @Param (String Basefile,Array Extension)
*/
	public static function _exist(string $base_filename,array $possible_extensions = array()): bool
	{
		$possible_extensions = cast::_array($possible_extensions);
		if (strlen(pathinfo($base_filename)['extension']) == 0) {
			foreach ($possible_extensions as $extension) {
				$file = "$base_filename.$extension";
				if (file_exists($file))
					return true;
			}
		} else {
			$file = $base_filename;
			if (file_exists($file))
				return true;
		}
		return false;
	}

/*
	* Remove Dir
	* @Since 4.0.2
	* @Param (String Directory)
*/
	public static function _rmdir(string $dirname): bool
	{
		if (!is_dir($dirname))
			return false;
		else {
			@rmdir($dirname);
			return true;
		}
	}

/*
	* Remove File
	* @Since 4.0.2
	* @Param (String File)
*/
	public static function _rmfile(string $filename): bool
	{
		if (!is_file($filename))
			return false;
		else {
			@unlink($filename);
			return true;
		}
	}

/*
	* List Files in Directory
	* @Since 4.0.2
	* @Param (String Directory)
*/
	public static function _list(string $dir = '.'): array
	{
		$list = array();

		if (is_dir($dir)) {
			if ($handle = opendir($dir)) {
				while (false !== ($entry = readdir($handle))) {
					if ($entry != "." && $entry != ".." && !in_array($entry, self::$dir_ignore) && !in_array($entry, self::$files_ignore))
						array_push($list, $entry);
				}
				closedir($handle);
			}
		}

		return $list;
	}

	/*
	* Get Extension
	* @since 4.0.0
	* @param (String File)
*/
	public static function _extension(string $str): string
	{
		$str_array = explode('.', $str);
		return string::_strtolower(end($str_array));
	}

/*
	* Extension Allowed
	* @Since 2.2.8
	* @Param (String File, String Extension)
*/
	public static function allowedExt(string $string,string $ext = 'jpg,jpeg,gif,png'): bool
	{
		$extension =  self::_extension($string);

		$all_types = explode(",", $ext);
		if ($ext) {
			if (in_array($extension, $all_types))
				return true;
		}
		return false;
	}
}
