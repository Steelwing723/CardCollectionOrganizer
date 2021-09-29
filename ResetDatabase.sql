/*DROP TABLES*/
DROP TABLE DECK;
DROP TABLE COLLECTION;
DROP TABLE PLAYER;
DROP TABLE CARD;

/*CREATE TABLES*/
CREATE TABLE CARD(
RELEASE_SET char(50),
SET_NUMBER int,
NAME char(50) NOT NULL,
MANA_COST char(25) NOT NULL,
CARD_TYPE char(50) NOT NULL,
RARITY char(1) NOT NULL,
ARTIST char(50) NOT NULL,
PRICE DECIMAL(5,2) NOT NULL,
PRIMARY KEY 	(RELEASE_SET, SET_NUMBER)
);

CREATE TABLE PLAYER(
ID int,
NAME char(50) NOT NULL,
FAVORITE_COLOR char(10) NOT NULL,
PRIMARY KEY 	(ID)
);

CREATE TABLE DECK(
NAME char(50),
OWNER_ID int,
CARD_NAME char(50),
QUANTITY int NOT NULL,
PRIMARY KEY 	(NAME, OWNER_ID, CARD_NAME),
FOREIGN KEY (OWNER_ID) REFERENCES PLAYER(ID) ON DELETE RESTRICT
);

CREATE TABLE COLLECTION(
OWNER_ID int,
CARD_NAME char(50),
CARD_SET char(50),
QUANTITY int NOT NULL,
IN_USE int NOT NULL,
PRIMARY KEY 	(OWNER_ID, CARD_NAME, CARD_SET)
);

/*INSERT DATA INTO TABLES*/

-- INSERT INTO CARD VALUES (NAME, RELEASE_SET, COLOR, RARITY);
-- INSERT INTO PLAYER VALUES (ID, NAME, FAVORITE_COLOR, DECK_NAME);
-- INSERT INTO DECK VALUES (NAME, PLAYER_ID, CARD_NAME, COPIES);

