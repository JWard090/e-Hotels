import java.sql.*;
import java.time.LocalDate;

public class Views {
    //Before running, make sure the next three fields are updated with the proper information
    static String sqlurl = "jdbc:postgresql://localhost:5432/postgres";
    static String sqluser = "postgres";
    static String sqlpassword = "HzqN8Bkf";

    public static void main(String[] args) {
        LocalDate bookingDay = LocalDate.of(2023,03,31); //Change this to change what day to view available capacity
        //view1(bookingDay);
        view2(2);
    }

    public static void view1(LocalDate dateh){
        //the number of available rooms per area
        try{
            Connection db = DriverManager.getConnection(sqlurl, sqluser, sqlpassword);
            Statement st = db.createStatement();
            ResultSet rs = st.executeQuery("select hArea, sum(capacity) as area_capacity\n" +
                    "\tfrom ehotel.hotel h\n" +
                    "\tjoin ehotel.room r\n" +
                    "\ton h.hotelID = r.hotelID\n" +
                    "\twhere not exists (select 1 from ehotel.booking b\n" +
                    "\t\t\t\t\t where r.hotelid = b.hotelid and r.roomnum = b.roomnum\n" +
                    "\t\t\t\t\t and '" + dateh + "'\n" +
                    "\t\t\t\t\t  between b.indate and b.outdate)\n" +
                    "\tgroup by harea;");

            System.out.println("Area\t\tAvailable Capacity");
            while (rs.next()){
                System.out.println(rs.getString(1)+"\t\t"+rs.getString(2));
            }
        } catch (SQLException except) {
            System.out.println("An exception was thrown: "+except.getMessage());
        }
    }

    public static void view2(int hotelID){
        //the capacity of all the rooms of a specific hotel
        try {
            Connection db = DriverManager.getConnection(sqlurl, sqluser, sqlpassword);
            Statement st = db.createStatement();
            ResultSet rs = st.executeQuery("select hname, hotelid, roomnum, capacity\n" +
                    "\tfrom ehotel.hotelchain\n" +
                    "\tnatural join ehotel.hotel\n" +
                    "\tnatural join ehotel.room\n" +
                    "where hotelid = "+hotelID+";");

            System.out.println("hname\thotelid\troomNum\tcapacity");
            while (rs.next()){
                System.out.println(rs.getString(1)+"\t"+rs.getString(2)+"\t\t"+rs.getString(3)+"\t\t"+rs.getString(4));
            }

        }catch (SQLException except) {
            System.out.println("An exception was thrown: "+except.getMessage());
        }
    }
}