package linguistics.tokenizers;

import linguistics.tokenizers.ITokenizer;
import linguistics.tokenizers.tokens.IToken;
import linguistics.tokenizers.filters.ITokenFilter;
import linguistics.utils.StringUtility;

using Lambda;
class LengthBasedTokenizer implements ITokenizer {

    private var tokenExpression:EReg = ~/[^a-zA-Z0-9_\-]+/g;
    private var tokenLength:Int = 1;

    public function new ( ?length:Int ) {

        if ( length != null ) {

            tokenLength = length;

        }

    }

    public function tokenize( myString:String ):Array<IToken> {

        var tokenList:String = tokenExpression.split( myString ).filter( StringUtility.isEmpty ).join(" ");
        var tokenSet:Array<IToken> = [];
        var tokenIndex:Int = -1;

        var i = 0;
        while ( i < tokenList.length ) {

            tokenSet.push( cast( Linguistics.getInstance().getToken( tokenList.substr( i, tokenLength ), ++tokenIndex, tokenIndex ), IToken ) );

            i += tokenLength;

        }

        return tokenSet;

    }

    public function applyFilter( myTokenSet:Array<IToken>, myTokenFilter:Class<ITokenFilter> ):Array<IToken> {

        var tokenFilter:ITokenFilter = Type.createInstance( myTokenFilter, [] );

        return tokenFilter.filter( myTokenSet );

    }


}