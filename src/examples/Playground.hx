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


class Playground
{
    static public function main():Void {

        Linguistics.getInstance().setLanguage(Dutch);
        trace( Linguistics.getInstance().getLanguage().stopwords );

        var tokenizer:ITokenizer = Linguistics.getInstance().getBasicTokenizer();
        trace(tokenizer.tokenize( "Ik heb alles wat je wilt" ));

    }
}