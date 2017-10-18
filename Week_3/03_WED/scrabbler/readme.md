# Scrabble

## Setup 

1. Fork and clone (remember to clone YOUR fork).
2. Run `bundle install`.
3. Run `rspec`.

This will run several tests on the code in the `lib/scrabble_word.rb` file. The first time you run `rspec` all the tests will fail because there basically isn't any code in `lib/scrabble_word.rb`.

Your goal is to add code to `lib/scrabble_word.rb` such that all the tests pass. Until you get to the bonus, **there is no need to modify any files except `lib/scrabble_word.rb`**. 

If you've never played the game Scrabble before, you may want to ask your neighbor about the rules of the game and how words are scored.

## Prompt

* Define a class named ScrabbleWord with an `initialize` method that takes one argument, `word`, and stores it in an instance variable `@word`.

* Write a "getter" for this instance variable `@word` that returns the word as a lowercase string.

* Define a method `.score` that returns the scrabble score of the word.

* Define a method `.multiplier_score` that takes a multiplier as an argument and returns a multiplied value of the score. (Think double or triple word score.)

Here are the letter values. Think about how you might put this data in a usable format for your methods above.

```
a: 1, b: 3, c: 3, d: 2, e: 1,
f: 4, g: 2, h: 4, i: 1, j: 8,
k: 5, l: 1, m: 3, n: 1, o: 1,
p: 3, q: 10, r: 1, s: 1, t: 1,
u: 1, v: 4, w: 4, x: 8, y: 4,
z: 10
```

## Deliverable

Submit a pull request with your current progress. Include your Completeness (1-5) and Comfort (1-5). We recommend you include your pseudocode, comments, and descriptions of areas where you had difficulty.

