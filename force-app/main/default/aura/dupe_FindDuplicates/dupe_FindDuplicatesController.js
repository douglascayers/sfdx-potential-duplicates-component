({
    onFindDuplicates: function( component, event, helper ) {
        var args = event.getParam( 'arguments' );
        return helper.handleFindDuplicates( component, args.recordId, args.maxResults );
    }
})