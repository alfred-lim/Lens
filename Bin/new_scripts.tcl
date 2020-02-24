
# cats the file to the lens console

proc cat { fileName } { 
	set fileHandle [open $fileName r] 
	set data [ read $fileHandle [file size $fileName]]
	close $fileHandle
	return $data
}

# creates file
proc touch { args } {
	foreach fileName $args {
		set fileHandle [open $fileName w]
		close $fileHandle	
	}
}
	 
# copies file to specified argument
proc cp {file1 file2} {

	set check1 "."
	if { $file2 == $check1 } {
		set file2 [file tail $file1]
 	}

	set data [cat $file1]
	set fileHandle [open $file2 w]
	puts $fileHandle $data
	close $fileHandle
	}

# simple ls

proc ls {} {

	set dir [pwd]
	foreach fileName [lsort [glob [file join $dir {{.*,*}}]]] {
		set name [file tail $fileName]
		puts "$name"
	}
 }

#ls -l gives directory listing with properties such as time, permissions, etc.

proc ls-l {} {
	
	set dir [pwd]
	set thisYear [clock format [clock seconds] -format %Y]
	
	set retval {}
	set sep {}
	foreach fileName [lsort [glob [file join $dir {{.*,*}}]]] {
	 	append retval $sep
	        set sep \n
	
		file stat $fileName stat
		
		set type -
		if { [info exists stat(type)]  && [string compare file $stat(type)] } {
			set type [string index $stat(type) 0]
		}
	append retval $type

	foreach { mask pairs } {
		00400 { 00400 r }
		00200 { 00200 w }
		04100 { 04100 s 04000 s 00100 x }
		00040 { 00040 r}
		00020 { 00020 w}
		02010 { 02010 s 02000 s 00010 x }
		00004 { 00004 r}
		00002 { 00002 w}
		01001 { 01001 t 01000 T 00001 x }
	   } {
		set value [ expr $stat(mode) & $mask]
		set bit -
		foreach { x b } $pairs {
				if { $value == $x } {
					set bit $b
				}
			} 
		append retval $bit
	}
	
	append retval [format %4d $stat(nlink)] {}
	append retval [format %8d $stat(uid)]
	append retval [format %9d $stat(size)]

	set year [clock format $stat(mtime) -format "%Y"]
	if { $year == $thisYear} {
		set modified [clock format $stat(mtime) -format "%h %e %H:%M"]
	} else {
		set modified [clock format $stat(mtime) -format "%h %e  %Y"]
	}
	
	append retval { } $modified { }
	append retval [file tail $fileName]
	
	unset stat
      }

	return $retval
}

# rm - remove as in unix shell.  redirects to the del command in Dos

proc rm {args} {
	
	foreach fileName $args {
	 	
	 	file delete {-force} $fileName
	
	}
}