INSERT INTO CARD VALUES ("KHM",1,"Axgard Braggart","3W","Creature","C","Svetlin Velinov",0.01);
INSERT INTO CARD VALUES ("KHM",2,"Battershield Warrior","2W","Creature","U","Colin Boyer",0.03);
INSERT INTO CARD VALUES ("KHM",3,"Battlefield Raptor","W","Creature","C","Mike Bierek",0.04);
INSERT INTO CARD VALUES ("KHM",4,"Beskir Shieldmate","1W","Creature","C","Manuel Castañón",0.01);
INSERT INTO CARD VALUES ("KHM",5,"Bound in Gold","2W","Enchantment","C","Victor Adame Minguez",0.02);
INSERT INTO CARD VALUES ("KHM",6,"Clarion Spirit","1W","Creature","U","Anastasia Ovchinnikova",0.11);
INSERT INTO CARD VALUES ("KHM",7,"Codespell Cleric","W","Creature","C","Manuel Castañón",0.01);
INSERT INTO CARD VALUES ("KHM",8,"Divine Gambit","WW","Sorcery","U","Joe Slucher",0.03);
INSERT INTO CARD VALUES ("KHM",9,"Doomskar","3WW","Sorcery","R","Piotr Dura",2.24);
INSERT INTO CARD VALUES ("KHM",10,"Doomskar Oracle","2W","Creature","C","Taylor Ingvarsson",0.01);
INSERT INTO CARD VALUES ("KHM",11,"Giant Ox","1W","Creature","C","Joe Slucher",0.05);
INSERT INTO CARD VALUES ("KHM",12,"Glorious Protector","2WW","Creature","R","PINDURSKI",0.8);
INSERT INTO CARD VALUES ("KHM",13,"Gods` Hall Guardian","5W","Creature","C","Sidharth Chaturvedi",0.02);
INSERT INTO CARD VALUES ("KHM",14,"Goldmaw Champion","2W","Creature","C","Slawomir Maniak",0.01);
INSERT INTO CARD VALUES ("KHM",15,"Halvar, God of Battle / Sword of the Realms","2WW / 1W","Lgd. Creature","M","Lie Setiawan",7.09);
INSERT INTO CARD VALUES ("KHM",16,"Invoke the Divine","2W","Instant","C","Campbell White",0.03);
INSERT INTO CARD VALUES ("KHM",17,"Iron Verdict","2W","Instant","C","Bryan Sola",0.02);
INSERT INTO CARD VALUES ("KHM",18,"Kaya`s Onslaught","2W","Instant","U","Daarken",0.04);
INSERT INTO CARD VALUES ("KHM",19,"Master Skald","4W","Creature","C","Svetlin Velinov",0.01);
INSERT INTO CARD VALUES ("KHM",20,"Rally the Ranks","1W","Enchantment","R","Lie Setiawan",0.31);
INSERT INTO CARD VALUES ("KHM",21,"Reidane, God of the Worthy / Valkmira, Protector`s Shield","2W / 3W","Lgd. Creature","R","Jason Rainville",1.04);
INSERT INTO CARD VALUES ("KHM",22,"Resplendent Marshal","1WW","Creature","M","Ryan Pancoast",1.4);
INSERT INTO CARD VALUES ("KHM",23,"Revitalize","1W","Instant","C","Mathias Kollros",0.03);
INSERT INTO CARD VALUES ("KHM",24,"Righteous Valkyrie","2W","Creature","R","Chris Rahn",2.45);
INSERT INTO CARD VALUES ("KHM",25,"Rune of Sustenance","1W","Enchantment","U","Yeong-Hao Han",0.1);
INSERT INTO CARD VALUES ("KHM",26,"Runeforge Champion","2W","Creature","R","Andrey Kuzinskiy",0.18);
INSERT INTO CARD VALUES ("KHM",27,"Search for Glory","2W","Snow Sorcery","R","Kieran Yanner",0.83);
INSERT INTO CARD VALUES ("KHM",28,"Shepherd of the Cosmos","4WW","Creature","U","Johannes Voss",0.14);
INSERT INTO CARD VALUES ("KHM",29,"Sigrid, God-Favored","1WW","Lgd. Creature","R","Johannes Voss",0.23);
INSERT INTO CARD VALUES ("KHM",30,"Spectral Steel","1W","Enchantment","U","Johannes Voss",0.09);
INSERT INTO CARD VALUES ("KHM",31,"Stalwart Valkyrie","3W","Creature","C","Jason Rainville",0.02);
INSERT INTO CARD VALUES ("KHM",32,"Starnheim Courser","2W","Creature","C","Andrew Mar",0.06);
INSERT INTO CARD VALUES ("KHM",33,"Starnheim Unleashed","2WW","Sorcery","M","Johannes Voss",3.67);
INSERT INTO CARD VALUES ("KHM",34,"Story Seeker","1W","Creature","C","Svetlin Velinov",0.02);
INSERT INTO CARD VALUES ("KHM",35,"Usher of the Fallen","W","Creature","U","Anastasia Ovchinnikova",0.12);
INSERT INTO CARD VALUES ("KHM",36,"Valkyrie`s Sword","1W","Artifact","U","Aaron Miller",0.06);
INSERT INTO CARD VALUES ("KHM",37,"Valor of the Worthy","W","Enchantment","C","Mathias Kollros",0.02);
INSERT INTO CARD VALUES ("KHM",38,"Warhorn Blast","4W","Instant","C","Bryan Sola",0.01);
INSERT INTO CARD VALUES ("KHM",39,"Wings of the Cosmos","W","Instant","C","Ilse Gort",0.01);
INSERT INTO CARD VALUES ("KHM",40,"Alrund, God of the Cosmos / Hakka, Whispering Raven","3UU / 1U","Lgd. Creature","M","Kieran Yanner",1.58);
INSERT INTO CARD VALUES ("KHM",41,"Alrund`s Epiphany","5UU","Sorcery","M","Kieran Yanner",7.28);
INSERT INTO CARD VALUES ("KHM",42,"Annul","U","Instant","C","Caio Monteiro",0.02);
INSERT INTO CARD VALUES ("KHM",43,"Ascendant Spirit","U","Snow Creature","R","Lie Setiawan",0.38);
INSERT INTO CARD VALUES ("KHM",44,"Augury Raven","3U","Creature","C","Jesper Ejsing",0.01);
INSERT INTO CARD VALUES ("KHM",45,"Avalanche Caller","1U","Snow Creature","U","Mathias Kollros",0.04);
INSERT INTO CARD VALUES ("KHM",46,"Behold the Multiverse","3U","Instant","C","Magali Villeneuve",0.24);
INSERT INTO CARD VALUES ("KHM",47,"Berg Strider","4U","Snow Creature","C","Filip Burburan",0.01);
INSERT INTO CARD VALUES ("KHM",48,"Bind the Monster","U","Enchantment","C","Tran Nguyen",0.02);
INSERT INTO CARD VALUES ("KHM",49,"Brinebarrow Intruder","U","Creature","C","Scott Murphy",0.01);
INSERT INTO CARD VALUES ("KHM",50,"Cosima, God of the Voyage / The Omenkeel","2U / 1U","Lgd. Creature","R","Micah Epstein",0.85);
INSERT INTO CARD VALUES ("KHM",51,"Cosmos Charger","3U","Creature","R","Nils Hamm",0.21);
INSERT INTO CARD VALUES ("KHM",52,"Cyclone Summoner","5UU","Creature","R","Andrey Kuzinskiy",0.17);
INSERT INTO CARD VALUES ("KHM",53,"Depart the Realm","1U","Instant","C","Denman Rooke",0.07);
INSERT INTO CARD VALUES ("KHM",54,"Disdainful Stroke","1U","Instant","C","Campbell White",0.04);
INSERT INTO CARD VALUES ("KHM",55,"Draugr Thought-Thief","2U","Creature","C","Dan Scott",0.01);
INSERT INTO CARD VALUES ("KHM",56,"Frost Augur","U","Snow Creature","U","Cristi Balanescu",0.1);
INSERT INTO CARD VALUES ("KHM",57,"Frostpeak Yeti","3U","Snow Creature","C","Chris Rahn",0.02);
INSERT INTO CARD VALUES ("KHM",58,"Frostpyre Arcanist","4U","Creature","U","Sam Rowan",0.02);
INSERT INTO CARD VALUES ("KHM",59,"Giant`s Amulet","U","Artifact","U","Joseph Meehan",0.05);
INSERT INTO CARD VALUES ("KHM",60,"Glimpse the Cosmos","1U","Sorcery","U","Lorenzo Mastroianni",0.12);
INSERT INTO CARD VALUES ("KHM",61,"Graven Lore","3UU","Snow Instant","R","Svetlin Velinov",0.17);
INSERT INTO CARD VALUES ("KHM",62,"Icebind Pillar","2U","Snow Artifact","U","Wisnu Tan",0.03);
INSERT INTO CARD VALUES ("KHM",63,"Icebreaker Kraken","10UU","Snow Creature","R","Chris Cold",0.21);
INSERT INTO CARD VALUES ("KHM",64,"Inga Rune-Eyes","3U","Lgd. Creature","U","Bram Sels",0.03);
INSERT INTO CARD VALUES ("KHM",65,"Karfell Harbinger","1U","Creature","C","Josh Hass",0.01);
INSERT INTO CARD VALUES ("KHM",66,"Littjara Kinseekers","3U","Creature","C","Tyler Walpole",0.03);
INSERT INTO CARD VALUES ("KHM",67,"Mists of Littjara","1U","Enchantment","C","Bastien L. Deharme",0.01);
INSERT INTO CARD VALUES ("KHM",68,"Mistwalker","2U","Creature","C","Steve Prescott",0.01);
INSERT INTO CARD VALUES ("KHM",69,"Mystic Reflection","1U","Instant","R","YW Tang",3.99);
INSERT INTO CARD VALUES ("KHM",70,"Orvar, the All-Form","3U","Lgd. Creature","M","Chase Stone",5.45);
INSERT INTO CARD VALUES ("KHM",71,"Pilfering Hawk","1U","Snow Creature","C","Dan Scott",0.02);
INSERT INTO CARD VALUES ("KHM",72,"Ravenform","2U","Sorcery","C","Anna Steinbauer",0.27);
INSERT INTO CARD VALUES ("KHM",73,"Reflections of Littjara","4U","Enchantment","R","Aaron Miller",1.06);
INSERT INTO CARD VALUES ("KHM",74,"Run Ashore","4UU","Instant","C","Svetlin Velinov",0.01);
INSERT INTO CARD VALUES ("KHM",75,"Rune of Flight","1U","Enchantment","U","Yeong-Hao Han",0.07);
INSERT INTO CARD VALUES ("KHM",76,"Saw It Coming","1UU","Instant","U","Randy Vargas",0.5);
INSERT INTO CARD VALUES ("KHM",77,"Strategic Planning","1U","Sorcery","C","Donato Giancola",0.01);
INSERT INTO CARD VALUES ("KHM",78,"Undersea Invader","4UU","Creature","C","Lorenzo Mastroianni",0.01);
INSERT INTO CARD VALUES ("KHM",79,"Blood on the Snow","4BB","Snow Sorcery","R","Martina Fackova",0.33);
INSERT INTO CARD VALUES ("KHM",80,"Bloodsky Berserker","1B","Creature","U","Gabor Szikszai",0.08);
INSERT INTO CARD VALUES ("KHM",81,"Burning-Rune Demon","4BB","Creature","M","Andrew Mar",3.04);
INSERT INTO CARD VALUES ("KHM",82,"Crippling Fear","2BB","Sorcery","R","Nestor Ossandon Leal",0.25);
INSERT INTO CARD VALUES ("KHM",83,"Deathknell Berserker","1B","Creature","C","Zoltan Boros",0.03);
INSERT INTO CARD VALUES ("KHM",84,"Demonic Gifts","1B","Instant","C","Kekai Kotaki",0.02);
INSERT INTO CARD VALUES ("KHM",85,"Dogged Pursuit","3B","Enchantment","C","Jason Rainville",0.02);
INSERT INTO CARD VALUES ("KHM",86,"Draugr Necromancer","3B","Snow Creature","R","David Rapoza",0.46);
INSERT INTO CARD VALUES ("KHM",87,"Draugr Recruiter","3B","Creature","C","Colin Boyer",0.02);
INSERT INTO CARD VALUES ("KHM",88,"Draugr`s Helm","1B","Artifact","U","Joe Slucher",0.05);
INSERT INTO CARD VALUES ("KHM",89,"Dread Rider","5B","Creature","C","Irina Nordsol",0.01);
INSERT INTO CARD VALUES ("KHM",90,"Dream Devourer","1B","Creature","R","David Rapoza",0.86);
INSERT INTO CARD VALUES ("KHM",91,"Duskwielder","B","Creature","C","Daarken",0.01);
INSERT INTO CARD VALUES ("KHM",92,"Egon, God of Death / Throne of Death","2B / B","Lgd. Creature","R","Jason A. Engle",0.4);
INSERT INTO CARD VALUES ("KHM",93,"Elderfang Disciple","1B","Creature","C","Miranda Meeks",0.05);
INSERT INTO CARD VALUES ("KHM",94,"Eradicator Valkyrie","2BB","Creature","M","Tyler Jacobson",4.08);
INSERT INTO CARD VALUES ("KHM",95,"Feed the Serpent","2BB","Instant","C","Nicholas Gregory",0.02);
INSERT INTO CARD VALUES ("KHM",96,"Grim Draugr","2B","Snow Creature","C","Grzegorz Rutkowski",0.03);
INSERT INTO CARD VALUES ("KHM",97,"Hailstorm Valkyrie","3B","Snow Creature","U","Bram Sels",0.06);
INSERT INTO CARD VALUES ("KHM",98,"Haunting Voyage","4BB","Sorcery","M","Ryan Yee",3.59);
INSERT INTO CARD VALUES ("KHM",99,"Infernal Pet","2B","Creature","C","YW Tang",0.01);
INSERT INTO CARD VALUES ("KHM",100,"Jarl of the Forsaken","3B","Creature","C","Chris Cold",0.02);
INSERT INTO CARD VALUES ("KHM",101,"Karfell Kennel-Master","4B","Creature","C","Izzy",0.02);
INSERT INTO CARD VALUES ("KHM",102,"Koma`s Faithful","2B","Creature","C","Caroline Gariba",0.01);
INSERT INTO CARD VALUES ("KHM",103,"Poison the Cup","1BB","Instant","U","Colin Boyer",0.11);
INSERT INTO CARD VALUES ("KHM",104,"Priest of the Haunted Edge","1B","Snow Creature","C","Aaron Miller",0.01);
INSERT INTO CARD VALUES ("KHM",105,"Raise the Draugr","1B","Instant","C","Randy Vargas",0.04);
INSERT INTO CARD VALUES ("KHM",106,"Return Upon the Tide","4B","Sorcery","U","Martina Fackova",0.01);
INSERT INTO CARD VALUES ("KHM",107,"Rise of the Dread Marn","2B","Instant","R","Titus Lunter",0.88);
INSERT INTO CARD VALUES ("KHM",108,"Rune of Mortality","1B","Enchantment","U","Yeong-Hao Han",0.09);
INSERT INTO CARD VALUES ("KHM",109,"Skemfar Avenger","1B","Creature","R","Randy Vargas",0.31);
INSERT INTO CARD VALUES ("KHM",110,"Skemfar Shadowsage","3B","Creature","U","Matt Stewart",0.09);
INSERT INTO CARD VALUES ("KHM",111,"Skull Raid","3B","Sorcery","C","Igor Kieryluk",0.03);
INSERT INTO CARD VALUES ("KHM",112,"Tergrid, God of Fright / Tergrid`s Lantern","3BB / 3B","Lgd. Creature","R","Yongjae Choi",6.09);
INSERT INTO CARD VALUES ("KHM",113,"Tergrid`s Shadow","3BB","Instant","U","Yongjae Choi",0.05);
INSERT INTO CARD VALUES ("KHM",114,"Valki, God of Lies / Tibalt, Cosmic Impostor","1B / 5BR","Lgd. Creature","M","Yongjae Choi",17.07);
INSERT INTO CARD VALUES ("KHM",115,"Varragoth, Bloodsky Sire","2B","Lgd. Creature","R","Tyler Jacobson",2.81);
INSERT INTO CARD VALUES ("KHM",116,"Vengeful Reaper","3B","Creature","U","Billy Christian",0.13);
INSERT INTO CARD VALUES ("KHM",117,"Village Rites","B","Instant","C","Igor Kieryluk",0.19);
INSERT INTO CARD VALUES ("KHM",118,"Weigh Down","B","Sorcery","C","John Di Giovanni",0.01);
INSERT INTO CARD VALUES ("KHM",119,"Withercrown","1B","Enchantment","C","Miranda Meeks",0.01);
INSERT INTO CARD VALUES ("KHM",120,"Arni Brokenbrow","2R","Lgd. Creature","R","Dmitry Burmak",0.13);
INSERT INTO CARD VALUES ("KHM",121,"Axgard Cavalry","1R","Creature","C","Evyn Fong",0.01);
INSERT INTO CARD VALUES ("KHM",122,"Basalt Ravager","3R","Creature","U","Andrey Kuzinskiy",0.05);
INSERT INTO CARD VALUES ("KHM",123,"Birgi, God of Storytelling / Harnfel, Horn of Bounty","2R / 4R","Lgd. Creature","R","Eric Deschamps",3.14);
INSERT INTO CARD VALUES ("KHM",124,"Breakneck Berserker","2R","Creature","C","Scott Murphy",0.01);
INSERT INTO CARD VALUES ("KHM",125,"Calamity Bearer","2RR","Creature","R","Simon Dominic",0.22);
INSERT INTO CARD VALUES ("KHM",126,"Cinderheart Giant","5RR","Creature","C","Viktor Titov",0.01);
INSERT INTO CARD VALUES ("KHM",127,"Craven Hulk","3R","Creature","C","Nicholas Gregory",0.01);
INSERT INTO CARD VALUES ("KHM",128,"Crush the Weak","2R","Sorcery","U","Lucas Graciano",0.06);
INSERT INTO CARD VALUES ("KHM",129,"Demon Bolt","2R","Instant","C","Campbell White",0.02);
INSERT INTO CARD VALUES ("KHM",130,"Doomskar Titan","4RR","Creature","U","Johann Bodin",0.03);
INSERT INTO CARD VALUES ("KHM",131,"Dragonkin Berserker","1R","Creature","R","Lie Setiawan",0.2);
INSERT INTO CARD VALUES ("KHM",132,"Dual Strike","RR","Instant","U","Nestor Ossandon Leal",0.14);
INSERT INTO CARD VALUES ("KHM",133,"Dwarven Hammer","2R","Artifact","U","Raoul Vitale",0.03);
INSERT INTO CARD VALUES ("KHM",134,"Dwarven Reinforcements","3R","Sorcery","C","Andrey Kuzinskiy",0.01);
INSERT INTO CARD VALUES ("KHM",135,"Fearless Liberator","1R","Creature","U","Zezhou Chen",0.05);
INSERT INTO CARD VALUES ("KHM",136,"Fearless Pup","R","Creature","C","Jehan Choo",0.02);
INSERT INTO CARD VALUES ("KHM",137,"Frenzied Raider","1R","Creature","U","Lius Lasahido",0.02);
INSERT INTO CARD VALUES ("KHM",138,"Frost Bite","R","Snow Instant","C","Caio Monteiro",0.05);
INSERT INTO CARD VALUES ("KHM",139,"Goldspan Dragon","3RR","Creature","M","Andrew Mar",21.06);
INSERT INTO CARD VALUES ("KHM",140,"Hagi Mob","4R","Creature","C","Steve Prescott",0.01);
INSERT INTO CARD VALUES ("KHM",141,"Immersturm Raider","1R","Creature","C","Grzegorz Rutkowski",0.02);
INSERT INTO CARD VALUES ("KHM",142,"Magda, Brazen Outlaw","1R","Lgd. Creature","R","Slawomir Maniak",0.9);
INSERT INTO CARD VALUES ("KHM",143,"Open the Omenpaths","2R","Instant","C","Eric Deschamps",0.02);
INSERT INTO CARD VALUES ("KHM",144,"Provoke the Trolls","3R","Instant","U","Deruchenko Alexander",0.02);
INSERT INTO CARD VALUES ("KHM",145,"Quakebringer","3RR","Creature","M","Lucas Graciano",2.03);
INSERT INTO CARD VALUES ("KHM",146,"Reckless Crew","3R","Sorcery","R","Izzy",0.1);
INSERT INTO CARD VALUES ("KHM",147,"Run Amok","1R","Instant","C","Johann Bodin",0.01);
INSERT INTO CARD VALUES ("KHM",148,"Rune of Speed","1R","Enchantment","U","Yeong-Hao Han",0.09);
INSERT INTO CARD VALUES ("KHM",149,"Seize the Spoils","2R","Sorcery","C","Jesper Ejsing",0.03);
INSERT INTO CARD VALUES ("KHM",150,"Shackles of Treachery","2R","Sorcery","C","Dmitry Burmak",0.02);
INSERT INTO CARD VALUES ("KHM",151,"Smashing Success","3R","Instant","C","Slawomir Maniak",0.01);
INSERT INTO CARD VALUES ("KHM",152,"Squash","4R","Instant","C","Caio Monteiro",0.02);
INSERT INTO CARD VALUES ("KHM",153,"Tibalt`s Trickery","1R","Instant","R","Anna Podedworna",2.03);
INSERT INTO CARD VALUES ("KHM",154,"Toralf, God of Fury / Toralf`s Hammer","2RR / 1R","Lgd. Creature","M","Tyler Jacobson",4.04);
INSERT INTO CARD VALUES ("KHM",155,"Tormentor`s Helm","R","Artifact","C","Zoltan Boros",0.02);
INSERT INTO CARD VALUES ("KHM",156,"Tundra Fumarole","1RR","Snow Sorcery","R","Simon Dominic",0.14);
INSERT INTO CARD VALUES ("KHM",157,"Tuskeri Firewalker","2R","Creature","C","Victor Adame Minguez",0.02);
INSERT INTO CARD VALUES ("KHM",158,"Vault Robber","1R","Creature","C","Slawomir Maniak",0.01);
INSERT INTO CARD VALUES ("KHM",159,"Arachnoform","1G","Enchantment","C","Ilse Gort",0.02);
INSERT INTO CARD VALUES ("KHM",160,"Battle Mammoth","3GG","Creature","M","Jesper Ejsing",1.19);
INSERT INTO CARD VALUES ("KHM",161,"Blessing of Frost","3G","Snow Sorcery","R","Mila Pesic",0.14);
INSERT INTO CARD VALUES ("KHM",162,"Blizzard Brawl","G","Snow Sorcery","U","Manuel Castañón",0.09);
INSERT INTO CARD VALUES ("KHM",163,"Boreal Outrider","2G","Snow Creature","U","Alex Konstad",0.06);
INSERT INTO CARD VALUES ("KHM",164,"Broken Wings","2G","Instant","C","Lars Grant-West",0.02);
INSERT INTO CARD VALUES ("KHM",165,"Elderleaf Mentor","3G","Creature","C","Zoltan Boros",0.03);
INSERT INTO CARD VALUES ("KHM",166,"Elven Bow","G","Artifact","U","Dallas Williams",0.05);
INSERT INTO CARD VALUES ("KHM",167,"Elvish Warmaster","1G","Creature","R","Alexander Mokhov",2.36);
INSERT INTO CARD VALUES ("KHM",168,"Esika, God of the Tree / The Prismatic Bridge","1GG / WUBRG","Lgd. Creature / Enchantment","M","Johannes Voss",11.99);
INSERT INTO CARD VALUES ("KHM",169,"Esika`s Chariot","3G","Lgd. Artifact","R","Raoul Vitale",0.39);
INSERT INTO CARD VALUES ("KHM",170,"Fynn, the Fangbearer","1G","Lgd. Creature","U","Lie Setiawan",0.26);
INSERT INTO CARD VALUES ("KHM",171,"Glittering Frost","2G","Snow Enchantment","C","Lucas Graciano",0.02);
INSERT INTO CARD VALUES ("KHM",172,"Gnottvold Recluse","2G","Creature","C","Nicholas Gregory",0.01);
INSERT INTO CARD VALUES ("KHM",173,"Grizzled Outrider","4G","Creature","C","Cristi Balanescu",0.01);
INSERT INTO CARD VALUES ("KHM",174,"Guardian Gladewalker","1G","Creature","C","Mila Pesic",0.01);
INSERT INTO CARD VALUES ("KHM",175,"Horizon Seeker","2G","Creature","C","Matt Stewart",0.01);
INSERT INTO CARD VALUES ("KHM",176,"Icehide Troll","2G","Snow Creature","C","Andrey Kuzinskiy",0.01);
INSERT INTO CARD VALUES ("KHM",177,"In Search of Greatness","GG","Enchantment","R","Ilse Gort",1.49);
INSERT INTO CARD VALUES ("KHM",178,"Jaspera Sentinel","G","Creature","C","Raoul Vitale",0.03);
INSERT INTO CARD VALUES ("KHM",179,"Jorn, God of Winter / Kaldring, the Rimestaff","2G / 1UB","Lgd. Snow Creature","R","Magali Villeneuve",0.96);
INSERT INTO CARD VALUES ("KHM",180,"King Harald`s Revenge","2G","Sorcery","C","Lorenzo Mastroianni",0.02);
INSERT INTO CARD VALUES ("KHM",181,"Kolvori, God of Kinship / The Ringhart Crest","2GG / 1G","Lgd. Creature","R","Grzegorz Rutkowski",0.26);
INSERT INTO CARD VALUES ("KHM",182,"Littjara Glade-Warden","3G","Creature","U","Deruchenko Alexander",0.03);
INSERT INTO CARD VALUES ("KHM",183,"Mammoth Growth","2G","Instant","C","Ilse Gort",0.02);
INSERT INTO CARD VALUES ("KHM",184,"Masked Vandal","1G","Creature","C","Jason A. Engle",0.2);
INSERT INTO CARD VALUES ("KHM",185,"Old-Growth Troll","GGG","Creature","R","Jesper Ejsing",0.3);
INSERT INTO CARD VALUES ("KHM",186,"Path to the World Tree","1G","Enchantment","U","Daniel Ljunggren",0.05);
INSERT INTO CARD VALUES ("KHM",187,"Ravenous Lindwurm","4GG","Creature","C","Filip Burburan",0.01);
INSERT INTO CARD VALUES ("KHM",188,"Realmwalker","2G","Creature","R","Zack Stella",3.22);
INSERT INTO CARD VALUES ("KHM",189,"Rootless Yew","3GG","Creature","U","Nicholas Gregory",0.04);
INSERT INTO CARD VALUES ("KHM",190,"Roots of Wisdom","1G","Sorcery","C","Sidharth Chaturvedi",0.03);
INSERT INTO CARD VALUES ("KHM",191,"Rune of Might","1G","Enchantment","U","Yeong-Hao Han",0.1);
INSERT INTO CARD VALUES ("KHM",192,"Sarulf`s Packmate","3G","Creature","C","Ilse Gort",0.02);
INSERT INTO CARD VALUES ("KHM",193,"Sculptor of Winter","1G","Snow Creature","C","PINDURSKI",0.01);
INSERT INTO CARD VALUES ("KHM",194,"Snakeskin Veil","G","Instant","C","Matt Stewart",0.08);
INSERT INTO CARD VALUES ("KHM",195,"Spirit of the Aldergard","3G","Snow Creature","U","Lars Grant-West",0.09);
INSERT INTO CARD VALUES ("KHM",196,"Struggle for Skemfar","3G","Sorcery","C","Bram Sels",0.01);
INSERT INTO CARD VALUES ("KHM",197,"Toski, Bearer of Secrets","3G","Lgd. Creature","R","Jason Rainville",4.51);
INSERT INTO CARD VALUES ("KHM",198,"Tyvar Kell","2GG","Lgd. Planeswalker","M","Chris Rallis",9.72);
INSERT INTO CARD VALUES ("KHM",199,"Vorinclex, Monstrous Raider","4GG","Lgd. Creature","M","Daarken",38.38);
INSERT INTO CARD VALUES ("KHM",200,"Aegar, the Freezing Flame","1UR","Lgd. Creature","U","Chris Rahn",0.09);
INSERT INTO CARD VALUES ("KHM",201,"Arni Slays the Troll","RG","Enchantment","U","Simon Dominic",0.05);
INSERT INTO CARD VALUES ("KHM",202,"Ascent of the Worthy","1WB","Enchantment","U","James Arnold",0.07);
INSERT INTO CARD VALUES ("KHM",203,"Battle for Bretagard","1GW","Enchantment","R","Igor Kieryluk",0.16);
INSERT INTO CARD VALUES ("KHM",204,"Battle of Frost and Fire","3UR","Enchantment","R","Daniel Ljunggren",0.18);
INSERT INTO CARD VALUES ("KHM",205,"The Bears of Littjara","1GU","Enchantment","R","Randy Gallegos",0.14);
INSERT INTO CARD VALUES ("KHM",206,"Binding the Old Gods","2BG","Enchantment","U","Victor Adame Minguez",0.5);
INSERT INTO CARD VALUES ("KHM",207,"The Bloodsky Massacre","1BR","Enchantment","R","Livia Prima",0.11);
INSERT INTO CARD VALUES ("KHM",208,"Fall of the Impostor","1GW","Enchantment","U","Eric Deschamps",0.05);
INSERT INTO CARD VALUES ("KHM",209,"Firja, Judge of Valor","2WBB","Lgd. Creature","U","Livia Prima",0.11);
INSERT INTO CARD VALUES ("KHM",210,"Firja`s Retribution","1WWB","Enchantment","R","Anna Steinbauer",0.37);
INSERT INTO CARD VALUES ("KHM",211,"Forging the Tyrite Sword","1RW","Enchantment","U","Kieran Yanner",0.14);
INSERT INTO CARD VALUES ("KHM",212,"Harald, King of Skemfar","1BG","Lgd. Creature","U","Grzegorz Rutkowski",0.07);
INSERT INTO CARD VALUES ("KHM",213,"Harald Unites the Elves","2BG","Enchantment","R","Ryan Pancoast",0.19);
INSERT INTO CARD VALUES ("KHM",214,"Immersturm Predator","2BR","Creature","R","Nicholas Gregory",0.3);
INSERT INTO CARD VALUES ("KHM",215,"Invasion of the Giants","UR","Enchantment","U","Jason Felix",0.13);
INSERT INTO CARD VALUES ("KHM",216,"Kardur, Doomscourge","2BR","Lgd. Creature","U","Chris Rahn",0.15);
INSERT INTO CARD VALUES ("KHM",217,"Kardur`s Vicious Return","2BR","Enchantment","U","Joseph Meehan",0.09);
INSERT INTO CARD VALUES ("KHM",218,"Kaya the Inexorable","3WB","Lgd. Planeswalker","M","Tyler Jacobson",3.65);
INSERT INTO CARD VALUES ("KHM",219,"King Narfi`s Betrayal","1UB","Enchantment","R","Chase Stone",0.2);
INSERT INTO CARD VALUES ("KHM",220,"Koll, the Forgemaster","RW","Lgd. Creature","U","Bram Sels",0.11);
INSERT INTO CARD VALUES ("KHM",221,"Koma, Cosmos Serpent","3GGUU","Lgd. Creature","M","Jesper Ejsing",14.51);
INSERT INTO CARD VALUES ("KHM",222,"Maja, Bretagard Protector","2GWW","Lgd. Creature","U","Lie Setiawan",0.12);
INSERT INTO CARD VALUES ("KHM",223,"Moritte of the Frost","2GUU","Lgd. Snow Creature","U","Eric Deschamps",0.1);
INSERT INTO CARD VALUES ("KHM",224,"Narfi, Betrayer King","3UB","Lgd. Snow Creature","U","Daarken",0.11);
INSERT INTO CARD VALUES ("KHM",225,"Niko Aris","XWUU","Lgd. Planeswalker","M","Winona Nelson",1.46);
INSERT INTO CARD VALUES ("KHM",226,"Niko Defies Destiny","1WU","Enchantment","U","Bastien L. Deharme",0.04);
INSERT INTO CARD VALUES ("KHM",227,"The Raven`s Warning","1WU","Enchantment","R","Lie Setiawan",0.24);
INSERT INTO CARD VALUES ("KHM",228,"Sarulf, Realm Eater","1BG","Lgd. Creature","R","Chris Rahn",0.37);
INSERT INTO CARD VALUES ("KHM",229,"Showdown of the Skalds","2RW","Enchantment","R","Steven Belledin",0.65);
INSERT INTO CARD VALUES ("KHM",230,"Svella, Ice Shaper","1RG","Lgd. Snow Creature","U","Andrew Mar",0.1);
INSERT INTO CARD VALUES ("KHM",231,"The Three Seasons","GU","Enchantment","U","Adam Paquette",0.06);
INSERT INTO CARD VALUES ("KHM",232,"The Trickster-God`s Heist","2UB","Enchantment","U","Randy Vargas",0.05);
INSERT INTO CARD VALUES ("KHM",233,"Vega, the Watcher","1WU","Lgd. Creature","U","Paul Scott Canavan",0.05);
INSERT INTO CARD VALUES ("KHM",234,"Waking the Trolls","4RG","Enchantment","R","Daniel Ljunggren",0.13);
INSERT INTO CARD VALUES ("KHM",235,"Bloodline Pretender","3","Artifact Creature","U","Slawomir Maniak",0.24);
INSERT INTO CARD VALUES ("KHM",236,"Colossal Plow","2","Artifact","U","Joe Slucher",0.07);
INSERT INTO CARD VALUES ("KHM",237,"Cosmos Elixir","4","Artifact","R","Volkan Ba?a",0.86);
INSERT INTO CARD VALUES ("KHM",238,"Funeral Longboat","2","Artifact","C","Donato Giancola",0.02);
INSERT INTO CARD VALUES ("KHM",239,"Goldvein Pick","2","Artifact","C","Dan Scott",0.06);
INSERT INTO CARD VALUES ("KHM",240,"Maskwood Nexus","4","Artifact","R","Jason A. Engle",3.02);
INSERT INTO CARD VALUES ("KHM",241,"Pyre of Heroes","2","Artifact","R","Piotr Dura",1.11);
INSERT INTO CARD VALUES ("KHM",242,"Raiders` Karve","3","Artifact","C","Aaron Miller",0.01);
INSERT INTO CARD VALUES ("KHM",243,"Raven Wings","2","Artifact","C","Andrew Mar",0.01);
INSERT INTO CARD VALUES ("KHM",244,"Replicating Ring","3","Snow Artifact","U","Olena Richards",0.4);
INSERT INTO CARD VALUES ("KHM",245,"Runed Crown","3","Artifact","U","Randy Gallegos",0.06);
INSERT INTO CARD VALUES ("KHM",246,"Scorn Effigy","3","Artifact Creature","C","Wayne Reynolds",0.01);
INSERT INTO CARD VALUES ("KHM",247,"Weathered Runestone","2","Artifact","U","Dan Scott",0.33);
INSERT INTO CARD VALUES ("KHM",248,"Alpine Meadow","0","Snow Land","C","Piotr Dura",0.31);
INSERT INTO CARD VALUES ("KHM",249,"Arctic Treeline","0","Snow Land","C","Alayna Danner",0.26);
INSERT INTO CARD VALUES ("KHM",250,"Axgard Armory","0","Land","U","Cliff Childs",0.19);
INSERT INTO CARD VALUES ("KHM",251,"Barkchannel Pathway / Tidechannel Pathway","0","Land / Land","R","Daniel Ljunggren",4.45);
INSERT INTO CARD VALUES ("KHM",252,"Blightstep Pathway / Searstep Pathway","0","Land / Land","R","Jenn Ravenna Tran",4.59);
INSERT INTO CARD VALUES ("KHM",253,"Bretagard Stronghold","0","Land","U","Jung Park",0.07);
INSERT INTO CARD VALUES ("KHM",254,"Darkbore Pathway / Slitherbore Pathway","0","Land / Land","R","Johannes Voss",6.05);
INSERT INTO CARD VALUES ("KHM",255,"Faceless Haven","0","Snow Land","R","Titus Lunter",1.49);
INSERT INTO CARD VALUES ("KHM",256,"Gates of Istfell","0","Land","U","Anastasia Ovchinnikova",0.08);
INSERT INTO CARD VALUES ("KHM",257,"Glacial Floodplain","0","Snow Land","C","Sarah Finnigan",0.22);
INSERT INTO CARD VALUES ("KHM",258,"Gnottvold Slumbermound","0","Land","U","Simon Dominic",0.06);
INSERT INTO CARD VALUES ("KHM",259,"Great Hall of Starnheim","0","Land","U","Jonas De Ro",0.13);
INSERT INTO CARD VALUES ("KHM",260,"Hengegate Pathway / Mistgate Pathway","0","Land / Land","R","Yeong-Hao Han",5.2);
INSERT INTO CARD VALUES ("KHM",261,"Highland Forest","0","Snow Land","C","Alayna Danner",0.37);
INSERT INTO CARD VALUES ("KHM",262,"Ice Tunnel","0","Snow Land","C","Johannes Voss",0.85);
INSERT INTO CARD VALUES ("KHM",263,"Immersturm Skullcairn","0","Land","U","Cliff Childs",0.05);
INSERT INTO CARD VALUES ("KHM",264,"Littjara Mirrorlake","0","Land","U","Jokubas Uogintas",0.12);
INSERT INTO CARD VALUES ("KHM",265,"Port of Karfell","0","Land","U","Mauricio Calle",0.13);
INSERT INTO CARD VALUES ("KHM",266,"Rimewood Falls","0","Snow Land","C","Piotr Dura",0.73);
INSERT INTO CARD VALUES ("KHM",267,"Shimmerdrift Vale","0","Snow Land","C","Titus Lunter",0.13);
INSERT INTO CARD VALUES ("KHM",268,"Skemfar Elderhall","0","Land","U","Johannes Voss",0.06);
INSERT INTO CARD VALUES ("KHM",269,"Snowfield Sinkhole","0","Snow Land","C","Marta Nael",0.33);
INSERT INTO CARD VALUES ("KHM",270,"Sulfurous Mire","0","Snow Land","C","Titus Lunter",0.27);
INSERT INTO CARD VALUES ("KHM",271,"Surtland Frostpyre","0","Land","U","Piotr Dura",0.08);
INSERT INTO CARD VALUES ("KHM",272,"Tyrite Sanctum","0","Land","R","Volkan Ba?a",0.54);
INSERT INTO CARD VALUES ("KHM",273,"Volatile Fjord","0","Snow Land","C","Randy Vargas",0.4);
INSERT INTO CARD VALUES ("KHM",274,"Woodland Chasm","0","Snow Land","C","Titus Lunter",0.71);
INSERT INTO CARD VALUES ("KHM",275,"The World Tree","0","Land","R","Anastasia Ovchinnikova",3.89);
INSERT INTO CARD VALUES ("KHM",276,"Snow-Covered Plains","0","Basic Snow Land","C","Sarah Finnigan",0.25);
INSERT INTO CARD VALUES ("KHM",277,"Snow-Covered Plains","0","Basic Snow Land","C","Adam Paquette",0.37);
INSERT INTO CARD VALUES ("KHM",278,"Snow-Covered Island","0","Basic Snow Land","C","Piotr Dura",1.12);
INSERT INTO CARD VALUES ("KHM",279,"Snow-Covered Island","0","Basic Snow Land","C","Adam Paquette",1.07);
INSERT INTO CARD VALUES ("KHM",280,"Snow-Covered Swamp","0","Basic Snow Land","C","Adam Paquette",0.88);
INSERT INTO CARD VALUES ("KHM",281,"Snow-Covered Swamp","0","Basic Snow Land","C","Jung Park",0.95);
INSERT INTO CARD VALUES ("KHM",282,"Snow-Covered Mountain","0","Basic Snow Land","C","Adam Paquette",0.64);
INSERT INTO CARD VALUES ("KHM",283,"Snow-Covered Mountain","0","Basic Snow Land","C","Jung Park",0.64);
INSERT INTO CARD VALUES ("KHM",284,"Snow-Covered Forest","0","Basic Snow Land","C","Adam Paquette",0.83);
INSERT INTO CARD VALUES ("KHM",285,"Snow-Covered Forest","0","Basic Snow Land","C","Omar Rayyan",0.86);
INSERT INTO CARD VALUES ("KHM",394,"Plains","0","Basic Land","C","Piotr Dura",0.05);
INSERT INTO CARD VALUES ("KHM",395,"Island","0","Basic Land","C","Johannes Voss",0.05);
INSERT INTO CARD VALUES ("KHM",396,"Swamp","0","Basic Land","C","Piotr Dura",0.05);
INSERT INTO CARD VALUES ("KHM",397,"Mountain","0","Basic Land","C","Sam Burley",0.05);
INSERT INTO CARD VALUES ("KHM",398,"Forest","0","Basic Land","C","Sam Burley",0.05);

