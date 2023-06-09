trigger TrainingTrigger on Training__c (before insert, before update) {
    if (Trigger.IsBefore) {
        TrainingTriggerHandler.setDefaultListPriceOnTrainings(Trigger.new);
    }
}