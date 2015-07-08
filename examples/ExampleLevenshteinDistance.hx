package examples;

import linguistics.distances.LevenshteinDistance;

class ExampleLevenshteinDistance
{
    static public function main():Void {

        trace( LevenshteinDistance.getDistance( "kitten", "sitting" ) );

    }
}