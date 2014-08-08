package linguistics.classifiers;

import linguistics.Linguistics;
import linguistics.classifiers.IClassifier;
import linguistics.classifiers.Classification;
import linguistics.tokenizers.ITokenizer;
import linguistics.tokenizers.tokens.IToken;

// Todo: Classifiers would greatly benefit from stemming and filtering words.
// Todo: trainToken method can be optimized
class NaiveBayesClassifier implements IClassifier {

    private var tokenizer:ITokenizer;
    private var documents:haxe.ds.StringMap<Array<String>> = new haxe.ds.StringMap<Array<String>>();
    private var words:haxe.ds.StringMap<haxe.ds.StringMap<Int>> = new haxe.ds.StringMap<haxe.ds.StringMap<Int>>();
    private var labels:haxe.ds.StringMap<haxe.ds.StringMap<Int>> = new haxe.ds.StringMap<haxe.ds.StringMap<Int>>();

    public function addDocument( myDocument:String, myLabel:String ):Void {

        var labelList:Array<String> = documents.exists( myLabel ) ? documents.get( myLabel ) : new Array<String>() ;

        labelList.push( myDocument );
        documents.set( myLabel, labelList );

    }

    public function train( ?myTokenizer:ITokenizer ):Void {

        if ( myTokenizer != null ) {

            tokenizer = myTokenizer;

        } else {

            tokenizer = Linguistics.getInstance().getBasicTokenizer();

        }

        var labelIterator:Iterator<String> = documents.keys();

        for ( label in labelIterator ) {

            var documentsList:Array<String> = documents.get( label );

            for ( document in documentsList ) {

                var tokenList:Array<IToken> = tokenizer.tokenize( document );

                for ( token in tokenList ) {

                    trainToken( token, label );

                }

            }

        }

    }

    public function classify( myString:String ):Array<Classification> {

        var probs:Array<Classification> = new Array<Classification>();

        var doc:String = myString;
        var tokens:Array<IToken> = tokenizer.tokenize( myString );
        var probSum:Float = 0;

        for ( label in labels.keys() ) {

            var prob:Float = probabilityOfLabelGivenDocument( label, tokens );
            probSum += prob;

            probs.push( new Classification(
                label,
                prob,
                probabilityOfLabel( label )
            ) );

        }

        var matchesPc:Bool = true;
        var i:Int = 0;

        while (i < probs.length) {

            if (probSum > 0) {

                probs[i].probability = probs[i].probability / probSum;

            }

            var ratio:Float = probs[i].probability / probs[i].pc;

            if (ratio < 0.95 || ratio > 1.05) {

                matchesPc = false;

            }

            i++;

        }

        if (matchesPc) {

            i = 0;
            while (i < probs.length) {

                probs[i].probability = 0;
                i++;

            }

        }

        haxe.ds.ArraySort.sort(probs, function( x:Dynamic, y:Dynamic ):Int {

            if ( x.probability == y.probability) {

                return 0;

            } else if ( x.probability > y.probability ) {

                return -1;

            } else if ( x.probability < y.probability ) {

                return 1;

            }

            return 0;

        });

        return probs;

    }

    private function trainToken( myToken:IToken, myLabel:String ):Void {

        var word:String = myToken.normalize().toLowerCase();
        var wordCount:Int = 0;
        var labelCount:Int = 0;
        var wordList:haxe.ds.StringMap<Int>;
        var labelList:haxe.ds.StringMap<Int>;

        if ( !words.exists( word ) ) {

            words.set( word, new haxe.ds.StringMap<Int>() );

        }

        if ( !labels.exists( myLabel ) ) {

            labels.set( myLabel, new haxe.ds.StringMap<Int>() );

        }

        wordList = words.get( word );
        labelList = labels.get( myLabel );

        if ( !wordList.exists( myLabel ) ) {

            wordList.set( myLabel, 0 );

        }

        if ( !labelList.exists( word ) ) {

            labelList.set( word, 0 );

        }

        wordCount = wordList.get( myLabel );
        labelCount = labelList.get( word );

        wordList.set( myLabel, ++wordCount );
        words.set( word, wordList );

        labelList.set( word, ++labelCount );
        labels.set( myLabel, labelList );

    }

    private function probabilityOfLabelGivenDocument( label:String, tokens:Array<IToken> ):Float {

        var prob:Float = 1.0;

        for ( token in tokens ) {

            var p = probabilityOfWordGivenLabel( token, label );

            prob *= p;

        }

        prob *= probabilityOfLabel( label );

        return prob;

    }

    private function probabilityOfLabel( label:String ):Float {

        var numLabels:Int = 0;
        var numLabelSets:Int = 0;

        for ( i in labels.get( label ).keys() ) {

            numLabels++;

        }

        for ( i in labels.keys() ) {

            numLabelSets++;

        }

        var pc = numLabels / numLabelSets;

        return pc;

    }

    private function probabilityOfWordGivenLabel( token:IToken, label:String ):Float {

        var numLabels:Int = 0;
        var num:Int = 0;
        var word:String = token.normalize().toLowerCase();

        for ( i in labels.get( label ).keys() ) {

            numLabels++;

        }

        if ( words.exists( word ) && words.get( word).exists( label )) {

            num = words.get( word ).get( label );

        } else {

            num = numLabels;

        }

        var prob:Float = num / numLabels;

        // Prevent div by zero
        if (prob == 0) {

            return 0.0000000001;

        }

        return prob;

    }
}