package linguistics.languages.fry;

import linguistics.tokenizers.BasicTokenizer;

class BasicTokenizerFRY extends BasicTokenizer {

    public function new() {

        super();

        tokenExpression = Frisian.basicTokenExpression;

    }

}