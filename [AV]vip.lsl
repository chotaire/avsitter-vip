// [AV]vip (c) 2019 Chotaire Seelowe (Cannibals)
// https://git.chotaire.net/cannibals/avsitter-vip

// 1. Compile [AV]vip and place in same prim with other [AV]scripts
// 2. Edit access file and add legacy usernames as desired and copy into same prim
// 3. Inspect AVpos to see an implementation example explained below.

// AVpos Notes:

// BUTTON VIP*|90210
// This displays the custom button ‘VIP’, using channel 90210 for communications, 
// do not change this number. You can change the button label ‘VIP’ to something 
// else, but do not remove the * asterisk behind the name. Remember, do not use 
// 'TOMENU' option for this restricted menu as it would override.

// MENU VIP
// This is where you put your access restricted entries but remember to change 
// ‘VIP’ to the same label as used for the button.

string version = "v0.1";
list aWhiteList = [];
integer aLine;
key aQuery;
key avatar;
key owner;
integer ready = 0;
integer ready2 = 0;

default
{
    
    state_entry()
    {
            aQuery = llGetNotecardLine("access", 0);
    }

     dataserver(key QID, string data)
    {
        if(aQuery == QID)
        {
            if (data != EOF)
            {
                aWhiteList += [llStringTrim(data,STRING_TRIM)];
                aQuery = llGetNotecardLine("access", ++aLine);
                ready = 1;
            }               
            else
            {
                llWhisper(0, "[AV]vip - Loaded VIPs with elevated access.");
                ready2 = 1;
                if (ready == 1) 
                    {
                    llWhisper(0, "[AV]vip - Version " + version + " ready.");
                    state running;
                    }
            }
        }
    }
}

state running
{
    link_message(integer sender, integer num, string msg, key id)
    {
        
        if(num == 90210)
        {
            integer idx = llListFindList(aWhiteList,[llKey2Name(id)]);
            
            if(id == llGetOwner() || (~idx)) 
            {
                llMessageLinked(LINK_SET, 90005, "Sex", id);
                llOwnerSay("DEBUG: Access granted to " + llKey2Name(id) + ".");
            }
            else 
            {
                llMessageLinked(LINK_SET, 90004, "", id);
                llOwnerSay("DEBUG: Access denied to " + llKey2Name(id) + ".");
                llRegionSayTo(id, 0, "Access denied.");
            }
        }
    }
    
    changed(integer change)
    {
        if (change & CHANGED_INVENTORY)
        {
            llResetScript();
        }
    }  
}