package linguistics.languages;

import linguistics.tokenizers.ITokenizer;
import linguistics.tokenizers.tokens.IToken;

interface ILanguage {

    var name:String;

    var basicTokenizer:Class<Dynamic>;
    var lengthBasedTokenizer:Class<Dynamic>;
    var boundaryTokenizer:Class<Dynamic>;

    var basicStemmer:Class<Dynamic>;

    var token:Class<Dynamic>;
    var boundaryToken:Class<Dynamic>;
    var stopwords:Array<IToken>;

    var sentenceBoundaries:Array<String>;

    function createBoundaries():Void;
    function createTokens():Void;

}