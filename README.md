# hubot-hearthstone

Get the stats for a [Hearthstone](http://us.battle.net/hearthstone/en/) card through Hubot via [Hearthstone API](http://hearthstoneapi.com/)

Environment Variables
-----
```
HEARTHSTONE_API=<YOUR_MASHABLE_API_KEY>
```

Commands
-----
```
<botname> hs me <Hearthstone card> - Return <Hearthstone card>'s information
```

Examples
-----
```
<botname> hs me edwin vancleef
<hubot> Edwin VanCleef - Mana: 3 - Race: None - Type: Minion - Attack/Health: 2/2 - Descr: Combo: Gain +2/+2 for each card played earlier this turn.
<hubot> Flavor: He led the Stonemasons in the reconstruction of Stormwind, and when the nobles refused to pay, he founded the Defias Brotherhood to, well, deconstruct Stormwind. 
<hubot> http://hearthstonecards.herokuapp.com/cards/medium/EX1_613.png 
```
