package com.jamwix;

import openfl.Lib;
import sys.FileSystem;
import sys.FileStat;

#if (android && openfl)
import openfl.utils.JNI;
#end

class JWFileSystem {
	

	public static function exists( path : String ) : Bool
	{
#if ios
		return filesystem_exists(path); 
#else
		return FileSystem.exists(path);
#end
	}

	public static function rename( path : String, newPath : String ) : Void
	{
#if ios
		filesystem_rename(path, newPath);
#else
		FileSystem.rename(path, newPath);
#end
	}

	public static function stat( path : String ) : FileStat
	{
		return FileSystem.stat(path);
	}

	public static function fullPath( relPath : String ) : String
	{
		return FileSystem.fullPath(relPath);
	}

	public static function isDirectory( path : String ) : Bool
	{
		return FileSystem.isDirectory(path);
	}

	public static function createDirectory( path : String ) : Void
	{
#if ios
		filesystem_createdirectory(path);
#else
		FileSystem.createDirectory(path);
#end
	}

	public static function deleteFile( path : String ) : Void
	{
#if ios
		filesystem_deletefile(path);
#else
		FileSystem.deleteFile(path);
#end
	}

	public static function deleteDirectory( path : String ) : Void
	{
#if ios
		filesystem_deletedirectory(path);
#else
		FileSystem.deleteDirectory(path);
#end
	}

	public static function readDirectory( path : String ) : Array<String>
	{
		return FileSystem.readDirectory(path);
	}

	public static function noBackup( path : String ) : Void
	{
#if ios
		filesystem_nobackup(path);
#end
	}

	public static function clientVersion():String
	{
#if (ios || android)
		return filesystem_clientversion();
#end
		return null;
	}
	
	public static function setKey(key:String, value:String):Void
	{
#if ios
		filesystem_set_key(key, value);
#end
	}

	public static function getKey(key:String):String
	{
#if ios
		return filesystem_get_key(key);
#end
		return null;
	}

	public static function syncStore():Bool
	{
#if ios
		return filesystem_sync_store();
#end
		return false;
	}

	public static function currencyCode():String
	{
#if (ios || android)
		return filesystem_currency_code();
#end
		return null;
	}

	public static function physicalMemory():Int
	{
#if ios
		return filesystem_physical_memory();
#end
		return -1;
	}

	public static function isSonyDevice():Bool
	{
#if android
		return filesystem_issonydevice();
#end
		return false;
	}
	// Native Methods
	
	
	#if ios
	private static var filesystem_exists = 
		Lib.load ("jwfilesystem", "jwfilesystem_exists", 1);
	private static var filesystem_rename = 
		Lib.load ("jwfilesystem", "jwfilesystem_rename", 2);
	private static var filesystem_createdirectory = 
		Lib.load ("jwfilesystem", "jwfilesystem_createdirectory", 1);
	private static var filesystem_deletefile = 
		Lib.load ("jwfilesystem", "jwfilesystem_deletefile", 1);
	private static var filesystem_deletedirectory = 
		Lib.load ("jwfilesystem", "jwfilesystem_deletedirectory", 1);
	private static var filesystem_nobackup = 
		Lib.load ("jwfilesystem", "jwfilesystem_nobackup", 1);
	private static var filesystem_clientversion = 
		Lib.load ("jwfilesystem", "jwfilesystem_clientversion", 0);
	private static var filesystem_set_key =
		Lib.load("jwfilesystem", "jwfilesystem_set_key", 2);
	private static var filesystem_get_key =
		Lib.load("jwfilesystem", "jwfilesystem_get_key", 1);
	private static var filesystem_sync_store =
		Lib.load("jwfilesystem", "jwfilesystem_sync_store", 0);
	private static var filesystem_currency_code =
		Lib.load("jwfilesystem", "jwfilesystem_currency_code", 0);
	private static var filesystem_physical_memory =
		Lib.load("jwfilesystem", "jwfilesystem_physical_memory", 0);
	#end

#if android
	private static var filesystem_clientversion = 
		JNI.createStaticMethod("com.jamwix.JWFileSystem", "getVersion", "()Ljava/lang/String;");
	private static var filesystem_issonydevice = 
		JNI.createStaticMethod("com.jamwix.JWFileSystem", "isSonyDevice", "()Z");
	private static var filesystem_currency_code =
		JNI.createStaticMethod("com.jamwix.JWFileSystem", "getCurrencyCode", "()Ljava/lang/String;");
#end
	
}


