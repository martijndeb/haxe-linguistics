package linguistics.tokenizers;

import linguistics.tokenizers.ITokenizer;
import linguistics.tokenizers.tokens.IToken;
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

        var filteredSet:Array<IToken> = tokenSet;

        if ( Linguistics.getInstance().getLanguage().stopwords != null ) {

            filteredSet = tokenSet.filter(
                function ( myToken:IToken ):Bool {
                    var stopwords:Array<IToken> = Linguistics.getInstance().getLanguage().stopwords;
                    for (stopword in stopwords.iterator()) {

                        if ( stopword.isEqualToToken(myToken) ) {

                            return false;

                        }

                    }

                    return true;
                }
            );

        }

        return filteredSet;

    }

}