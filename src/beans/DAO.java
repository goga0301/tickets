package beans;


import beans.Films;

import java.lang.reflect.Array;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class DAO {
    private static final String USERNAME = "root";
    private static final String PASSWORD = "password";
    private static final String CONN_STRING = "jdbc:mysql://localhost:3306/tickets?characterEncoding=utf8";


    public static Connection getConnection() throws ClassNotFoundException {
        com.mysql.jdbc.Connection con = null;
        Class.forName("com.mysql.jdbc.Driver");
        try {
            con = (com.mysql.jdbc.Connection) DriverManager.getConnection(CONN_STRING, USERNAME, PASSWORD);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return con;
    }

    public static List<Films> getFilms() {
        List<Films> list = new ArrayList<Films>();
        try {
            Connection con = getConnection();
            PreparedStatement ps = con.prepareStatement("select * from tickets.films");
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Films f = new Films();
                f.setName(rs.getString(2));
                f.setGenre(rs.getString(3));
                f.setDescription(rs.getString(4));
                f.setYear(rs.getInt(5));
                f.setCountry(rs.getString(6));
                f.setDuration(rs.getInt(7));
                f.setDirector(rs.getString(8));
                f.setBudget(rs.getString(9));
                f.setIncome(rs.getString(10));
                f.setImdb(rs.getDouble(11));
                f.setTrailer(rs.getString(12));
                f.setImgpath(rs.getString(13));
                list.add(f);
            }

        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }
        return list;


    }
    public static ArrayList<String> getCinemas() throws ClassNotFoundException {
        ArrayList<String> cinemas = new ArrayList<>();

        try {
            Connection con = getConnection();
            PreparedStatement ps = con.prepareStatement("select * from tickets.cinema");
            ResultSet rs = ps.executeQuery();
            while(rs.next()) {
                cinemas.add(rs.getString(2));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return cinemas;
    }

    public static ArrayList<session> getSessions(String filmname)  {
        ArrayList<session> sessions = new ArrayList<session>();
        try {
            Connection con = getConnection();
            PreparedStatement ps = con.prepareStatement("select * from \n" +
                    "(select g.id,g.cinemaname,g.film,g.language,g.quality,g.sessiondate,g.sessiontime,g.tickets,g.language_price,h.quality_price from\n" +
                    "(select e.id,e.cinemaname,e.film,e.language,e.sessiondate,e.sessiontime,e.tickets,f.language_price,e.quality from\n" +
                    "(select c.id,c.cinemaname,d.film,c.sessiondate,c.sessiontime,c.tickets,c.language,c.quality from\n" +
                    "(select a.id,a.cinema_id,a.film_id,a.sessiondate,a.sessiontime,a.tickets,a.language,a.quality,b.cinemaname from tickets.sessions a\n" +
                    "inner join tickets.cinema b\n" +
                    "where a.cinema_id = b.id) c\n" +
                    "inner join tickets.films d\n" +
                    "where c.film_id = d.id) e\n" +
                    "inner join tickets.language f\n" +
                    "where e.language = f.language) g\n" +
                    "inner join tickets.quality h\n" +
                    "where h.quality = g.quality) i\n" +
                    "where i.film = ?");
            ps.setString(1, filmname);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                session s = new session();
                s.setId(rs.getInt(1));
                s.setCinema(rs.getString(2));
                s.setFilm(rs.getString(3));
                s.setLanguage(rs.getString(4));
                s.setQuality(rs.getString(5));
                s.setSessiondate(rs.getString(6));
                s.setSessiontime(rs.getString(7));
                s.setTickets(rs.getString(8));
                s.setPrice(rs.getDouble(9)+rs.getDouble(10) + s.getDefPrice());
                sessions.add(s);
            }
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
        return sessions;
    }

    public static Films getFilmByName(String filmname) throws ClassNotFoundException {
        Films f = null;


        try {
            Connection con = getConnection();
            PreparedStatement ps = con.prepareStatement("select  * from tickets.films where film = ?");
            ps.setString(1, filmname);


            ResultSet rs = ps.executeQuery();
            f = new Films();
            while (rs.next()) {
                f.setName(rs.getString(2));
                f.setGenre(rs.getString(3));
                f.setDescription(rs.getString(4));
                f.setYear(rs.getInt(5));
                f.setCountry(rs.getString(6));
                f.setDuration(rs.getInt(7));
                f.setDirector(rs.getString(8));
                f.setBudget(rs.getString(9));
                f.setIncome(rs.getString(10));
                f.setImdb(rs.getDouble(11));
                f.setTrailer(rs.getString(12));
                f.setImgpath(rs.getString(13));

            }
        } catch (SQLException e) {
            e.printStackTrace();
        }


        return f;
    }

    public static boolean CheckFilm(String filmname) throws ClassNotFoundException {
        boolean b = true;

        try {
            Connection con = getConnection();
            PreparedStatement ps = con.prepareStatement("select * from\n" +
                    "(select e.film,e.cinemaname,e.genre,e.description,h.id,h.sessiondate,h.sessiontime, h.tickets from\n" +
                    "(select * from\n" +
                    "(select  a.cinemaname,b.cinema_id,b.films_id from tickets.cinema a\n" +
                    "inner join tickets.rel_cinema_films b\n" +
                    "where a.id = b.cinema_id) c\n" +
                    "inner join tickets.films d\n" +
                    "where c.films_id = d.id) e\n" +
                    "inner join tickets.sessions h\n" +
                    "where e.cinema_id = h.cinema_id and e.films_id=h.film_id) i\n" +
                    "where i.film = ?");
            ps.setString(1, filmname);
            ResultSet rs = ps.executeQuery();
            Films f = new Films();
            while (rs.next()) {

                f.setName(rs.getString(1));
                f.setCinema(rs.getString(2));
                f.setGenre(rs.getString(3));
                f.setDescription(rs.getString(4));


            }
            if (f.getName() == null) {
                b = false;
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }


        return b;

    }


    public static boolean CheckTickets(boolean[] b) {
        boolean t = false;
        for (int i = 0; i < b.length; i++) {
            if (b[i]) {
                t = true;
            }
        }
        return t;

    }

    public static session getSessionById(int id) throws ClassNotFoundException {
        session s = null;
        try {
            Connection con = getConnection();
            PreparedStatement ps = con.prepareStatement("select * from \n" +
                    "(select g.id,g.cinemaname,g.film,g.language,g.quality,g.sessiondate,g.sessiontime,g.tickets,g.language_price,h.quality_price from\n" +
                    "(select e.id,e.cinemaname,e.film,e.language,e.sessiondate,e.sessiontime,e.tickets,f.language_price,e.quality from\n" +
                    "(select c.id,c.cinemaname,d.film,c.sessiondate,c.sessiontime,c.tickets,c.language,c.quality from\n" +
                    "(select a.id,a.cinema_id,a.film_id,a.sessiondate,a.sessiontime,a.tickets,a.language,a.quality,b.cinemaname from tickets.sessions a\n" +
                    "inner join tickets.cinema b\n" +
                    "where a.cinema_id = b.id) c\n" +
                    "inner join tickets.films d\n" +
                    "where c.film_id = d.id) e\n" +
                    "inner join tickets.language f\n" +
                    "where e.language = f.language) g\n" +
                    "inner join tickets.quality h\n" +
                    "where h.quality = g.quality) i\n" +
                    "where i.id = ?");
            ps.setInt(1, id);
            s = new session();
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                s.setId(rs.getInt(1));
                s.setCinema(rs.getString(2));
                s.setFilm(rs.getString(3));
                s.setLanguage(rs.getString(4));
                s.setQuality(rs.getString(5));
                s.setSessiondate(rs.getString(6));
                s.setSessiontime(rs.getString(7));
                s.setTickets(rs.getString(8));
                s.setPrice(rs.getDouble(9)+rs.getDouble(10) + s.getDefPrice());

            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return  s;
    }


    public static boolean[] getTicketsbyId(int id) {
        session session = null;
        try {
            session = getSessionById(id);
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }

        String tickets = session.getTickets();

        boolean b[] = new boolean[16];
        for (int i = 0; i < tickets.length(); i++) {
            if (tickets.charAt(i) == '1') {
                b[i] = true;
            } else {
                b[i] = false;
            }
        }

        return b;
    }

    public static void UpdateTickets(int id, String tickets) {


        try {

            Connection con = getConnection();
            PreparedStatement ps = con.prepareStatement("update tickets.sessions set tickets = ? where id = ?");
            ps.setString(1, tickets);
            ps.setInt(2, id);
            ps.executeUpdate();
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }
    }

    public static int RegisterUser(User user) throws ClassNotFoundException {
        int result = -1;
        try {
            Connection con = getConnection();
            PreparedStatement ps = con.prepareStatement("insert into tickets.user (idnum,saxeli,gvari,email,username,password) values (?,?,?,?,?,?)");
            ps.setString(1, user.getIdnum());
            ps.setString(2, user.getSaxeli());
            ps.setString(3, user.getGvari());
            ps.setString(4, user.getEmail());
            ps.setString(5, user.getUsername());
            ps.setString(6, user.getPassword());
            result = ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return result;
    }

    public static User getUser(String username) throws ClassNotFoundException {
        User user = new User();
        try {
            Connection con = getConnection();
            PreparedStatement ps = con.prepareStatement("select * from tickets.user where username  =  '" + username + "'");

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {

                user.setIdnum(rs.getString(2));
                user.setSaxeli(rs.getString(3));
                user.setGvari(rs.getString(4));
                user.setEmail(rs.getString(5));
                user.setUsername(rs.getString(6));
                user.setPassword(rs.getString(7));

            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return user;
    }

    public static boolean CheckLogin(User user) throws ClassNotFoundException {
        boolean status = false;
        try {
            Connection con = getConnection();
            PreparedStatement ps = con.prepareStatement("select * from tickets.user where username = ? and password = ?");
            ps.setString(1, user.getUsername());
            ps.setString(2, user.getPassword());
            ResultSet rs = ps.executeQuery();
            status = rs.next();

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return status;

    }

    public static int EditUser(User user) throws ClassNotFoundException {
        int result = -1;
        try {
            Connection con = getConnection();
            PreparedStatement ps = con.prepareStatement("update tickets.user set saxeli = ?,gvari = ?,email = ?, password = ?, idnum = ? where username = ?");
            ps.setString(1, user.getSaxeli());
            ps.setString(2, user.getGvari());
            ps.setString(3, user.getEmail());
            ps.setString(4, user.getPassword());
            ps.setString(5,user.getIdnum());
            ps.setString(6, user.getUsername());
            result = ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return result;
    }

    public static ArrayList<Card> getCards(String username) throws ClassNotFoundException {
        ArrayList<Card> cards = new ArrayList<>();

        try {
            Connection con = getConnection();
            PreparedStatement ps = con.prepareStatement("select cardid,number, name, date, code  from tickets.cards where user_name = ?");
            ps.setString(1, username);
            ResultSet rs = ps.executeQuery();


            while (rs.next()) {
                Card card = new Card();
                card.setCard_id(rs.getInt(1));
                card.setNumber(rs.getString(2));
                card.setName(rs.getString(3));
                card.setDate(rs.getString(4));
                card.setCode(rs.getString(5));
                cards.add(card);

            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return cards;
    }

    public static int AddCard(Card card) throws ClassNotFoundException {
        int result = -1;
        try {
            Connection con = getConnection();
            PreparedStatement ps = con.prepareStatement("insert into tickets.cards (number,name,date,code,user_name) values(?,?,?,?,?)");
            ps.setString(1, card.getNumber());
            ps.setString(2, card.getName());
            ps.setString(3, card.getDate());
            ps.setString(4, card.getCode());
            ps.setString(5, card.getUsername());
            result = ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return result;

    }

    public static Card getCardById(int id) throws ClassNotFoundException {
        Card card = new Card();
        try {
            Connection con = getConnection();
            PreparedStatement ps = con.prepareStatement("select number, name, date,code from tickets.cards where cardid = ?");
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                card.setNumber(rs.getString(1));
                card.setName(rs.getString(2));
                card.setDate(rs.getString(3));
                card.setCode(rs.getString(4));
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return card;

    }


    public static int EditCard(Card card) throws ClassNotFoundException {
        int result = -1;
        try {
            Connection con = getConnection();
            PreparedStatement ps = con.prepareStatement("update tickets.cards set name = ?, number = ?, date = ?, code = ? where cardid = ?");
            ps.setString(1, card.getName());
            ps.setString(2, card.getNumber());
            ps.setString(3, card.getDate());
            ps.setString(4, card.getCode());
            ps.setInt(5, card.getCard_id());
            result = ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return result;
    }

    public static boolean CheckCard(Card card) throws ClassNotFoundException {
        ArrayList<Card> arr = getCards(card.getUsername());
        for (int i = 0; i < arr.size(); i++) {
            if (card.getNumber().equals(arr.get(i).getNumber())) {
                return false;
            }
        }
        return true;

    }

    public static void DeleteCard(int id) throws ClassNotFoundException {

        try {
            Connection con = getConnection();
            PreparedStatement ps = con.prepareStatement("delete from tickets.cards where cardid = ?");
            ps.setInt(1, id);
            ps.execute();
        } catch (SQLException e) {
            e.printStackTrace();
        }

    }
}

