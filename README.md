# AVsitter VIP

## Introduction

Limit access to AVsitter menus to a list of legacy usernames read from notecard

- Compile [AV]vip and place in same prim with other [AV]scripts
- Edit access file and add legacy usernames as desired and copy into same prim
- Inspect AVpos to see an implementation example explained below.

## Download

You can download the latest release from [Github](https://github.com/chotaire/avsitter-vip/releases) or [Chotaire Git](https://git.chotaire.net/cannibals/avsitter-vip/releases)

## AVpos Notes

**BUTTON Hidden\*|90410**

This displays the custom button 'Hidden', using channel 90410 for communications, do not change this number. You can change the button label 'Hidden' to something else, but do not remove the * asterisk behind the name. Remember, do not use 'TOMENU' for this restricted menu as it would override.

**MENU Restricted** 

This is where you put your access restricted entries. You can keep the name 'Restricted' (it will not be visible to the user) or change it to something else as long as it is NOT the same label as BUTTON. If both BUTTON and MENU have the same label, this script will not work.
