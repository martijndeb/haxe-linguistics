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

class Playground
{
    static public function main():Void {

        Linguistics.getInstance().setLanguage( English );

        var stemmer:IStemmer = Linguistics.getInstance().getBasicStemmer();

        /*trace( "Expect: R1: iful, R2: ul" );
        trace( stemmer.stem( "beautiful" ) );

        trace( "Expect: R1: y, R2:" );
        trace( stemmer.stem( "beauty" ) );

        trace( "Expect: R1:, R2:" );
        trace( stemmer.stem( "beau" ) );

        trace( "Expect: R1: imadversion, R2: adversion" );
        trace( stemmer.stem( "animadversion" ) );

        trace( "Expect: R1: kled, R2:" );
        trace( stemmer.stem( "sprinkled" ) );

        trace( "Expect: R1: harist, R2: ist" );
        trace( stemmer.stem( "eucharist" ) );*/

        trace( stemmer.stem( "knightly" ) );

    }
}