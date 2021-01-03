# EvoForts
Using ml/genAlgo to optimize build orders in the game Forts by Earthworkgames

- !WARNING!: This repo is NOT ready to compile/execute. You need a valid Forts Version to use this!

- Plan:
A Python script (EvoForts.py) is creating random buildOrder Instruction files.
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

To-Do:
Almost Everything ^^
