package entity;

public class Contact {
    private int id;
    private String title;
    private String address;
    private String city;
    private String country;
    private String telephone;
    private String email;

    public Contact() {
    }

    public Contact(int id, String title, String address, String city, String country, String telephone, String email) {
        this.id = id;
        this.title = title;
        this.address = address;
        this.city = city;
        this.country = country;
        this.telephone = telephone;
        this.email = email;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public String getCountry() {
        return country;
    }

    public void setCountry(String country) {
        this.country = country;
    }

    public String getTelephone() {
        return telephone;
    }

    public void setTelephone(String telephone) {
        this.telephone = telephone;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    @Override
    public String toString() {
        return title;
    }

}
