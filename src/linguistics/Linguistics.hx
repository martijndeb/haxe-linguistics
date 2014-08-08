package linguistics;

import linguistics.languages.ILanguage;
import linguistics.languages.English;

import linguistics.tokenizers.ITokenizer;
import linguistics.tokenizers.tokens.IToken;

class Linguistics {

    static private var instance:Linguistics;

    private var language:ILanguage;

    public function new( ) {

        if ( Linguistics.instance == null ) {

            Linguistics.instance = this;

        }

    }

    static public function getInstance():Linguistics {

        if ( Linguistics.instance == null ) {

            Linguistics.instance = new Linguistics();
            Linguistics.instance.setLanguage();

        }

        return Linguistics.instance;

    }

    public function setLanguage( ?myLanguage:Class<Dynamic> ):Void {

        if ( myLanguage == null ) {

            language = new English();

        } else {

            language = Type.createInstance( myLanguage, [] );

        }

        language.createTokens();

    }

    public function getLanguage():ILanguage {

        return language;

    }

    public function getBasicTokenizer():ITokenizer {

        return Type.createInstance( language.basicTokenizer, [] );

    }

    public function getToken( myTokenString:String, ?myDocumentIndex:Int, ?myRelativeIndex:Int ):IToken {

        return Type.createInstance( language.token, [myTokenString, myDocumentIndex, myRelativeIndex] );

    }

}