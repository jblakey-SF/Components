public class BatchWrapper {
    @InvocableMethod
    public static List<BatchNotificationResults> getAppointments() {
        List<BatchNotificationResults> appointmentList = new List<BatchNotificationResults>();
        
        ContentDocumentQuery contentQuery = new ContentDocumentQuery();
        List<Id> appointmentIds = contentQuery.appointmentIds;

        BatchNotificationResults batchresult = new BatchNotificationResults(appointmentIds);
        appointmentList.add(batchresult);

        return appointmentList;
    }
}
