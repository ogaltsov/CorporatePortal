package web.model;


public class SearchQuery {
    private String firstName;
    private String secondName;
    private String position;
    private String department;

    public SearchQuery() {}

    public SearchQuery(String firstName, String secondName, String position, String department) {
        this.firstName = firstName;
        this.secondName = secondName;
        this.position = position;
        this.department = department;
    }

    public String getFirstName() {
        return firstName;
    }

    public String getSecondName() {
        return secondName;
    }

    public String getPosition() {
        return position;
    }

    public String getDepartment() {
        return department;
    }

    @Override
    public String toString() {
        return "SearchQuery{" +
                "firstName='" + firstName + '\'' +
                ", secondName='" + secondName + '\'' +
                ", position='" + position + '\'' +
                ", department='" + department + '\'' +
                '}';
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public void setSecondName(String secondName) {
        this.secondName = secondName;
    }

    public void setPosition(String position) {
        this.position = position;
    }

    public void setDepartment(String department) {
        this.department = department;
    }
}