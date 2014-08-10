package linguistics.languages.fry;

import linguistics.tokenizers.BasicTokenizer;

class BasicTokenizerFRY extends BasicTokenizer {

    public function new() {

        tokenExpression = ~/[^a-zA-Z0-9_\-âêéôûúÂÊÉÔÛÚ]+/g;

    }

}