package linguistics.tokenizers.filters;

import linguistics.tokenizers.filters.ITokenFilter;
import linguistics.tokenizers.tokens.IToken;

class StopwordTokenFilter implements ITokenFilter {

    public function new(){}

    public function filter( myTokenSet:Array<IToken> ):Array<IToken> {

        var filteredSet:Array<IToken> = myTokenSet;

        if ( Linguistics.getInstance().getLanguage().stopwords != null ) {

            filteredSet = myTokenSet.filter(
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