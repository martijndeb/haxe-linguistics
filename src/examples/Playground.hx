/* This file is basically which I use while developing. Other examples might be more stable. */
package examples;

import linguistics.*;
import linguistics.tokenizers.*;
import linguistics.languages.*;
import linguistics.dictionaries.*;
import linguistics.distances.LevenshteinDistance;


class Playground
{
    static public function main():Void {

        trace( LevenshteinDistance.getDistance( "kitten", "sitting" ) );
        trace( LevenshteinDistance.getDistance( "Saturday", "Sunday" ) );

    }
}