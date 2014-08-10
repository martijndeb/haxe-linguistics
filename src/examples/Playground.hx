/* This file is basically which I use while developing. Other examples might be more stable. */
package examples;

import linguistics.*;
import linguistics.tokenizers.*;
import linguistics.languages.Dutch;
import linguistics.languages.English;
import linguistics.languages.German;
import linguistics.dictionaries.*;
import linguistics.distances.LevenshteinDistance;
import linguistics.classifiers.IClassifier;
import linguistics.classifiers.NaiveBayesClassifier;
import linguistics.tokenizers.filters.StopwordTokenFilter;
import linguistics.tokenizers.tokens.IToken;
import linguistics.utils.BasicStringBuilder;

class Playground
{
    static public function main():Void {

        Linguistics.getInstance().setLanguage( German );

        var tokenizer:ITokenizer = Linguistics.getInstance().getBasicTokenizer();
        var tokenSet:Array<IToken> = tokenizer.tokenize( "Das Eisen schmieden, solange es heiß ist" );
        trace(tokenSet);

        tokenSet = tokenizer.applyFilter( tokenSet, StopwordTokenFilter );

        trace(tokenSet);
    }
}