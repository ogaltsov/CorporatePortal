# EmployeeSearchWebApp (SpringMVC + Hibernate)
______________________________________________
#### One-page web application with forms for employee search
Searches for an employee and displays the search result:

![Screenshot](EmployeeSearchWebApp.png)

###### Realization:
* Spring MVC provide main page
* JS script form AJAX request to server(jQuery)
* Server generate JSON with list of employee
using Hibernate(SQLite)
* Script recieve JSON and form the table

_______________________________________________
###### To run application:
* Config facets
* Deploy **.war** on Tomcat etc
_______________________________________________
###### To do:
- [ ] Replace specific implementations with interfaces
- [ ] Handle possible exceptions(server-side, JS, HTML-inection)
- [x] Case-insensitive search
- [ ] Create messages for wrong search request("null-form(DONE)", "there are no employee")
- [ ] main page send number of latest news by AJAX(now it hardcoded for 5)
- [ ] inject page domain using properties