INSERT INTO PLAYER VALUES (1, 'Test Name 1', 'R');
INSERT INTO PLAYER VALUES (2, 'Test Name 2', 'G');
INSERT INTO PLAYER VALUES (3, 'Test Name 3', 'U');

INSERT INTO DECK VALUES ('Red Deck Wins', 1, 'Mountain', 20);
INSERT INTO DECK VALUES ('Red Deck Wins', 1, 'Goldspan Dragon', 4);
INSERT INTO DECK VALUES ('Red Deck Wins', 1, 'Arni Brokenbrow', 4);
INSERT INTO DECK VALUES ('Red Deck Wins', 1, 'Basalt Ravager', 4);
INSERT INTO DECK VALUES ('Red Deck Wins', 1, 'Axgard Cavalry', 4);
INSERT INTO DECK VALUES ('Red Deck Wins', 1, 'Bloodline Pretender', 4);

INSERT INTO DECK VALUES ('Redder Deck Wins', 2, 'Mountain', 20);
INSERT INTO DECK VALUES ('Redder Deck Wins', 2, 'Goldspan Dragon', 4);
INSERT INTO DECK VALUES ('Redder Deck Wins', 2, 'Arni Brokenbrow', 4);
INSERT INTO DECK VALUES ('Redder Deck Wins', 2, 'Basalt Ravager', 4);
INSERT INTO DECK VALUES ('Redder Deck Wins', 2, 'Axgard Cavalry', 4);
INSERT INTO DECK VALUES ('Redder Deck Wins', 2, 'Bloodline Pretender', 4);

