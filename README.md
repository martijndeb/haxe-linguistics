Scratching my own itch here. Needed some basic natural language processing tools for simple projects.
I turned to NLTK and NaturalNode, which both are just for a single programming language. Sure you can work around that or wrap it,
but that doesn't give me the fun of working with Haxe and picking my own layout pattern.

## Supported languages ##
Since the beginning English (as main language) and Dutch have been supported. Want to contribute? Take a peek at the Dutch (nl) implementation and send a pull request.

## Tokenizing ##
Basic tokenizers are present for all current supported languages.

```haxe
Linguistics.getInstance().setLanguage(Dutch);
var tokenizer:ITokenizer = Linguistics.getInstance().getBasicTokenizer();
trace(tokenizer.tokenize("Nederlanders drinken 's morgens gemiddeld 2 koppen koffie."));
```
