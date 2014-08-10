/* This file is basically which I use while developing. Other examples might be more stable. */
package examples;

import linguistics.*;
import linguistics.tokenizers.*;
import linguistics.languages.Dutch;
import linguistics.languages.English;
import linguistics.dictionaries.*;
import linguistics.distances.LevenshteinDistance;
import linguistics.classifiers.IClassifier;
import linguistics.classifiers.NaiveBayesClassifier;
import linguistics.tokenizers.filters.StopwordTokenFilter;
import linguistics.tokenizers.tokens.IToken;

class Playground
{
    static public function main():Void {

        Linguistics.getInstance().setLanguage(Dutch);

        var dict:Dictionary = new Dictionary();
        var tokenizer:ITokenizer = Linguistics.getInstance().getBasicTokenizer();
        var tokenSet:Array<IToken> = tokenizer.tokenize("Nederlanders drinken 's morgens gemiddeld 2 koppen koffie.");

        dict.addTokens( tokenizer.applyFilter( tokenSet, StopwordTokenFilter ) );

        trace( dict.getDictionaryWords() );

    }
}