INSERT INTO COLLECTION VALUES (1, 'Mountain', 'KHM', 0, 20);
INSERT INTO COLLECTION VALUES (1, 'Goldspan Dragon', 'KHM', 0, 4);
INSERT INTO COLLECTION VALUES (1, 'Arni Brokenbrow', 'KHM', 0, 4);
INSERT INTO COLLECTION VALUES (1, 'Basalt Ravager', 'KHM', 0, 4);
INSERT INTO COLLECTION VALUES (1, 'Axgard Cavalry', 'KHM', 0, 4);
INSERT INTO COLLECTION VALUES (1, 'Bloodline Pretender', 'KHM', 0, 4);
INSERT INTO COLLECTION VALUES (1, 'Ascent of the Worthy', 'KHM', 1, 0);
INSERT INTO COLLECTION VALUES (1, 'Plains', 'KHM', 20, 0);
INSERT INTO COLLECTION VALUES (1, 'The World Tree', 'KHM', 4, 0);
INSERT INTO COLLECTION VALUES (1, 'Maskwood Nexus', 'KHM', 4, 0);
INSERT INTO COLLECTION VALUES (1, 'Island', 'KHM', 4, 0);
INSERT INTO COLLECTION VALUES (1, 'Forest', 'KHM', 4, 0);
INSERT INTO COLLECTION VALUES (1, 'Swamp', 'KHM', 4, 0);

