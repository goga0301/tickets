package beans;

public class session {
    private int id;
    private String cinema;
    private String film;
    private String language;
    private String quality;
    private String sessiondate;
    private String sessiontime;
    private String tickets;
    private double defPrice = 8;
    private double price;

    public double getDefPrice() {
        return defPrice;
    }

    public void setDefPrice(double defPrice) {
        this.defPrice = defPrice;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }



    public String getLanguage() {
        return language;
    }

    public void setLanguage(String language) {
        this.language = language;
    }

    public String getQuality() {
        return quality;
    }

    public void setQuality(String quality) {
        this.quality = quality;
    }


    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getCinema() {
        return cinema;
    }

    public void setCinema(String cinema) {
        this.cinema = cinema;
    }

    public String getFilm() {
        return film;
    }

    public void setFilm(String film) {
        this.film = film;
    }

    public String getSessiondate() {
        return sessiondate;
    }

    public void setSessiondate(String sessiondate) {
        this.sessiondate = sessiondate;
    }

    public String getSessiontime() {
        return sessiontime;
    }

    public void setSessiontime(String sessiontime) {
        this.sessiontime = sessiontime;
    }

    public String getTickets() {
        return tickets;
    }

    public void setTickets(String tickets) {
        this.tickets = tickets;
    }
}
