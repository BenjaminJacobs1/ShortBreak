#  NS2 Shine ShortBreak

This plugin add a button to allow players to take a "short break" and
to be immune for a maximum of 5 minutes from afkkick plugin.

This plugin require Shine mod enabled on the server to be able to run.
You also need to add the plugin in your shine/BaseConfig.json, 
under the "ActiveExtensions" add: "shortbreak":true

!!! because the plugin inherit from the default afkkick plugin, you need to disable it in your shine/BaseConfig.json
!!! "ActiveExtensions" set: "afkkick":false else the plugins will enter in conflict and the sever could crash.

The plugin use the afkkick.json configuration file.

This Plugin is under development,
Please report any issue.
The plugin is available in github: https://github.com/BenjaminJacobs1/ShortBreak

TODO list:
-	Add translations
-	Add configurations options to change the afktime
-	Find a way to unload the plugin if afkkick is enabled to avoid conflict and potential server crash.
	

Version:
0.1: First version

