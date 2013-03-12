Phrasegen.rb
------------

Generates a passphrase from a given input string.

    $ phrasegen
    Input: twitter.com master_password
    rebels ward dwarf diligence

...and copies it to the clipboard.

Install
-------

    $ gem install phrasegen

...then just type `phrasegen` when installed.

Where are the words from?
-------------------------

From the [top 10,000 words][words] in Project Gutenberg by frequency. With a 
battery of 10k words, that's actually *10000^4* combinations (or around *53* 
    bits of entropy)!

[words]:http://en.wiktionary.org/wiki/Wiktionary:Frequency_lists#Project_Gutenberg

Why? (pros)
-----------

 * Secures the master password better than Supergenpass against brute-force and
 rainbow table attacks (no MD5, many iterations with salts, etc).

 * The generated passwords are easier to type on your mobile phone.

![xkcd][img]
[img]: http://imgs.xkcd.com/comics/password_strength.png

Why not? (cons)
---------------

`<pedantry>` The xkcd comic is misleading. The 28 bits of entropy in the 2nd 
panel assumes that passwords follow a certain format.

If you're to assume that the passwords don't follow a format and are encoded in 
Latin-1 (7 bits of entropy per character), an 8-character password will get 
you *56* bits of entropy.

(...but then again, you can't just measure password strength this way. If a 
malicious attacker obtains stolen hashes from an online service you use, 
8-character passwords are easily cracked.)

But it's slow!
--------------

Yes that's a feature. Your master password is hashed through thousands of
iterations to protect it in the event that a malicious attacker got your
generated password.
