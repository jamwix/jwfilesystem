package com.jamwix;

import openfl.Lib;
import sys.FileSystem;
import sys.FileStat;

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
	#end
	
}


