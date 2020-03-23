# rkorova

bad userland LD_PRELOAD rootkit 

## Features 
* important strings are xor'ed out 
* hiding through magic GID
* memory cleaning
* is not detected by rkhunter  
* totally awful

```
 ______     __  __     ______     ______     ______     __   __   ______    
/\  == \   /\ \/ /    /\  __ \   /\  == \   /\  __ \   /\ \ / /  /\  __ \   
\ \  __<   \ \  _"-.  \ \ \/\ \  \ \  __<   \ \ \/\ \  \ \ \'/   \ \  __ \  
 \ \_\ \_\  \ \_\ \_\  \ \_____\  \ \_\ \_\  \ \_____\  \ \__|    \ \_\ \_\ 
  \/_/ /_/   \/_/\/_/   \/_____/   \/_/ /_/   \/_____/   \/_/      \/_/\/_/ 
                                                                          
```
## Installation
* step 1: change default values 
* step 2: run compile.sh to compile 
* step 3: create magic user 
* step 4: replace ld_preload with librkorova.so
* step 5: set your magic env var in ~/.bash_profile or whatever 
* step 6: hide all files/procs with magic GID 

rkorova will (ideally) hide any files that are under the magic GID. It will also hide anythingthat contains the magic string in its path. However, this is inconsistently implemented (because I wrote this as an amateur when I was 16) and will occasionally break things. For example, you will not be able to open rk.c when rkorova is loaded, probably because the source file contains the magic string somewhere. I am currently in the process of cleaning up my code, implementing a proper backdoor and fixing my bugs.  

## Known Issues 
rkorova is not actually meant to be deployed in a real situation and still lacks a lot of features "real" rootkits have. I am not responsible for any illegal / stupid things that happen because you decided to act el8 in front of your friends on IRC 
* If a file is hidden, it will appear in bash autocomplete but cannot be interacted with. I suggest you prefix all files/dirs you intend to hide with .
	* I'm still not sure exactly why this is the case, but it appears as if autocomplete does not use the hooked glibc wrappers and instead uses the getdents syscall directly. This isn't something that I can really fix without messing with syscalls, so refer to [fentanull](https://github.com/blacchat/fentanull) if you want something that runs in ring0. 
## Default values: 
* MAGIC = "mochi"
* MAGICGID = 1337 
* EXECPW = installgentoo
* SHELLPW = bl1ng
* PROC = /proc
* DEFAULT_PORT = 61040
* IP = 127.0.0.1
* XOR key = 0x2A  

Use xor.py to set values.

## References 

* https://haxelion.eu/article/LD_NOT_PRELOADED_FOR_REAL/
* Reverse Engineering for Beginners by Denis Yurichev
* http://fluxius.handgrep.se/2011/10/31/the-magic-of-ld_preload-for-userland-rootkits/
* https://blog.fpmurphy.com/2012/09/all-about-ld_preload.html
