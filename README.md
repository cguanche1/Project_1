# Project_1


In order to find the dimensions of the displays across the cafe, we used crosshairs that we can move across the entire screen space to determine dimensions of the display panels. To do this, two white lines that extended across the black screen move up, down, left, and right using the arrow keys. The approximate x and y-coordinates are labeled next to the intersection of the lines. 

Aside from the large contiguous display inside the cafe, the square display panels are labeled from "A" to "O". 

Included is a diagram of areas of the screen space that are mapped to the labeled physical display spaces.

Link to Carlos' Finished Project: https://www.youtube.com/watch?v=KPm2EWBz6EY&feature=youtu.be



The Becton Center wall display is divided into 17 different sections. The native resolution of the entire display is 1024 x 768.

The largest parts are the two sections mounted in the Becton café, on the wall and ceiling. 

Ceiling- x: 676-1023	y: 0-448

Wall-	 x: 676-1023	y: 453-767

Note that they are almost perfectly contiguous with the exception of a five-pixel strip between y=448 and y=453

The smaller hallway squares are each 24 pixels wide and 21 pixels tall. Their locations, if they are listed from RIGHT to LEFT when one is FACING the entrance to the Becton café, are:

-First East-Facing Wall-

A-		x: 578-602		y: 660-681

B-		x: 521-545		y: 590-611

C-		x: 498-522		y: 570-591

D-		x: 472-496		y: 680-701

E-		x: 444-468		y: 590-611

F-              x: 420-444		y: 611-632

G-		x: 397-421		y: 611-632

H-		x: 362-386		y: 570-591

-South-Facing Wall-

I-		x: 306-330		y: 570-591

J-		x: 283-307		y: 590-611

K-		x: 183-207		y: 592-613

L-		x: 125-149		y: 612-633

-Second East-Facing Wall-

M-		x: 88-112		y: 592-613

N-		x: 64-88		y: 612-633

O-		x: 0-24			y: 573-594



=========PANEL DISPLAY SOFTWARE============

PanelDisplayer contains a program that allows for simple mapping to the panels listed above. Some important things to note about its contents:

1. wPanel is a class containing information for an arbitrary 'panel,' one instance for each actual panel is created with their coordinates as we found them

2. panelScale allows for the adjustment of the abstract 'window' in which drawing for each panel occurs, a square with side lengths of this size in pixels (of range 0-panelScale) will be scaled down to fit into the panels at the time of drawing.

3. panelList simply contains a list of all the panels for the sake of iteration and such later.

4. unusedPanels is an arraylist that contains all of the currently unused panels for the sake of keeping track and allowing for new classes to select from panels that are not currently used. It is populated during setup currently but this can be changed.

5. The wPanel class has 2 methods within it: drawPrep, which prepares, through scaling and translation, to draw to that panel, in the 'window' determined by panelScale and drawSet, which resets the scale and translation so that other things may be drawn normally or so another panel may run drawPrep without error.

Within PanelDisplayer currently is a demo class, pSquares, that shows what you can do with these functions, by randomly selecting unused panels and flashing squares onto them for a breif period of tim, which fall and disappear leaving the panel free to be used again.
