package linguistics.languages;

import linguistics.languages.ILanguage;

class English implements ILanguage {

    public var name:String = "English";

    public var basicTokenizer:Class<Dynamic> = linguistics.tokenizers.BasicTokenizer;
    public var token:Class<Dynamic> = linguistics.tokenizers.tokens.Token;

}