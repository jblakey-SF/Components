public with sharing class ContentDocumentQuery {
    public List<Id> appointmentIds;



    public ContentDocumentQuery() {
       
        
        List<ContentVersion> contentVersionsQuery = [SELECT ContentDocumentId FROM ContentVersion WHERE CreatedDate = TODAY];
        
        List<Id> contentVersionDocIds = new List<Id>();
        for (ContentVersion contentVersion : contentVersionsQuery) {
            contentVersionDocIds.add(contentVersion.ContentDocumentId);
        }
        
        List<ContentDocumentLink> contentDocumentLinkQuery = [SELECT LinkedEntityId FROM ContentDocumentLink WHERE ContentDocumentId IN :contentVersionDocIds];
        
        List<Id> linkedEntityIds = new List<Id>();
        for (ContentDocumentLink contentDocumentLink : contentDocumentLinkQuery) {
            linkedEntityIds.add(contentDocumentLink.LinkedEntityId);
        }
        List<Appointment__c> appointmentQuery = [SELECT Id FROM Appointment__c WHERE Id IN :linkedEntityIds];
        List<Id> recordIds = new List<Id>();
        for (Appointment__c appointments : appointmentQuery) {
            recordIds.add(appointments.Id);
        }
        this.appointmentIds = recordIds;

        
        System.debug('Content Version Document IDs: ' + contentVersionDocIds);
        System.debug('Linked Entity IDs: ' + linkedEntityIds);
        
        System.debug('Appointment Query: ' + AppointmentQuery);
    }

}
