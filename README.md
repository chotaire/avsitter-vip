# AVsitter VIP

## Introduction

Limit access to AVsitter menus by reading single usernames from access file

- Compile [AV]vip and place in same prim with other [AV]scripts
- Edit access file and add legacy usernames as desired and copy into same prim
- Inspect AVpos to see an implementation example explained below.

## AVpos Notes

**BUTTON VIP\*|90210**
This displays the custom button 'VIP', using channel 90210 for communications, do not change this number. You can change the button label 'VIP' to something else, but do not remove the * asterisk behind the name. Remember, do not use TOMENU as it would override. If you already have a line TOMENU for this restricted menu then remove it.

**MENU VIP** 
This is where you put your access restricted entries but remember to change 'VIP' to the same label used for the button.

Enjoy!