INSERT INTO COLLECTION VALUES (2, 'Mountain', 'KHM', 0, 20);
INSERT INTO COLLECTION VALUES (2, 'Goldspan Dragon', 'KHM', 0, 4);
INSERT INTO COLLECTION VALUES (2, 'Arni Brokenbrow', 'KHM', 0, 4);
INSERT INTO COLLECTION VALUES (2, 'Basalt Ravager', 'KHM', 0, 4);
INSERT INTO COLLECTION VALUES (2, 'Axgard Cavalry', 'KHM', 0, 4);
INSERT INTO COLLECTION VALUES (2, 'Bloodline Pretender', 'KHM', 0, 4);
INSERT INTO COLLECTION VALUES (2, 'Ascent of the Worthy', 'KHM', 1, 0);
INSERT INTO COLLECTION VALUES (2, 'Plains', 'KHM', 20, 0);
INSERT INTO COLLECTION VALUES (2, 'The World Tree', 'KHM', 4, 0);
INSERT INTO COLLECTION VALUES (2, 'Maskwood Nexus', 'KHM', 4, 0);
INSERT INTO COLLECTION VALUES (2, 'Island', 'KHM', 4, 0);
INSERT INTO COLLECTION VALUES (2, 'Forest', 'KHM', 4, 0);
INSERT INTO COLLECTION VALUES (2, 'Swamp', 'KHM', 4, 0);

SELECT * FROM CARD;
SELECT * FROM PLAYER;
SELECT * FROM DECK;
SELECT * FROM COLLECTION;

exit
