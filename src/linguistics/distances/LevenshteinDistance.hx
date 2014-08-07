package linguistics.distances;

class LevenshteinDistance {

    public static function getDistance( left:String, right:String ):Int {

        if ( left.length == 0 ) {

            return right.length;

        }

        if ( right.length == 0 ) {

            return left.length;

        }

        var matrix = [];

        var i:Int = 0;
        while ( i < right.length ) {

          matrix[ i ] = [ i ];
          i++;

        }

        var j:Int = 0;
        while ( j < left.length ) {

          matrix[ 0 ][ j ] = j;
          j++;

        }

        i = 1;
        while ( i < right.length ) {

            j = 1;
            while ( j < left.length ) {

                if ( right.charAt( i - 1) == left.charAt( j - 1 ) ) {

                    matrix[ i ][ j ] = matrix[ i - 1 ][ j - 1 ];

                } else {

                    matrix[ i ][ j ] = cast( Math.min( matrix[ i - 1][ j - 1] + 1, // substitution
                                                 Math.min( matrix[ i ][ j - 1 ] + 1, // insertion
                                                           matrix[ i - 1 ][ j ] + 1)), Int); // deletion

                }

                j++;
            }

            i++;
        }

        return matrix[ right.length - 1 ][ left.length - 1 ];

    }

}