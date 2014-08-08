package linguistics.classifiers;

import linguistics.Linguistics;
import linguistics.classifiers.IClassifier;
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

    public function classify( myString:String ):haxe.ds.StringMap<Float> {

        var probabilities:haxe.ds.StringMap<Float> = new haxe.ds.StringMap<Float>();

        return probabilities;

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


}