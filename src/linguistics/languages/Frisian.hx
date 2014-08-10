package linguistics.languages;

import linguistics.languages.ILanguage;
import linguistics.tokenizers.ITokenizer;
import linguistics.tokenizers.tokens.IToken;

class Frisian implements ILanguage {

    public var name:String = "Frisian";

    public var basicTokenizer:Class<Dynamic> = linguistics.tokenizers.BasicTokenizer;
    public var token:Class<Dynamic> = linguistics.tokenizers.tokens.Token;

    public var stopwords:Array<IToken>;

    public function createTokens():Void {

        var tokenizer:ITokenizer = Type.createInstance( basicTokenizer, [] );

        // TODO: Stopwords could be improved
        stopwords = tokenizer.tokenize(

            "de fan in it en yn nei is foar troch fan op as mei jo dizze net"

        );

    }

}