package linguistics.tokenizers;

import linguistics.tokenizers.ITokenizer;
import linguistics.tokenizers.tokens.IToken;
import linguistics.tokenizers.filters.ITokenFilter;
import linguistics.utils.StringUtility;

using Lambda;
class BasicTokenizer implements ITokenizer {

    private var tokenExpression:EReg = ~/[^a-zA-Z0-9_\-]+/g;

    public function tokenize( myString:String ):Array<IToken> {

        var tokenList:Array<String> = tokenExpression.split( myString ).filter( StringUtility.isEmpty );
        var tokenSet:Array<IToken> = [];
        var tokenIndex:Int = -1;

        tokenSet = tokenList.map( function( tokenString:String ):IToken {

            return cast( Linguistics.getInstance().getToken( tokenString, ++tokenIndex, tokenIndex ), IToken );

        } ).array();

        return tokenSet;

    }

    public function applyFilter( myTokenSet:Array<IToken>, myTokenFilter:Class<ITokenFilter> ):Array<IToken> {

        var tokenFilter:ITokenFilter = Type.createInstance( myTokenFilter, [] );

        return tokenFilter.filter( myTokenSet );

    }


}