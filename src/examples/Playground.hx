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
        dict.addDocument("To be, or not to be: that is the question.");
        dict.addDocument("What a piece of work is man! how noble in reason! how infinite in faculty! in form and moving how express and admirable! in action how like an angel! in apprehension how like a god! the beauty of the world, the paragon of animals!");
        dict.addDocument("Suspicion always haunts the guilty mind; The thief doth fear each bush an officer.");

        trace( dict.getDictionaryWords() );

    }
}