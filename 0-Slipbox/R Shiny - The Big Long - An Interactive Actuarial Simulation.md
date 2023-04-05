# The Big Long - An Interactive Actuarial Simulation R Shiny App

*Source: [casact/shiny_big_long](https://github.com/casact/shiny_big_long)*

This is a game for N >= 2 players, which simulates an insurance marketplace. The marketplace contains a closed set of P policyholders. P should be of some meaningful size, ~ 50,000 or more. The game is comprised of a set of R >= 3 rounds. Each round may be thought of as a single policy period. Each round proceeds as follows:

* Each player submits rate changes for each class of business they write
* Once all changes have been made, the simulation will:
  * Determine which policyholders will consider lapsing
  * For each policyholder which lapses, determine whether and which new carrier they purchase from
  * Determine losses for each policyholder
* The players view the results and make their decisions for the next round

## The game

The game has two states: 1) before, and 2) during 

The admin can do the following things: 

1. begin new game
1. start game
1. advance the round

I'm not certain how to ensure one and only one proper admin. Easy solution: 1) first player in will administer.

## Policyholder behavior

Policyholder decisions are determined algorithmically. Policyholders are rational and myopic. If they want to consider changing carriers, they will purchase the cheapest policy available to them on the market. They will not make any assumption about future pricing decisions from their current or any other carrier. Not all policyholders will lapse during any given round.

## The simulation

### Losses

This is the easiest bit. Compound distribution: negative binomial frequency, gamma severity. The parameters of the distribution may be set by the admin, or read from a database.

We assume (for now) no loss development. All loss amounts are known at the time they occur.

We will assume modest loss cost trend, with some stochasticity.

We will assume no loss frequency trend.

### Lapse

The lapse probability will vary by class. This may be randomly assigned using a beta distribution. If we want to get really fancy (and I might want to) we can establish beta parameters for each class. Then, each policyholder would get their own lapse parameters

---

#### Related

* [Development](../2-Areas/MOCs/Development.md)
* [2-Areas/MOCs/R](../2-Areas/MOCs/R.md)
* [Actuarial Science](../2-Areas/MOCs/Actuarial%20Science.md)
* [CAS - Casualty Actuarial Society](CAS%20-%20Casualty%20Actuarial%20Society.md)

*Backlinks:*

````dataview
list from [[R Shiny - The Big Long - An Interactive Actuarial Simulation]] AND -"Changelog"
````
