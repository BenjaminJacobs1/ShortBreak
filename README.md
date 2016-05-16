#  NS2 Shine ShortBreak

This plugin add a button to allow players to take a "short break" and
to be immune for a maximum of 5 minutes from afkkick plugin.

When you click on the button you are put into spectator team.
When you join a team after your break the immunity is revoked.

This plugin require Shine mod enabled on the server to be able to run.
You also need to add the plugin in your shine/BaseConfig.json, 
under the "ActiveExtensions" add: "shortbreak":true

!!!Because the plugin inherit from the default afkkick plugin, 
!!!you need to disable it in your shine/BaseConfig.json (or via the shine adminmenu)
!!! "ActiveExtensions" set: "afkkick":false else the plugin will remain disabled.

The plugin use the afkkick.json configuration file.

This Plugin is under development,
Please report any issue.
The plugin is available in github: https://github.com/BenjaminJacobs1/ShortBreak
If you are looking for documentation about shine in general, take a look here:
https://github.com/Person8880/Shine/wiki

Recommandation:
People taking a break should be immune to shuffle, thus you should edit the VoteRandom.json
and set  "IgnoreSpectators" to true.

TODO list:
-	Add translations
-	Add configurations options to change the afktime
	

Version:
0.1: First version
0.2: Fix conflict problem with afkkick.

