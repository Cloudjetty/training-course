public inherited sharing class ProductSelector {
    public static List<Product2> getProductsByIds(List<Id> productIds) {
        return [
            SELECT Id, Name,
                (
                    SELECT Id, UnitPrice, Pricebook2Id
                    FROM PriceBookEntries
                )
            FROM Product2
            WHERE Id IN: productIds
        ];
    }
}