package linguistics.languages;

import linguistics.languages.ILanguage;

class Dutch implements ILanguage {

    public var name:String = "Dutch";

    public var basicTokenizer:Class<Dynamic> = linguistics.languages.nl.BasicTokenizerNL;
    public var token:Class<Dynamic> = linguistics.tokenizers.tokens.Token;

}