# Amazing Robot Battle
Game Design Document

## Autores

Arthur Vieira, NUSP: 6482041

Carlos Molano: NUSP: 10950510

Guilherme Yambanis: NUSP:  8041265

Luiz Girotto, NUSP: 8941189

Mathias Menck, NUSP: 4343470

# Index
1. Index
2. Index
	* Game Design
	* Summary
	* Gameplay
3. Mindset
	* Technical
	* Screens
	* Controls
	* Mechanics
4. Level Design
	* Themes
	* Ambience
	* Objects
	* Ambient
	* Interactive
	* Challenges
	* Game Flow
5. Development
	* Abstract Classes
	* Derived Classes
6. Graphics
	* Style Attributes
	* Graphics Needed
7. Sounds/Music
	* Style Attributes
	* Sounds Needed
	* Music Needed
8. Schedule


# Game Design

## Summary
	Sum up your game idea in 2 sentences. A kind of elevator pitch. Keep it simple!
## Gameplay
	What should the gameplay be like? What is the goal of the game, and what kind of obstacles are in the way? What tactics should the player use to overcome them?
## Mindset
	What kind of mindset do you want to provoke in the player? Do you want them to feel powerful, or weak? Adventurous, or nervous? Hurried, or calm? How do you intend to provoke those emotions?


# Technical
## Screens
Title Screen
Options
Level Select
Game
Inventory
Assessment / Next Level
End Credits
(example)
## Controls
	How will the player interact with the game? Will they be able to choose the controls? What kind of in-game events are they going to be able to trigger, and how? (e.g. pressing buttons, opening doors, etc.)
## Mechanics
	Are there any interesting mechanics? If so, how are you going to accomplish them? Physics, algorithms, etc.


# Level Design
(Note : These sections can safely be skipped if they’re not relevant, or you’d rather go about it another way. For most games, at least one of them should be useful. But I’ll understand if you don’t want to use them. It’ll only hurt my feelings a little bit.)
## Themes
Forest
Mood
Dark, calm, foreboding
Objects
Ambient
Fireflies
Beams of moonlight
Tall grass
Interactive
Wolves
Goblins
Rocks
Castle
Mood
Dangerous, tense, active
Objects
Ambient
Rodents
Torches
Suits of armor
Interactive
Guards
Giant rats
Chests
(example)


## Game Flow
Player starts in forest
Pond to the left, must move right
To the right is a hill, player jumps to traverse it (“jump” taught)
Player encounters castle - door’s shut and locked
There’s a window within jump height, and a rock on the ground
Player picks up rock and throws at glass (“throw” taught)
… etc.
(example)


# Development
## Abstract Classes / Components
BasePhysics
BasePlayer
BaseEnemy
BaseObject
BaseObstacle
BaseInteractable
(example)


## Derived Classes / Component Compositions
BasePlayer
PlayerMain
PlayerUnlockable
BaseEnemy
EnemyWolf
EnemyGoblin
EnemyGuard (may drop key)
EnemyGiantRat
EnemyPrisoner
BaseObject
ObjectRock (pick-up-able, throwable)
ObjectChest (pick-up-able, throwable, spits gold coins with key)
ObjectGoldCoin (cha-ching!)
ObjectKey (pick-up-able, throwable)
BaseObstacle
ObstacleWindow (destroyed with rock)
ObstacleWall
ObstacleGate (watches to see if certain buttons are pressed)
BaseInteractable
InteractableButton
(example)

# Graphics
## Style Attributes
What kinds of colors will you be using? Do you have a limited palette to work with? A post-processed HSV map/image? Consistency is key for immersion.

What kind of graphic style are you going for? Cartoony? Pixel-y? Cute? How, specifically? Solid, thick outlines with flat hues? Non-black outlines with limited tints/shades? Emphasize smooth curvatures over sharp angles? Describe a set of general rules depicting your style here.

	Well-designed feedback, both good (e.g. leveling up) and bad (e.g. being hit), are great for teaching the player how to play through trial and error, instead of scripting a lengthy tutorial. What kind of visual feedback are you going to use to let the player know they’re interacting with something? That they *can* interact with something?


## Graphics Needed
Characters
Human-like
Goblin (idle, walking, throwing)
Guard (idle, walking, stabbing)
Prisoner (walking, running)
Other
Wolf (idle, walking, running)
Giant Rat (idle, scurrying)
Blocks
Dirt
Dirt/Grass
Stone Block
Stone Bricks
Tiled Floor
Weathered Stone Block
Weathered Stone Bricks
Ambient
Tall Grass
Rodent (idle, scurrying)
Torch
Armored Suit
Chains (matching Weathered Stone Bricks)
Blood stains (matching Weathered Stone Bricks)
Other
Chest
Door (matching Stone Bricks)
Gate
Button (matching Weathered Stone Bricks)
(example)

(Note : If you’re soloing you might not need to define this part, as you can just use the Derived Classes + Themes section as a reference. It’s up to you.)


# Sounds/Music
## Style Attributes
	Again, consistency is key. Define that consistency here. What kind of instruments do you want to use in your music? Any particular tempo, key? Influences, genre? Mood?

Stylistically, what kind of sound effects are you looking for? Do you want to exaggerate actions with lengthy, cartoony sounds (e.g. mario’s jump), or use just enough to let the player know something happened (e.g. mega man’s landing)? Going for realism? You can use the music style as a bit of a reference too.
	
	Remember, auditory feedback should stand out from the music and other sound effects so the player hears it well. Volume, panning, and frequency/pitch are all important aspects to consider in both music and sounds - so plan accordingly!


## Sounds Needed
Effects
Soft Footsteps (dirt floor)
Sharper Footsteps (stone floor)
Soft Landing (low vertical velocity)
Hard Landing (high vertical velocity)
Glass Breaking
Chest Opening
Door Opening
Feedback
Relieved “Ahhhh!” (health)
Shocked “Ooomph!” (attacked)
Happy chime (extra life)
Sad chime (died)
(example)

## Music Needed
Slow-paced, nerve-racking “forest” track
Exciting “castle” track
Creepy, slow “dungeon” track
Happy ending credits track
Rick Astley’s hit #1 single “Never Gonna Give You Up”
(example)

(Note : Again, if you’re soloing you might be able to / want to skip this section. It’s up to you.)

# Schedule
(what is a schedule, i don’t even. list is good enough, right? if not add some dates i guess)


develop base classes
base entity
base player
base enemy
base block
base app state
game world
menu world
develop player and basic block classes
physics / collisions
find some smooth controls/physics
develop other derived classes
blocks
moving
falling
breaking
cloud
enemies
soldier
rat
etc.
design levels
introduce motion/jumping
introduce throwing
mind the pacing, let the player play between lessons
design sounds
design music
(example)