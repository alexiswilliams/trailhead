public with sharing class AnimalLocator{
	@testVisible
	private static final String HTTP_ANIMAL_LOCATOR_URL = 'https://th-apex-http-callout.herokuapp.com/animals/';
	public static String getAnimalNameById(Integer AnimalLocatorId){
		Http http = new Http();
		HttpRequest request = new HttpRequest();
		request.setEndpoint(HTTP_ANIMAL_LOCATOR_URL + String.escapeSingleQuotes(String.valueOf(AnimalLocatorId)));
		request.setMethod('GET');
		HttpResponse response = http.send(request);
		AnimalResult result = (AnimalResult)JSON.deserialize(response.getBody(), AnimalResult.class);

		return result.Animal.name;
	}

	public class Animal{
		public Integer id;
		public String eats;
		public String name;
		public String says;
	}

	public class AnimalResult{
		public Animal animal;

	}
}