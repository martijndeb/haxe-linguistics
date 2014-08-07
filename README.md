Scratching my own itch here. Needed some basic natural language processing tools for simple projects.
I turned to NLTK and NaturalNode, which both are just for a single programming language. Sure you can work around that or wrap it,
but that doesn't give me the fun of working with Haxe and picking my own layout pattern.

# Usage #

## Installing ##
You can git clone the repository directly, or use the latest version in haxelib.

### Using haxelib ####
```
haxelib install haxe-linguistics
```

### Using haxelib git ####
```
haxelib git haxe-linguistics https://github.com/sexybiggetje/haxe-linguistics/
```

## Running your application ##
Example applications have been included in the src/examples folder.
```
haxe -main my.namespace.Application -lib haxe-linguisticts --interp
```

## Supported languages ##
Since the beginning English (as main language) and Dutch have been supported. Want to contribute? Take a peek at the Dutch (nl) implementation and send a pull request.

## Tokenizing ##
Basic tokenizers are present for all current supported languages.

```haxe
Linguistics.getInstance().setLanguage(Dutch);
var tokenizer:ITokenizer = Linguistics.getInstance().getBasicTokenizer();
trace(tokenizer.tokenize("Nederlanders drinken 's morgens gemiddeld 2 koppen koffie."));
```

# Tests #
Some tests might be mising or incomplete due to the premature state of the project, but I try to keep them up to date.

## Running tests ##
Quickest way is to use haxe in interpreter mode

```
cd src/
haxe --main tests.TestCaseRunner --interp
```