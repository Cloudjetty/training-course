public without sharing class TrainingTriggerHandler {
    public static void setDefaultListPriceOnTrainings(List<Training__c> trainings) {
        List<Id> productIds = new List<Id>();

        for (Training__c training : trainings) {
            if (training.Product__c != null) {
                productIds.add(training.Product__c);
            }
        }

        Map<Id, Product2> trainingProducts = new Map<Id, Product2> (ProductSelector.getProductsByIds(productIds));

        for (Training__c training : trainings) {
            if (trainingProducts.get(training.Product__c) != null) {
                List<PriceBookEntry> priceBookEntries = trainingProducts.get(training.Product__c)?.PriceBookEntries;
                training.ListPrice__c = priceBookEntries[0].UnitPrice;  
            } else {
                training.ListPrice__c = 0;
            }
        }
    }
} 