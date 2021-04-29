public with sharing class OrderEvent{
	public OrderEvent(){
	}

	public static void createEvent(){
		List<Order_Event__e> events = new List<Order_Event__e>();
		Order_Event__e event = new Order_Event__e();
		event.Order_Number__c = '100';
		events.add(event);

		Database.insertImmediate(event);
	}
}