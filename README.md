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
battery of 20k words, that's actually *20000^4* combinations (or around *54* 
    bits of entropy)!

[words]:http://en.wiktionary.org/wiki/Wiktionary:Frequency_lists#Project_Gutenberg

Why? (pros)
-----------

 * More secure than Supergenpass (I think) against brute-force and rainbow table 
 attacks (no MD5, many iterations with salts, etc).

 * Easier to type on your mobile phone.

![xkcd][img]
[img]: http://imgs.xkcd.com/comics/password_strength.png

Why not? (cons)
---------------

`<pedantry>` The xkcd comic is misleading. The 28 bits of entropy in the 2nd 
panel assumes that passwords follow a certain format.

If you're to assume that the passwords don't follow a format and are encoded in 
Latin-1 (*7* bits of entropy per character), an 8-character password will get 
you *56* bits of entropy.

(...but then again, you can't just measure password strength this way. If a 
malicious attacker obtains stolen hashes from an online service you use, 
8-character passwords are easily cracked.)

