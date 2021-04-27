# Dartmud-Lua-Scipts

**<p bold align="center">A [Mudlet](https://www.mudlet.org/) package for playing [DartMUD](http://dartmud.com).</p>**

## Features
DartMUDlet does a number of things for you automatically including the obvious visual items like a conversation window up top, your status persisted in the top right.  It also performs the all-important task of counting and reporting improves (for you and for pets), it handles delaying any new commands to the MUD when you are performing interruptable actions like spellcasting and scrollwork, and has many more features useful to DartMUD players.

## How to use?
Aside from the automatic features described above, there are a few things you can control by entering directives in the mud's text entry box:

```
/setup   - Initialize variables, customize the display, start improve tracking database.
/unsetup - Remove timers and triggers, deactivate display customizations.
/resetup - Remove then reinitialize timers, triggers, etc.  Makes changes to DartMUDLet active.
```
```
/announce on      - Announce improvements in Brief mode (just a plus, no skill name revealed)
/announce verbose - Announce improvements including the full name of the skill
/announce off     - Stop announcing improvements
```
```
/antispam on|off - suppress repeated lines
```
```
/block   - Block any new commands from being sent to the MUD, queue them to be sent later.
           DartMUDlet usually does this for you when it detects the start of interuptable actions.
/unblock - Resume sending commands to the MUD starting with any that were queued while blocking.
           For when you MUST interrupt your previous action (e.g. to run from that dragon NOW).
```
```
/cast ! <spell> @ <power> <spell args> - Repeat practice casting a spell
/cast ! off                            - Stop practicing; remember spell and power
/cast ! resume [<spell>]               - Resume practing last/named spell at the previous power
/cast ! status [of <spell>]            - Show power used for last/named spell
```
```
/channel <power> <target>     - Repeat channelling aura to target, count how many times you did 
/channel off                  - Stop channelling, save target and power level for future resume
/channel resume [<target>]    - Resume channelling last/named target at previous power
/channel status [of <target>] - Show power channeled to last/named target
```
```
/inscribe ! <spell> @ <power> - Repeat practice inscribing a spell at the given power 
/inscribe ! off               - Stop practice inscribing 
/inscribe ! resume [<spell>]  - Resume practice inscribing the last/named spell at last power 
/inscribe ! adjust  power <power> - Change the power you are using for each practice
/inscribe ! status [of <spell>]   - Show power used for last/named spell
```
```
/update <who> <skill> <improves> - Set improves for your (or pet's) skill to given total
/info <skill>                    - Shows current improves/level and improves to reach next
```
```
/who on  - Check who is online every 5 minutes; results are updated in persistent custom area
/who off - Stop issuing automatic checks every 5 minutes; manual 'who' still updates display
```