# StuyCraft
We are Budget Notch – With Stuyle!
Sadi Nirloy and Maya Nelson, APCS Period 4

Essentially, we’re creating Minecraft – except it’s 2D, there’s like 5 different blocks, and crafting is unheard of. Sounds fun, doesn’t it? You’ll spawn in a randomly generated, side-view world whose terrain has been created using the Perlin Noise algorithm. From there you can do many fun things such as: Break blocks. Place blocks. Explore biomes. Kill mobs. Eat food. And even die! If this sounds like your idea of a good time, then read on to learn more about StuyCraft!

Prototype: https://docs.google.com/document/d/1hvmhWtNm2Brv1oT8EhkH3Dw177Pr_w1sVpRqVbsptM4/edit?usp=sharing

## Daily Log

Maya **5/23** - Added class hierarchy system and created all of the files, as well as uploaded each of the images for each class. 

Sadi **5-23** : I worked to create the worldGeneration method. I added the necessary features to work on the creation of blocks of the worlds. This does not include subtypes of blocks.

Maya **5-24** - Designed health, hunger, hotbar, and tools, and implemented the display for each of them. Began working on break methods and adding an inventory system, which is still in progress.

Sadi**5-24**: Continued working on the World Generation by adding visuals and changing the use of Perlin noise. Also established the block subclasses and made the surface.

Maya **5-25** - Finished break method save for range and animation features. Began working on place.

Sadi **5-25**: Worked on establishing Biomes and gravity. Gravity and collision with the floor is incredibly frustrating. 

Maya **5-26** - Finished place method and hunger bar. Created tick system.
Sadi **5-26**: Continued working on the gravity collision and made a class like the Controller showed in class to smooth the movement. 

Sadi **5-27**: Made a change to the place and break methods that found the mouse’s coordinates in the world, rather than the screen

Maya **5-27** - Fixed hunger bar glitch and merged with main.

Maya **5-28** - Screamed at mobs.

Maya **5-29**- Worked on the mob class – added attack methods, health bars, and hopelessly failed at a smooth movement system. Also, modified tree creation and added death screen.

Sadi Nirloy **5-29**: Made improvements on the collisions and created trees and their spawning

Maya **5-30** - Finalized everything for the demo, and made some tweaks to mob movement. 

Sadi **5-30**: Made various edits for debugging and updated cave generation to have 2 kinds of caves

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

So, you’ve just crafted yourself a shiny diamond sword and oh — that Zombie came out of nowhere, didn’t it? Even with the best tool in the game you couldn’t defeat it, and now, you’re dead. Because we were too lazy to make a respawn button this is a hardcore world, the only thing left to do is close the processing window and start again. Better luck next time.

