# EvoForts
Using ml/genAlgo to optimize build orders in the game Forts by EarthWork Games.

!WARNING!: This repo is NOT ready to compile/execute. You need a valid Forts Version to use this!

Plan:
A Python script (EvoForts.py) is creating random build order Instruction files.
These are ready to use mods for Forts which are derived from a Template file (buildOrderTemplate.lua).
The build order instruction files are mods which can be run like a standard mod for the game Forts.
By applying these mods and monitoring the succes of each build order against the built in AI or other 
build orders via the Forts-API function LogToFile(), the Python script can determine how succesfull a
certain build order is to make a score or succesvalue high (or low in case of an Loss function).

These Scores get determined through a Score function which calculates a Score. This Score shows how
good the BuildOrder performs the given task.

The build orders which can reach the highest Score are going to get mutated further and are getting saved for the
next Generation.

The other ones are getting deleted/archived.

First Goal: Get the System to  develop a Fort which can reach out as far as possible to the left (rightside Fort)

Problems to Solve:
  - The biggest Problem for now is, that the Forts Graphics stuff, creates a ton of overhead which is useless and slows the process down.
  One Game at standard speed is probably going to last 5-10 minutes which leads to insane learning time increase.
  Possible Solutions:
    - Massive Parallelization (like running maybe 50 Game instances at once) ->Probably Enourmus RAM use due to Graphics loading for each instance
    - In case of FPS-Cap of the game: Remove FPS-Cap. Since buildorder timing is framebound right now, timing is not a problem
    - In case of frametime dependent Physics (so no FPS-Cap): Speed up the Physics engine itself (Probably extremly hard to do)
    
 Im trying to avoid binary modification as hard as possible since its hard and time consuming. 
 If someone knows how to speed up the game due to vanilla modding or run the simulation without Graphics please let me know :).

To-Do:
Almost Everything ^^
