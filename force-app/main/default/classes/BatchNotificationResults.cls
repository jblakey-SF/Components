public with sharing class BatchNotificationResults{
    
   
        @InvocableVariable
        public List<Id> appointmentIds;

        
        public BatchNotificationResults(List<Id> ids) {
            this.appointmentIds = ids;
        }
    
    
  
}
