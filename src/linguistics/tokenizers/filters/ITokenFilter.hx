package linguistics.tokenizers.filters;

import linguistics.tokenizers.tokens.IToken;

interface ITokenFilter {

    function filter( myTokenSet:Array<IToken> ):Array<IToken>;

}