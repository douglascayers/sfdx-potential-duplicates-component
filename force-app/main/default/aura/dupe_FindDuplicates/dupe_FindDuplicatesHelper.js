({
    handleFindDuplicates: function( component, recordId, maxResults ) {
        return component.lax.enqueue(
            'c.findDuplicates',
            {
                'recordId' : recordId,
                'maxResults' : maxResults
            }
        );
    }
})