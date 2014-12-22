package linguistics.languages.de;

import linguistics.tokenizers.BasicTokenizer;

class BasicTokenizerDE extends BasicTokenizer {

    public function new() {

        tokenExpression = German.basicTokenExpression;

    }

}