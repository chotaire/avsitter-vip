// [AV]vip by Chotaire Seelowe (Cannibals)
// Use BUTTON SecretMenu*|90210 and remove TOMENU entry for SecretMenu*

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