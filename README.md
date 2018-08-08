# Padlock Cracker Simulation

Often I'm locking various combination padlocks and idly wonder things like:

* Does how you lock the padlock affect how easy it would be to guess the combination.
* What strategies could you employ for more efficiently guessing the combination.

## Padlock

A simple padlock class, initializing a Padlock will have it generate a random lock code and then set the lock display randomly.

This is to be extended to employ different lock strategies which will set the display differently.

Ideas for locking strategies:

* Lazy - just move all the dials the same direction a similar amount
* Up and Down - move alternating dials up or down a similar amount

## Cracker

The Cracker class will instantiate a new padlock on initialize and store the initial code displayed by the padlock.

The run method will then attempt to crack the padlock and outputs the unlock combination once the lock is unlocked

Currently this just uses a naive brute force method.
This is to be extended by employing different strategies.

Ideas for cracking strategies:

* Start in the middle
* Evens then odds
* Start with the displayed code
