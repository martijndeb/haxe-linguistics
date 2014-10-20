package linguistics.languages;

import linguistics.tokenizers.ITokenizer;
import linguistics.tokenizers.tokens.IToken;

interface ILanguage {

    var name:String;

    var basicTokenizer:Class<Dynamic>;
    var lengthBasedTokenizer:Class<Dynamic>;
    var token:Class<Dynamic>;
    var stopwords:Array<IToken>;

    function createTokens():Void;

}