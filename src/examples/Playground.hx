/* This file is basically which I use while developing. Other examples might be more stable. */
package examples;

import linguistics.*;
import linguistics.tokenizers.*;
import linguistics.languages.*;
import linguistics.dictionaries.*;
import linguistics.distances.LevenshteinDistance;
import linguistics.classifiers.IClassifier;
import linguistics.classifiers.NaiveBayesClassifier;


class Playground
{
    static public function main():Void {

        var classifier:IClassifier = new NaiveBayesClassifier();
        classifier.addDocument( "i am the long qqqq", "buy" );
        classifier.addDocument("buy the q's", "buy");
        classifier.addDocument("short gold", "sell");
        classifier.addDocument("sell gold", "sell");

        classifier.train();

        // Sell should be best match
        trace(classifier.classify('i am short silver'));

        // Buy should be best match
        trace(classifier.classify('i am long copper'));
    }
}