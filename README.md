# StuyCraft
We are Budget Notch – With Stuyle!
Sadi Nirloy and Maya Nelson, APCS Period 4

Essentially, we’re creating Minecraft – except it’s 2D, there’s like 9 different blocks, and crafting is extremely painful. Sounds fun, doesn’t it? You’ll spawn in a randomly generated, side-view world whose terrain has been created using the Perlin Noise algorithm. From there you can do many fun things such as: Break blocks. Place blocks. Explore biomes. Kill mobs. Eat food. And even die! If this sounds like your idea of a good time, then read on to learn more about StuyCraft!

Prototype: https://docs.google.com/document/d/1hvmhWtNm2Brv1oT8EhkH3Dw177Pr_w1sVpRqVbsptM4/edit?usp=sharing

## User Instructions
So you’ve just spawned in your cool new randomly generated world after pressing “run” in the processing window. Now what? The first thing you’ll probably want to do is move around. Use the A/D keys to move side-to-side, and press W to jump. From there, hold down left click in order to break different blocks, and right click to place. Different blocks require a different tool to be able to mine them:

Grass/Sand – Shovel

Wood/Planks – Axe

Leaves – Axe (will not drop leaf block, has 10% chance to drop an apple)

Stone/Ores – Pickaxe

TNT – When clicked will explode


You will only be able to break and place blocks within a certain range. While you are happily chopping down a tree, you may notice some cows (or Creepers!) strolling by. Use your sword to brutally slaughter them – you’ll be rewarded with either steak or gunpowder. If you notice your hunger is starting to drain, right click when holding a food item to eat. A full hunger bar allows you to regenerate health.

Once you’ve gotten bored of the overworld, try your luck underground! In order to enter the cave systems, you must break minecraft’s very first rule – dig straight down. From there, you can explore the elaborately generated caves and even find some iron or diamond ore. Use these new materials to craft some upgraded tools. If you decide you hate them, you can delete any item by dragging it to the red X. 

A quick little crafting guide: https://docs.google.com/document/d/1PgAHedlJuQpnWJiYWfuwLOyFtpWk1e9qJi6qJ0Oz054/edit?usp=sharing

So, you’ve just crafted yourself a shiny diamond sword and oh — that Zombie came out of nowhere, didn’t it? Even with the best tool in the game you couldn’t defeat it, and now, you’re dead. Because <del>we were too lazy to make a respawn button</del> this is a hardcore world, the only thing left to do is close the processing window and start again. Better luck next time.

## Daily Log
**Maya 5/23** - Added class hierarchy system and created all of the files, as well as uploaded each of the images for each class. 

**Sadi 5-23** : I worked to create the worldGeneration method. I added the necessary features to work on the creation of blocks of the worlds. This does not include subtypes of blocks.

**Maya 5/24** - Designed health, hunger, hotbar, and tools, and implemented the display for each of them. Began working on break methods and adding an inventory system, which is still in progress.

**Sadi 5-24**: Continued working on the World Generation by adding visuals and changing the use of Perlin noise. Also established the block subclasses and made the surface.

**Maya 5/25** - Finished break method save for range and animation features. Began working on place.

**Sadi 5-25**: Worked on establishing Biomes and gravity. Gravity and collision with the floor is incredibly frustrating. 

**Maya 5/26** - Finished place method and hunger bar. Created tick system.

**Sadi 5-26**: Continued working on the gravity collision and made a class like the Controller showed in class to smooth the movement. 

**Sadi 5-27**: Made a change to the place and break methods that found the mouse’s coordinates in the world, rather than the screen

**Maya 5/27** - Fixed hunger bar glitch and merged with main.

**Maya 5/28** - Screamed at mobs.

**Maya 5/29** - Worked on the mob class – added attack methods, health bars, and hopelessly failed at a smooth movement system. Also, modified tree creation and added death screen.

**Sadi 5-29**: Made improvements on the collisions and created trees and their spawning

**Maya 5/30** - Finalized everything for the demo, and made some tweaks to mob movement. 

**Sadi 5-30**: Made various edits for debugging and updated cave generation to have 2 kinds of caves

**Maya 5/31** - Added pretty much the entire inventory system, works visually and functionally! Click to drag items across the inventory.

**Maya 6/1** - Created elementary version of crafting system – only works with making planks. Inventory is fully functional!

**Sadi 6-1**: Made changes to the process of breaking blocks to make it take longer.

**Maya 6/2** - Designed new tools, ore blocks, and iron/diamonds. World will now spawn clusters of randomly generated ore. I also rewrote the tool system so that tools can be moved across the inventory and correspond to specific blocks.

**Sadi 6-2**: Made some minor changes to the mining and the terrain generation.

**Maya 6/3** - Added the crafting recipes for each of the new tools, which currently all function with equal mining speeds.

**Sadi 6-3**: Made further changes in the mining, terrain generation, highlights, and attacking methods

**Maya 6/4** - Lost my laptop and was unable to work on the project :(

**Sadi 6-4**: Some slight changes in the player’s attack and stuycraft’s draw methods, and also handled a few merge conflicts

**Maya 6/5** - Laptop still lost, but did make the creeper design.

**Sadi 6-5**: Working on the Tool class and its subclasses to unite the ideas of different types of tools and materials for them. However, a major problem was found in the crafting system.

**Maya 6/6** - Found my laptop! Added (mostly functional) creepers! They will run up to the player and explode in their face – if that isn’t optimal game design, I don’t know what is.

**Sadi 6-6**: Changed crafting to incorporate the new classing hierarchy to allow Items to have properties of Tools.

**Maya 6/7** - Fixed creeper explosion, designed TNT block and gunpowder, and began outlining implementation.

**Maya 6/8** - Began working on adding TNT, and finished class file.

**Sadi 6-8**: Reworked Maya’s looping through the inventory to stop redundant code. This made changing it to fix issues in crafting’s right click much easier.

**Maya 6/9** - Fixed all bugs relating to TNT and creepers!

**Sadi 6-9**: Made some changes to the Tool class and needed to change the image names accordingly. 

**Maya 6/10** - Fixed glitch regarding world borders, break, and place.

**Maya 6/11** - Finalized game by handling various different bugs – fixed block breaking animation, handled mob jump, and added range to the place method.

**Maya 6/12** - Handled some more minor bugs, added user instructions to the readme, and finalized the prototype. 

**Sadi 6-12**: Some more bug fixes and cutting away of extra/useless bits of code
