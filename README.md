Phrasegen.rb
------------

Generates a passphrase from a given input string.

    $ phrasegen
    Input: facebook.com master_password
    disinterested evils derby burial

...and copies it to the clipboard.

Where are the words from?
-------------------------

From the [top 20,000 words][words] in Project Gutenberg by frequency. With a 
battery of 20k words, that's actually *20000^4* bits of entropy (or around 
    *2^54*)!

[words]:http://en.wiktionary.org/wiki/Wiktionary:Frequency_lists#Project_Gutenberg

Why?
----

 * More secure than Supergenpass (I think) against brute-force and rainbow table 
 attacks (no MD5, many iterations with salts, etc).

 * Easier to type on your mobile phone.

![xkcd][img]
[img]: http://imgs.xkcd.com/comics/password_strength.png

