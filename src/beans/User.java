package beans;

public class User {
    private String saxeli;
    private String gvari;
    private String idnum;
    private String email;
    private String username;
    private String password;

    @Override
    public String toString() {
        return "User{" +
                "saxeli='" + saxeli + '\'' +
                ", gvari='" + gvari + '\'' +
                ", idnum='" + idnum + '\'' +
                ", email='" + email + '\'' +
                ", username='" + username + '\'' +
                ", password='" + password + '\'' +
                '}';
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getSaxeli() {
        return saxeli;
    }

    public void setSaxeli(String saxeli) {
        this.saxeli = saxeli;
    }


    public String getGvari() {
        return gvari;
    }

    public void setGvari(String gvari) {
        this.gvari = gvari;
    }

    public String getIdnum() {
        return idnum;
    }

    public void setIdnum(String idnum) {
        this.idnum = idnum;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }
}
