GBKiss Mini Games Disassembly
=============================

This repo contains a disassembly of `GBKiss Mini Games`_, a HuC-1 Game Boy cartridge that was not distributed for sale. It is a distribution mechanism for `GBKiss files`_ and contains most of the known GBKiss files within its ROM data.

The repo also contains disassemblies of the `embedded files`_ in the Mini Games ROM, along with a couple of `other official files`_ and `homebrew files`_.

.. _GBKiss Mini Games: https://gbkiss.org/cart/akaj
.. _GBKiss files: https://gbkiss.org/file

Embedded Files
--------------

.. list-table::
   :widths: auto

   * * File
     * Info
     * Description
   * * `baketu.asm <file/baketu.asm>`_
     * `Bakechu Relay <https://gbkiss.org/file/bakechu-relay>`_
     * Multiplayer catch with mice
   * * `biorythm.asm <file/biorythm.asm>`_
     * `Biorhythm <https://gbkiss.org/file/biorhythm>`_
     * `Biorhythm theory <https://en.wikipedia.org/wiki/Biorhythm_(pseudoscience)>`_ calculator
   * * `bj.asm <file/bj.asm>`_
     * `Blackjack <https://gbkiss.org/file/blackjack>`_
     * Gambling card game
   * * `bland.asm <file/bland.asm>`_
     * `Binary <https://gbkiss.org/file/binary>`_
     * Remake of `Binary Land <https://en.wikipedia.org/wiki/Binary_Land>`_
   * * `cannon.asm <file/cannon.asm>`_
     * `Cannon Ball <https://gbkiss.org/file/cannon-ball>`_
     * Remake of Cannon Ball/Bubble Buster
   * * `chardump.asm <file/chardump.asm>`_
     * `Char-Dump <https://gbkiss.org/file/char-dump>`_
     * GBKiss tool with unclear use
   * * `del_all.asm <file/del_all.asm>`_
     * `Delete All <https://gbkiss.org/file/delete-all>`_
     * Tool to wipe all GBKiss data
   * * `dentaku.asm <file/dentaku.asm>`_
     * `Calculator <https://gbkiss.org/file/calculator>`_
     * Simple calculator
   * * `drive.asm <file/drive.asm>`_
     * `Drive <https://gbkiss.org/file/drive>`_
     * Scrolling reflex driving game
   * * `iconedit.asm <file/iconedit.asm>`_
     * `Icon-Edit <https://gbkiss.org/file/icon-edit>`_
     * Icon creation and editing tool
   * * `iconsend.asm <file/iconsend.asm>`_
     * `Icon-Send <https://gbkiss.org/file/icon-send>`_
     * Bundled package of 42 icons
   * * `kissmon.asm <file/kissmon.asm>`_
     * `Kiss-Mon <https://gbkiss.org/file/kiss-mon>`_
     * Multiplayer creature battle game
   * * `koura1.asm <file/koura1.asm>`_
     * `Koura 1 <https://gbkiss.org/file/puzzle-game/koura-1>`_
     * Extra data for Puzzle Game
   * * `koura2.asm <file/koura2.asm>`_
     * `Koura 2 <https://gbkiss.org/file/puzzle-game/koura-2>`_
     * Extra data for Puzzle Game
   * * `koura3.asm <file/koura3.asm>`_
     * `Koura 3 <https://gbkiss.org/file/puzzle-game/koura-3>`_
     * Extra data for Puzzle Game
   * * `mag_data.asm <file/mag_data.asm>`_
     * `Magnets Data <https://gbkiss.org/file/magnets/data>`_
     * Required data for Magnets
   * * `magnets.asm <file/magnets.asm>`_
     * `Magnets <https://gbkiss.org/file/magnets>`_
     * Pushing and dodging game
   * * `mogura.asm <file/mogura.asm>`_
     * `Mogutte Nanbo <https://gbkiss.org/file/mogutte-nanbo>`_
     * Whack-a-mole simulator
   * * `poker.asm <file/poker.asm>`_
     * `Poker <https://gbkiss.org/file/poker>`_
     * Gambling card game
   * * `puzzle.asm <file/puzzle.asm>`_
     * `Puzzle Game <https://gbkiss.org/file/puzzle-game>`_
     * 15-Puzzle and Lights-Out game
   * * `roulette.asm <file/roulette.asm>`_
     * `Roulette <https://gbkiss.org/file/roulette>`_
     * Gambling game
   * * `samegame.asm <file/samegame.asm>`_
     * `SameGame <https://gbkiss.org/file/samegame>`_
     * Remake of `SameGame/Chain Shot! <https://en.wikipedia.org/wiki/SameGame>`_
   * * `sezaki.asm <file/sezaki.asm>`_
     * `Sezaki <https://gbkiss.org/file/mogutte-nanbo/sezaki>`_
     * Extra data for Mogutte Nanbo
   * * `shot.asm <file/shot.asm>`_
     * `Shot <https://gbkiss.org/file/shot>`_
     * Button mashing measurer
   * * `slot.asm <file/slot.asm>`_
     * `Slot <https://gbkiss.org/file/slot>`_
     * Gambling game
   * * `soundtst.asm <file/soundtst.asm>`_
     * `Sound Test <https://gbkiss.org/file/sound-test>`_
     * Tool for playing audio from ROM
   * * `sramtool.asm <file/sramtool.asm>`_
     * `SRAM Get & Clear <https://gbkiss.org/file/sram-get-and-clear>`_
     * Tool for managing cartridge SRAM
   * * `sw_data.asm <file/sw_data.asm>`_
     * `Num0 Data <https://gbkiss.org/file/watch-and-timer/num0-data>`_
     * Extra data for Watch & Timer
   * * `sw_timer.asm <file/sw_timer.asm>`_
     * `Watch & Timer <https://gbkiss.org/file/watch-and-timer>`_
     * Combination stopwatch/timer
   * * `worm.asm <file/worm.asm>`_
     * `Worm <https://gbkiss.org/file/worm>`_
     * Snake game

