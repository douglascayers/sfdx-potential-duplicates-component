({
    onInit: function( component, event, helper ) {

        var findDuplicatesService = component.find( 'findDuplicatesService' );
        var recordId = component.get( 'v.recordId' );

        findDuplicatesService.findDuplicates( recordId ).then( function ( duplicateRecords ) {
            component.set( 'v.duplicateRecords', duplicateRecords );
            component.set( 'v.showDuplicateRecords', !$A.util.isEmpty( duplicateRecords ) );
        });

    }
})