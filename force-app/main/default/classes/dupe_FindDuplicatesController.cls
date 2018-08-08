/**
 *
 */
public with sharing class dupe_FindDuplicatesController {

    @AuraEnabled
    public static List<SObject> findDuplicates( ID recordId, Integer maxResults ) {

        List<SObject> duplicateRecords = new List<SObject>();

        List<ID> recordIds = new List<ID>{ recordID };

        for ( DataCloud.FindDuplicatesResult result : DataCloud.FindDuplicatesByIds.findDuplicatesByIds( recordIds ) ) {

            System.debug( JSON.serializePretty( result ) );

            if ( result.success ) {

                for ( DataCloud.DuplicateResult dupeResult : result.getDuplicateResults() ) {

                    for ( DataCloud.MatchResult matchResult : dupeResult.matchResults ) {

                        if ( matchResult.success ) {

                            for ( DataCloud.MatchRecord matchRecord : matchResult.matchRecords ) {

                                duplicateRecords.add( matchRecord.record );

                                if ( duplicateRecords.size() >= maxResults ) {
                                    return duplicateRecords;
                                }

                            }

                        }

                    }

                }

            } else {

                for ( Database.Error err : result.errors ) {
                    System.debug( LoggingLevel.ERROR, err );
                }

            }

        }

        return duplicateRecords;
    }

}