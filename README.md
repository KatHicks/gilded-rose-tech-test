# Practice Technical Test: Gilded Rose
### Makers Academy Week 10

[![Build Status](https://travis-ci.org/KatHicks/gilded-rose-tech-test.svg?branch=master)](https://travis-ci.org/KatHicks/gilded-rose-tech-test) [![Code Climate](https://lima.codeclimate.com/github/KatHicks/gilded-rose-tech-test/badges/gpa.svg)](https://lima.codeclimate.com/github/KatHicks/gilded-rose-tech-test)

### Instructions

Welcome to team Gilded Rose. As you know, we are a **small inn** with a prime location in a prominent city run by a friendly innkeeper named Allison. We also **buy and sell** only the finest **goods**. Unfortunately, our **goods are constantly degrading in quality as they approach their sell by date**. We have a **system in place that updates our inventory** for us. It was developed by a no-nonsense type named Leeroy, who has moved on to new adventures. Your **task is to add the new feature to our system** so that we can begin **selling a new category of items**. First an introduction to our system:

**All items have a SellIn value which denotes the number of days we have to sell the item**. **All items have a Quality value which denotes how valuable the item is**. At the end of each day our system lowers both values for every item. Pretty simple, right? Well this is where it gets interesting:

* Once the sell by date has passed, Quality degrades twice as fast
* The Quality of an item is never negative
* “Aged Brie” actually increases in Quality the older it gets
* The Quality of an item is never more than 50
* “Sulfuras”, being a legendary item, never has to be sold or decreases in Quality
* “Backstage passes”, like aged brie, increases in Quality as it’s SellIn value approaches; Quality increases by 2 when there are 10 days or less and by 3 when there are 5 days or less but Quality drops to 0 after the concert
* **We have recently signed a supplier of conjured items. This requires an update to our system:**
  * **“Conjured” items degrade in Quality twice as fast as normal items**

Feel free to make any changes to the UpdateQuality method and add any new code as long as everything still works correctly. However, do not alter the Item class or Items property as those belong to the goblin in the corner who will insta-rage and one-shot you as he doesn’t believe in shared code ownership (you can make the UpdateQuality method and Items property static if you like, we’ll cover for you)."

**Choose [legacy code](https://github.com/emilybache/GildedRose-Refactoring-Kata) (translated by Emily Bache) in the language of your choice. The aim is to practice good design in the language of your choice. Refactor the code in such a way that adding the new "conjured" functionality is easy.**

### Approach

* Wrote tests for all of the specifications written in the Instructions
* Made sure that all the tests were passing and then moved onto refactoring the code
* Refactoring techniques:
  * Pulled item class out into a separate file
  * Extracted out a lot of the boolean logic to private guard clauses
  * Simplified the logic for making sure that the quality property for an item never falls below zero or rises above 50 by adding validation logic into the change_quality method
  * Extracted magic numbers to constants
  * Inverted a lot of the bang guard clauses into positive boolean tests - makes the logic more readable
* Once had refactored the code sufficiently, added in the new feature

### Reflections

* Think that the refactoring could be taken further as the update_quality method is still quite long
* Method still relies on change_quality sometimes being called twice on the same item within its block in the loop based on the logic which is hard to see initially - so, for example, item will have 1 deducted as normal and then if it's sell by date has passed it will have another 1 deducted later on in the block
  * Think that this is confusing and could be restructured - but it is a more drastic change that may mean just re-writing the method entirely rather than moving small bits around
* Not quite decided whether the quality increments need to be extracted to constants and count as magic numbers as well
* Found the feature_spec file really helpful for seeing the exact names of the special products - noticed that the full names were not included in the README specs
