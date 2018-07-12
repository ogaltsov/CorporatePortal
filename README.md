# Corporate Portal (SpringMVC + Spring Security + Hibernate)
______________________________________________
#### Corporate portal with authorization


###### Structure:
* Home page (with latest news)
* News (all news)
* Employee (emloyee search form) - **only for logged users**
* Login & personal account

###### Realization:
* Spring MVC
* JS script form AJAX request to server(jQuery)
* in-memory database SQLite
* Hibernate 
* Jetty servlet container

_______________________________________________
###### To run application:
* Config facets
* run maven command: **jetty:run**
_______________________________________________
###### To do:
- [ ] Replace specific implementations with interfaces
- [ ] Handle possible exceptions(server-side, JS, HTML-inection)
- [x] Case-insensitive search
- [x] Create messages for wrong search request("null-form", "there are no employee")
- [ ] mainPage and newsPage send number of news by AJAX(now it hardcoded for 5)
- [x] inject page domain using properties
- [x] fix autowiring for dao
- [x] UTF-8 for login input
- [x] login/pass limits
- [ ] realize comments for news
- [ ] realize ADMIN_role with 
      - editing employee list
      - registration for new employee
      - redacting news
- [ ] testing
- [ ] logging
