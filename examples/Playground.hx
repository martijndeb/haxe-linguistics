/* This file is basically which I use while developing. Other examples might be more stable. */
package examples;

import linguistics.*;
import linguistics.tokenizers.*;
import linguistics.languages.Dutch;
import linguistics.languages.English;
import linguistics.languages.German;
import linguistics.stemmers.IStemmer;
import linguistics.dictionaries.*;
import linguistics.distances.LevenshteinDistance;
import linguistics.classifiers.IClassifier;
import linguistics.classifiers.NaiveBayesClassifier;
import linguistics.tokenizers.filters.StopwordTokenFilter;
import linguistics.tokenizers.tokens.IToken;
import linguistics.utils.BasicStringBuilder;
import linguistics.analyzers.ConcordanceAnalyzer;

class Playground
{
    static public function main():Void {

        Linguistics.getInstance().setLanguage( Dutch );
        var tokenizer:ITokenizer = Linguistics.getInstance().getBasicTokenizer();

        trace(tokenizer.tokenize( "A man walked down the street, a car crashed into the wall! The man witnissed a massacre" ));

    }
}