package linguistics.languages;

import linguistics.languages.ILanguage;
import linguistics.tokenizers.ITokenizer;
import linguistics.tokenizers.tokens.IToken;

class LanguageBase implements ILanguage {

    public var basicTokenExpression:EReg = ~/[^a-zA-Z0-9_\-]+/g;

    public var name:String = null;

    public var basicTokenizer:Class<Dynamic> = linguistics.tokenizers.BasicTokenizer;
    public var lengthBasedTokenizer:Class<Dynamic> = linguistics.tokenizers.LengthBasedTokenizer;

    public var token:Class<Dynamic> = linguistics.tokenizers.tokens.Token;

    public var basicStemmer:Class<Dynamic> = null;

    public var stopwords:Array<IToken>;

    public var sentenceBoundaries:Array<String>;

    public function new() {

        setProperties();

    }

    public function createBoundaries():Void {

        sentenceBoundaries = [ "?", "!", "." ];

    }

    public function createTokens():Void {

        throw "Override this function in your class";

    }

    private function setProperties():Void {

        throw "Override this function in your class";

    }

}