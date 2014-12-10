# Oblique Strategies as-a-Service (for Common Lisp)

Oblique Strategies are a wonderful set of cards, created by Brian Eno and Peter Schmidt, that have little statements on them that can be useful when stuck on creative endeavours. You ca  find out more about them [here](http://www.rtqe.net/ObliqueStrategies/)

[Andrew Monks](http://monks.co/) kindly made a JSON API for being able to randomly or specifically draw a card from any of the first four editions. You can find out more about it [here](http://brianeno.needsyourhelp.org)

(This is my first completed Common Lisp project, so I may not entirely know what I'm doing.)

## Installation

You should probably install and use [QuickLisp](www.quicklisp.org)

```
(push #p"/src/downloaded/oblique-strategies/" asdf:*central-registry*)
(ql:quickload "oblique-strategies")
```

## Usage

### Drawing, describing random card (from any edition)

```
(defvar *card* (oblique-strategies:draw-card))
*CARD*
CL-USER> (oblique-strategies:strategy *card*)
"Emphasise the flaws"
CL-USER> (oblique-strategies:edition *card*)
3
CL-USER> (oblique-strategies:id *card*)
288
CL-USER> (oblique-strategies:card-number *card*)
45
```

### Drawing random card from specific edition
```
CL-USER> (oblique-strategies:edition (oblique-strategies:draw-card 1))
1
```

### Getting card series from specific edition by number
```
CL-USER> (defvar *card* (oblique-strategies:get-card-by-number 1 45))
*card*
CL-USER> (oblique-strategies:edition *card*)
3
CL-USER> (oblique-strategies:card-number *card*)
45
```

### Getting card via internal server ID
```
CL-USER> (oblique-strategies:id (oblique-strategies:get-card-by-id 288))
288
```

### Getting all cards from an edition
```
CL-USER> (oblique-strategies:get-all-cards 3)
```

## Things that need doing
* Error Handling
* Offline lookup

Enjoy! :)

(c) 2014 Gaelan D'costa, MIT License
