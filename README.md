Scratching my own itch here. Needed some basic natural language processing tools for simple projects.
I turned to NLTK and NaturalNode, which both are just for a single programming language. Sure you can work around that or wrap it,
but that doesn't give me the fun of working with Haxe and picking my own layout pattern.

I have no formal training in linguistics, but have contributed to multiple open source projects. Kinda making things up as I need them.
Need something? Contribute or open a ticket!

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
Since the beginning English (as main language), Dutch and German have been supported as first class citizens, I added basic support for the Frisian language as a second class citizen. Want to contribute? Take a peek at the Dutch (nl) implementation and send a pull request.

## Tokenizing ##
Basic tokenizers are present for all current supported languages.

```haxe
Linguistics.getInstance().setLanguage(Dutch);
var tokenizer:ITokenizer = Linguistics.getInstance().getBasicTokenizer();
trace(tokenizer.tokenize("Nederlanders drinken 's morgens gemiddeld 2 koppen koffie."));
```

Removing a set of tokens using a token filter
```haxe
Linguistics.getInstance().setLanguage(Dutch);
var tokenizer:ITokenizer = Linguistics.getInstance().getBasicTokenizer();
var tokenSet:Array<IToken> = tokenizer.tokenize("Nederlanders drinken 's morgens gemiddeld 2 koppen koffie.");
trace( tokenizer.applyFilter( StopwordTokenFilter ) );
```

## Dictionary ##
A dictionary indexes tokenized words and keeps track of word count. By default it uses the raw token but you can specify to use the normalized token. If no tokenizer is specified it defaults to the BasicTokenizer for your given language.
```haxe
var dict:Dictionary = new Dictionary();
dict.addDocument("To be, or not to be: that is the question.");
trace( dict.getDictionaryWords() );
```

Or by adding tokens directly (for example after filtering them)
```haxe
Linguistics.getInstance().setLanguage(Dutch);

var dict:Dictionary = new Dictionary();
var tokenizer:ITokenizer = Linguistics.getInstance().getBasicTokenizer();
var tokenSet:Array<IToken> = tokenizer.tokenize("Nederlanders drinken 's morgens gemiddeld 2 koppen koffie.");

dict.addTokens( tokenizer.applyFilter( tokenSet, StopwordTokenFilter ) );

trace( dict.getDictionaryWords() );
```

## String distance ##
Using Levenshtein Distance calculation:
```haxe
trace( LevenshteinDistance.getDistance( "kitten", "sitting" ) );
```

## Classification ##
Currently there is an implementation for a Naive Bayes classificator.
The classificator uses normalized tokens, and if no tokenizer is specified when calling the train method it will default to the BasicTokenizer specified for your language.
Since there is no stemming support yet in this library tokens are unstemmed and unfiltered.

Example is shamelessly copied from NaturalNode documentation.
```haxe
var classifier:IClassifier = new NaiveBayesClassifier();
classifier.addDocument( "i am the long qqqq", "buy" );
classifier.addDocument( "buy the q's", "buy" );
classifier.addDocument( "short gold", "sell" );
classifier.addDocument( "sell gold", "sell" );

classifier.train();

trace(classifier.classify( "i am short silver" ));
```

# Tests #
Some tests might be mising or incomplete due to the premature state of the project, but I try to keep them up to date.
At the moment the tests run only on hx source. I try to support every output format of Haxe, but haven't compiled the tests for everything just yet.

## Running tests ##
Quickest way is to use haxe in interpreter mode

```
cd src/
haxe --main tests.TestCaseRunner --interp
```

# Roadmap #
- Support for n-grams
- Language detection
- Nested tokenization allowing tokens to have a parent and children. (Opening doors for a Sentence or quotation token).
- Applying tags to tokens and being able to filter them based on a token. (This differs from classification, but a classification could be a tag).
- Stemming of languages. (Porter stemmer would be sufficient).
- Parts of speech tagging. (This would require stemming and POS dictionaries).