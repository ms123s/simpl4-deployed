

<sub>In this repository is **not** the source code, the source is [here] (https://github.com/ms123s/simpl4-src)</sub>

<a name="beginId"></a>

[![alt text](https://raw.githubusercontent.com/ms123s/simpl4-deployed/master/etc/images/simpl4_logo.png "simpl4 logo")] (http://www.simpl4.org) Installation
=================



* **Download the [Windows-Installer (11/15/15)] (http://web.simpl4.org/download/simpl4-installer.exe) und execute it.** <br/>
	[now goto finish](#user-content-loginId)<br/>
* **or the best for testing:**
  Download [VirtualBox](https://www.virtualbox.org/wiki/Downloads) and this [Appliance(from 11/18/15)] (http://web.simpl4.org/download/simpl4.ova) and install it.  
			 The root password of the appliance is "simpl4".   
			 Network:nat with portforwarding  
	     127.0.0.1:2222 to 22  
       127.0.0.1:8080 to 80  
       After the start, Wait 1-2 Minutes.<br/>
  Then you can login on [http://localhost:8080/sw/start.html](http://localhost:8080/sw/start.html) with admin/admin <br/>
       [now goto finish](#user-content-createId)<br/>

####alternate, the  manually way(only few steps)

#####Requirement
1. java 1.8.x  
2. git( without "git", you can download a ziparchive on the right site of this page. )

----

#####Going to the destination directory
```bash
$ cd $ROOTDIR
```

#####Cloning this repository
```bash
$ git clone https://github.com/ms123s/simpl4-deployed.git simpl4
$ # or if you have downloaded the Ziparchive, unzip it.
```

#####change to repository directory
```bash
$ cd simpl4
```
----

#####Setup 
```bash
$ bin/setup.sh 
```
or in *windows*
```dos
c:\simpl4> bin\setup 
```
----

#####Starting the server
```bash
$ bin/start.sh start  
```
or in *windows*
```dos
c:\simpl4> bin\start
```

----

#####<a name="loginId"></a>Now you can login on [http://localhost:8080/sw/start.html](http://localhost:8080/sw/start.html)  with admin/admin
![alt text](https://raw.githubusercontent.com/ms123s/simpl4-deployed/master/etc/images/login2-hc.png "simpl4 login2")  

----

#####<a name="createId"></a>Then create your first application or import a example from [here](https://github.com/simpl4-apps) 
![alt text](https://raw.githubusercontent.com/ms123s/simpl4-deployed/master/etc/images/appcreate.png "firstapp")  

* **Hint: after creating the App, you must push the Browser Reloadbutton!**

----

#####Congratulations,you  have Simpl4 succesfully installed, more on  [*simpl4*](http://simpl4.org) or [*a database application in 5 minutes*](http://ms123s.github.io/simpl4-pages/)
