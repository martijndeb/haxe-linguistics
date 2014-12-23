package linguistics.languages.nl;

import linguistics.tokenizers.BasicTokenizer;

class BasicTokenizerNL extends BasicTokenizer {

    public function new() {

        super();

        tokenExpression = Dutch.basicTokenExpression;

    }

}