Other Official Files
--------------------

.. list-table::
   :widths: auto

   * * File
     * Info
     * Source
     * Description
   * * `family_s.asm <file/family_s.asm>`_
     * `Family Shot <https://gbkiss.org/file/family-shot>`_
     * Hudson Website
     * Prints photo to Game Boy Printer
   * * `kissmon2.asm <file/kissmon2.asm>`_
     * `Kiss-Mon 2 <https://gbkiss.org/file/kiss-mon-2>`_
     * `Pocket Bomberman <https://gbkiss.org/cart/apoj>`_
     * Kiss-Mon with custom portraits and levels
   * * `passwords.asm <file/passwords.asm>`_
     * `Mail <https://gbkiss.org/file/mail>`_
     * `Kiss Mail <https://gbkiss.org/file/kiss-mail>`_
     * Sample Kiss Mail message
   * * `saita.asm <file/saita.asm>`_
     * `Saita Saita <https://gbkiss.org/file/saita>`_
     * Hudson Website
     * Children’s song as Pocket Family alarm
   * * `simula1.asm <file/simula1.asm>`_
     * `Icon <https://gbkiss.org/file/icon>`_
     * `Icon-Send`_
     * Sample icon from Icon-Send

Homebrew Files
--------------

.. list-table::
   :widths: auto

   * * File
     * Description
   * * `hello_w.asm <file/hello_w.asm>`_
     * `“Hello, World!” program <https://en.wikipedia.org/wiki/%22Hello,_World!%22_program>`_ for GBKiss
   * * `cksum.asm <file/cksum.asm>`_
     * Lists files and calculates `CRC-32 <https://en.wikipedia.org/wiki/Cyclic_redundancy_check>`_
