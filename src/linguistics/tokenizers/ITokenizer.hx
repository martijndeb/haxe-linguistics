package linguistics.tokenizers;

import linguistics.tokenizers.tokens.IToken;

interface ITokenizer {

    function tokenize ( myString:String ):Array<IToken>;

}