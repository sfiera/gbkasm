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
   * * `baketu.asm <src/baketu/baketu.asm>`_
     * `Bakechu Relay <https://gbkiss.org/file/bakechu-relay>`_
     * Multiplayer catch with mice
   * * `biorythm.asm <src/biorythm/biorythm.asm>`_
     * `Biorhythm <https://gbkiss.org/file/biorhythm>`_
     * `Biorhythm theory <https://en.wikipedia.org/wiki/Biorhythm_(pseudoscience)>`_ calculator
   * * `bj.asm <src/bj/bj.asm>`_
     * `Blackjack <https://gbkiss.org/file/blackjack>`_
     * Gambling card game
   * * `bland.asm <src/bland/bland.asm>`_
     * `Binary <https://gbkiss.org/file/binary>`_
     * Remake of `Binary Land <https://en.wikipedia.org/wiki/Binary_Land>`_
   * * `cannon.asm <src/cannon/cannon.asm>`_
     * `Cannon Ball <https://gbkiss.org/file/cannon-ball>`_
     * Remake of Cannon Ball/Bubble Buster
   * * `chardump.asm <src/chardump/chardump.asm>`_
     * `Char-Dump <https://gbkiss.org/file/char-dump>`_
     * GBKiss tool with unclear use
   * * `del_all.asm <src/del_all/del_all.asm>`_
     * `Delete All <https://gbkiss.org/file/delete-all>`_
     * Tool to wipe all GBKiss data
   * * `dentaku.asm <src/dentaku/dentaku.asm>`_
     * `Calculator <https://gbkiss.org/file/calculator>`_
     * Simple calculator
   * * `drive.asm <src/drive/drive.asm>`_
     * `Drive <https://gbkiss.org/file/drive>`_
     * Scrolling reflex driving game
   * * `iconedit.asm <src/iconedit/iconedit.asm>`_
     * `Icon-Edit <https://gbkiss.org/file/icon-edit>`_
     * Icon creation and editing tool
   * * `iconsend.asm <src/iconsend/iconsend.asm>`_
     * `Icon-Send <https://gbkiss.org/file/icon-send>`_
     * Bundled package of 42 icons
   * * `kissmon.asm <src/kissmon/kissmon.asm>`_
     * `Kiss-Mon <https://gbkiss.org/file/kiss-mon>`_
     * Multiplayer creature battle game
   * * `koura1.asm <src/koura1/koura1.asm>`_
     * `Koura 1 <https://gbkiss.org/file/puzzle-game/koura-1>`_
     * Extra data for Puzzle Game
   * * `koura2.asm <src/koura2/koura2.asm>`_
     * `Koura 2 <https://gbkiss.org/file/puzzle-game/koura-2>`_
     * Extra data for Puzzle Game
   * * `koura3.asm <src/koura3/koura3.asm>`_
     * `Koura 3 <https://gbkiss.org/file/puzzle-game/koura-3>`_
     * Extra data for Puzzle Game
   * * `mag_data.asm <src/mag_data/mag_data.asm>`_
     * `Magnets Data <https://gbkiss.org/file/magnets/data>`_
     * Required data for Magnets
   * * `magnets.asm <src/magnets/magnets.asm>`_
     * `Magnets <https://gbkiss.org/file/magnets>`_
     * Pushing and dodging game
   * * `mogura.asm <src/mogura/mogura.asm>`_
     * `Mogutte Nanbo <https://gbkiss.org/file/mogutte-nanbo>`_
     * Whack-a-mole simulator
   * * `poker.asm <src/poker/poker.asm>`_
     * `Poker <https://gbkiss.org/file/poker>`_
     * Gambling card game
   * * `puzzle.asm <src/puzzle/puzzle.asm>`_
     * `Puzzle Game <https://gbkiss.org/file/puzzle-game>`_
     * 15-Puzzle and Lights-Out game
   * * `roulette.asm <src/roulette/roulette.asm>`_
     * `Roulette <https://gbkiss.org/file/roulette>`_
     * Gambling game
   * * `samegame.asm <src/samegame/samegame.asm>`_
     * `SameGame <https://gbkiss.org/file/samegame>`_
     * Remake of `SameGame/Chain Shot! <https://en.wikipedia.org/wiki/SameGame>`_
   * * `sezaki.asm <src/sezaki/sezaki.asm>`_
     * `Sezaki <https://gbkiss.org/file/mogutte-nanbo/sezaki>`_
     * Extra data for Mogutte Nanbo
   * * `shot.asm <src/shot/shot.asm>`_
     * `Shot <https://gbkiss.org/file/shot>`_
     * Button mashing measurer
   * * `slot.asm <src/slot/slot.asm>`_
     * `Slot <https://gbkiss.org/file/slot>`_
     * Gambling game
   * * `soundtst.asm <src/soundtst/soundtst.asm>`_
     * `Sound Test <https://gbkiss.org/file/sound-test>`_
     * Tool for playing audio from ROM
   * * `sramtool.asm <src/sramtool/sramtool.asm>`_
     * `SRAM Get & Clear <https://gbkiss.org/file/sram-get-and-clear>`_
     * Tool for managing cartridge SRAM
   * * `sw_data.asm <src/sw_data/sw_data.asm>`_
     * `Num0 Data <https://gbkiss.org/file/watch-and-timer/num0-data>`_
     * Extra data for Watch & Timer
   * * `sw_timer.asm <src/sw_timer/sw_timer.asm>`_
     * `Watch & Timer <https://gbkiss.org/file/watch-and-timer>`_
     * Combination stopwatch/timer
   * * `worm.asm <src/worm/worm.asm>`_
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
   * * `family_s.asm <src/family_s/family_s.asm>`_
     * `Family Shot <https://gbkiss.org/file/family-shot>`_
     * `Hudson Website <https://web.archive.org/web/20021020134646/http://www.hudson.co.jp/gamenavi/gamedb/softinfo/family/date.html>`_
     * Prints photo to Game Boy Printer
   * * `kissmon2.asm <src/kissmon2/kissmon2.asm>`_
     * `Kiss-Mon 2 <https://gbkiss.org/file/kiss-mon-2>`_
     * `Pocket Bomberman <https://gbkiss.org/cart/apoj>`_
     * Kiss-Mon with custom portraits and levels
   * * `passwords.asm <src/passwords/passwords.asm>`_
     * `Mail <https://gbkiss.org/file/mail>`_
     * `Kiss Mail <https://gbkiss.org/file/kiss-mail>`_
     * Sample Kiss Mail message
   * * `saita.asm <src/saita/saita.asm>`_
     * `Saita Saita <https://gbkiss.org/file/saita>`_
     * `Hudson Website <https://web.archive.org/web/20021020134646/http://www.hudson.co.jp/gamenavi/gamedb/softinfo/family/date.html>`_
     * Children’s song as Pocket Family alarm
   * * `simula1.asm <src/simula1/simula1.asm>`_
     * `Icon <https://gbkiss.org/file/icon>`_
     * `Icon-Send`_
     * Sample icon from Icon-Send

Homebrew Files
--------------

.. list-table::
   :widths: auto

   * * File
     * Info
     * Description
   * * `hello_w.asm <src/hello_w/hello_w.asm>`_
     * `Hello World <https://gbkiss.org/file/hello-world>`_
     * `“Hello, World!” program <https://en.wikipedia.org/wiki/%22Hello,_World!%22_program>`_ for GBKiss
   * * `cksum.asm <src/cksum/cksum.asm>`_
     * `Cksum <https://gbkiss.org/file/cksum>`_
     * Lists files and calculates `CRC-32 <https://en.wikipedia.org/wiki/Cyclic_redundancy_check>`_
   * * `irtest.asm <src/irtest/irtest.asm>`_
     * `IR Test <https://gbkiss.org/file/irtest>`_
     * Demonstrates infrared communication between carts
   * * `n5unlock.asm <src/n5unlock/n5unlock.asm>`_
     * `IR Test <https://gbkiss.org/file/n5unlock>`_
     * Unlocks the Quick Start menu in Nectaris GB
