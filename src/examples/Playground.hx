/* This file is basically which I use while developing. Other examples might be more stable. */
package examples;

import linguistics.*;
import linguistics.tokenizers.*;
import linguistics.languages.*;
import linguistics.dictionaries.*;

class Playground
{
    static public function main():Void {

        var dict:Dictionary = new Dictionary();
        dict.addDocument("A fool thinks himself to be wise, but a wise man knows himself to be a fool.");

        trace( dict.getTotalWordCount() );
        trace( dict.getWordCount() );

    }
}