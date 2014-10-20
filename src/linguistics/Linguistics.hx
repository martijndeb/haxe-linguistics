package linguistics;

import linguistics.languages.ILanguage;
import linguistics.languages.*;

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

    static public function getSupportedLanguages():Array<String> {

        var languageNames:Array<String> = [];
        var languagesList:Array<Class<ILanguage>> = Linguistics.getSupportedLanguageClasses();

        for ( language in languagesList ) {

            var languageInstance:ILanguage = Type.createInstance( language, [] );

            languageNames.push( languageInstance.name );

            languageInstance = null;

        }

        return languageNames;

    }

    static public function getSupportedLanguageClasses():Array<Class<ILanguage>> {

        return [

            Dutch,
            English,
            Frisian,
            German

        ];

    }

    public function setLanguage( ?myLanguage:Class<ILanguage> ):Void {

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

    public function getLengthBasedTokenizer( ?length ):ITokenizer {

        return Type.createInstance( language.lengthBasedTokenizer, [ length ] );

    }

    public function getToken( myTokenString:String, ?myDocumentIndex:Int, ?myRelativeIndex:Int ):IToken {

        return Type.createInstance( language.token, [myTokenString, myDocumentIndex, myRelativeIndex] );

    }

}