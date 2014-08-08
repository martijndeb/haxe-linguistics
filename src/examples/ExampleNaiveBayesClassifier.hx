package examples;

import linguistics.classifiers.IClassifier;
import linguistics.classifiers.NaiveBayesClassifier;

// This sample shamelessly uses the same sample data as NaturalNode documentation.
// Consider it my hommage.
class ExampleNaiveBayesClassifier
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