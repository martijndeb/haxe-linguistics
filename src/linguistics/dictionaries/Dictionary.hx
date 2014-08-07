package linguistics.dictionaries;

import linguistics.Linguistics;
import linguistics.tokenizers.ITokenizer;
import linguistics.tokenizers.tokens.IToken;

class Dictionary {

    private var normalizeTokens:Bool = false;
    private var tokenizer:ITokenizer;

    private var dict:haxe.ds.StringMap<Int> = new haxe.ds.StringMap<Int>();
    private var wordCount:Int = 0;
    private var totalWordCount:Int = 0;

    public function new ( ?doNormalizeTokens:Bool, ?myTokenizer:ITokenizer ) {

        if ( myTokenizer != null ) {

            tokenizer = myTokenizer;

        } else {

            tokenizer = Linguistics.getInstance().getBasicTokenizer();

        }

        if ( doNormalizeTokens ) {

            normalizeTokens = true;

        }

    }

    public function addDocument( myDocument:String ):Void {

        var tokenList:Array<IToken> = tokenizer.tokenize( myDocument );
        var iterator:Iterator<IToken> = tokenList.iterator();

        for ( token in iterator) {

            var tokenKey = normalizeTokens ? token.token : token.normalize();

            if ( !dict.exists( tokenKey ) ) {

                dict.set( tokenKey, 1 );
                wordCount++;

            } else {

                dict.set( tokenKey, dict.get( tokenKey ) + 1 );

            }

            totalWordCount++;

        }

    }

    public function getDictionaryWords():Array<String> {

        var wordList:Array<String> = new Array<String>();
        var iterator:Iterator<String> = dict.keys();

        for ( word in iterator ) {

            wordList.push( word );

        }

        return wordList;

    }

    public function getDictionary():haxe.ds.StringMap<Int> {

        return dict;

    }

    public function getWordCount():Int {

        return wordCount;

    }

    public function getTotalWordCount():Int {

        return totalWordCount;

    }

}