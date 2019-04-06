# AVsitter VIP

Limit access to menu by reading single usernames from access file

- Compile [AV]vip and place in same prim with other [AV]scripts
- Edit access file and add legacy usernames as desired and copy into same prim
- Inspect AVpos to see an implementation example explained below.

BUTTON VIP*|90210 (This displays the custom button, using channel 90210 for communications, do not change this number. You can change the button label 'VIP' to something else, but do not remove the * behind the name either.)

MENU VIP (This is where you put your access restricted entries but remember to change 'VIP' to the same label used for the button)

In the supplied AVpos example we have to SitTargets so that is why you see both BUTTON VIP* and MENU VIP twice. Enjoy!
