-- Moteve Pals - the lines that pop up. Placeholders:
--   %n = name   %l = level   %z = zone   %s = skill   %r = skill rank   %i = item
--   %g = the legend of the dead player's class   %t = the legend's title (see ns.LEGENDS below)
-- Add your own freely: one line per entry, the addon picks one at random (never the same twice in a row).
local _, ns = ...

ns.LINES = {
    levelup = {
        "%n szintet lépett (%l). A családja büszke rá.",
        "%n most már %l-es. Ugyanolyan béna, csak több HP-val.",
        "DING! %n elérte a %l. szintet. Valaki adjon neki egy sört.",
        "Grat, %n! %l. szint, és még mindig lófasz dps-t nem tol.",
        "%n %l-es. Most már a szürke mobok is komolyan veszik. Kicsit.",
        "%n leveluppolt (%l). Valaki hívja fel a családját, mert ő nem fogja.",
        "%n elérte a %l. szintet. Szétszakítja a talenteket.",
        "Szintlépés: %n (%l). Ennyit seggen még nem ültek.",
        "%n %l-es lett. Ünnepeljük meg azzal, hogy megint meghal valami faszságban.",
        "%n %l. szint. Hogy mi változott? Semmi. De legalább villogott.",
        "%n szintet lépett. A tükörképe szerint még mindig ugyanaz a balfasz, csak %l-es.",
        "%l. szint, %n! A közvetítést a 'Csak még egy quest' alapítvány támogatta.",
    },
    levelround = {
        "%n elérte a %l. szintet! Ez már nem hobbi, ez kórkép.",
        "%l. szint, %n! Most már nyugodtan mondhatod otthon, hogy 'csak még egy dungeon'.",
        "%n kerek %l-es. Kerek szám, kerek pocak, kerek élet.",
        "%n kerek %l. szinten. Valaki tegyen egy tortát a postaládájába.",
        "%l, %n! Ez annyi óra, hogy a napfény már bírósági végzést kért ellene.",
        "Kerek %l. szint, %n. Aludni ki fog?",
    },
    level60 = {
        "%n ELÉRTE A 60-AT! A napfény mostantól hivatalosan ellenség.",
        "60! %n mostantól a raidek rabszolgája. Részvétem a családjának.",
        "%n 60-as lett. Most kezdődik az igazi szopás: a gear.",
        "MAX LEVEL! %n végre ráér... napi 6 órát farmolni.",
        "%n 60. Gratulálunk, a következő lépés: elmagyarázni a főnökének, miért volt betegszabin 4 hétig.",
    },
    death = {
        "%n meghalt itt: %z. Egy billentyűzettel kevesebb.",
        "%n elhalálozott. Tartsunk egy perc néma röhögést.",
        "%n ismét a Spirit Healernél. Csak a szoki.",
        "%n: 'Laggolt a szerver!' – Egy faszt, %n.",
        "%n beadta a kulcsot (%z). WP a mobnak.",
        "%n meghalt. Szerinte taktikai visszavonulás volt. Hasra.",
        "%n megint kimúlt. Lassan törzsvendég a temetőben, kap pecsételős kártyát.",
        "%n halott. Ha valaki talál egy agyat %z környékén, az az övé.",
        "%n meghalt. Futás a hulládért az egyetlen kardió az életében.",
    },
    skill = {
        "%n %s skillje elérte a %r-t. Végre valamihez ért.",
        "%n %s: %r. A szakmunkás-bizonyítvány postán érkezik.",
        "%n %s skillje %r. A sok kattintástól már a csuklója is sztrájkol.",
        "Gratula, %n! %s %r. Anyád mondhatja végre, hogy van szakmád.",
        "%n %s %r-on. Ennyi kattintásért máshol fizetést adnak.",
        "%n elérte a %r-t %s-ben. A hobbiból lassan függőség lett.",
        "%n: %s %r. Ennyi idő alatt valaki diplomát szerez.",
    },
    craftblue = {
        "%n összerakott egy kéket: %i. Remélem, nem ő fogja hordani.",
        "%n kék itemet csinált (%i). A szerencse még a vakokra is rámosolyog.",
        "%n alkotott: %i. Ma legalább valami hasznosat is csinált.",
        "%n kéket craftolt (%i). Valaki szóljon neki, hogy a gold elfogyott.",
        "%n kézműves foglalkozás: %i. Ügyes vagy, kisfiam!",
    },
    craftepic = {
        "EPIC CRAFT! %n legyártotta: %i. Mindenki térdre, de ne túl közel.",
        "EPIC!! %n: %i. Nem lehet bírni vele.",
        "%n epiket craftolt (%i). Valaki hívjon mentőt az egójához.",
        "%n: %i. Epic. Hivatalosan is menőbb nálad. Bocs.",
        "%n kikalapálta ezt: %i. A kovácsok istene most büszkén b@ssza a vasat.",
    },
    epicloot = {
        "%n epiket lootolt: %i. Az RNG-isten ma őt választotta, minket lesz@rt.",
        "%n kapott egy ilyet: %i. Irigység mód: bekapcsolva.",
        "EPIC drop! %n: %i. Mostantól csak napszemüvegben lehet ránézni.",
        "%n: %i. A többiek közben még mindig zöldekben flangálnak.",
        "%n epic lootja: %i. Szép. Utálunk.",
        "EPIC drop! %n: %i. Aura farming on.",
    },
}

-- Class legends: when someone dies, sometimes the legend of their class weighs in.
-- Add your own: CLASS = { name = "Name", title = "a ... istene/királya" }
-- (in game too: /mpal legend paladin SADISS a paladinok istene)
ns.LEGENDS = {
    PALADIN = { name = "SADISS", title = "a paladinok istene" },
    SHAMAN  = { name = "Chainsaw", title = "a shamanok királya" },
}

-- death lines with the class legend (used about every second death when the class has a legend)
ns.LINES.deathlegend = {
    "%g, %t büszke lenne rá!",
    "%n ismét a földön. %g, %t könnyes szemmel nézi... a röhögéstől.",
    "%n elhullott. %g, %t, már írja a könyvet: 'Hogyan ne csináld'.",
    "%g, %t ezt látta, és szégyenében classt váltott.",
    "%n meghalt. %g, %t kiadta a parancsot: mostantól csak a bankban állhatsz.",
    "%n bekapta. %g, %t szerint ez a szégyenfal első helyezettje.",
    "%g, %t üzeni %n-nek: 'Fiam, a földön fekvés nem tank-taktika.'",
    "%g, %t büszke lenne rád, %n. Ha nem halnál meg ilyen szánalmasan.",
}

-- small headline above the line
ns.TITLES = {
    levelup = "DING!", levelround = "DONG!", level60 = "LEGENDA SZÜLETETT",
    death = "RIP BALFASZ", deathlegend = "RIP BALFASZ", skill = "SZAKMAI SIKER",
    craftblue = "FRISS CRAFT", craftepic = "EPIKUS ALKOTÁS", epicloot = "EPIC LOOT",
}
