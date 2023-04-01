import java.io.FileWriter;
import java.io.IOException;
import java.util.concurrent.ThreadLocalRandom;

class MakeHotels{
    static int hotelsPerChain = 8;
    static int roomsPerHotel = 5;
    static String[] chains = {"Hilton", "Marriot", "Best Western", "Days Inn", "Brook Street"};
    static String[] cities = {"Barrie","Ottawa","Toronto","Stouffville","Gatineau","Washington","Chicago","Vancouver","Montreal","New York","Los Angeles","Phoenix","Calgary","Halifax","Hamilton","Winnipeg"};
    
    public static void makeHotels() throws IOException{
        FileWriter myWriter = new FileWriter("Hotels.txt");

        for (int i=0;i<chains.length;i++){
            for (int j=0;j<hotelsPerChain;j++){
                int randInt = ThreadLocalRandom.current().nextInt(0, cities.length);
                int randRate = ThreadLocalRandom.current().nextInt(1, 6);
                System.out.print("('"+chains[i]+"','"+cities[randInt]+"',"+randRate+"),\n");
                myWriter.write("\t('"+chains[i]+"','"+cities[randInt]+"',"+randRate+"),\n");
            }
        }
        myWriter.close();
    }

    //Makes hotel rooms for all of the hotels, of increasing capacity starting at 1
    public static void makeRooms() throws IOException{
        FileWriter myWriter = new FileWriter("Rooms.txt");
        for (int i=1;i<hotelsPerChain*chains.length+1;i++){
            for (int j=1; j<roomsPerHotel+1;j++){
                //Has information for HotelID, RoomNum, Capacity, and Price
                //Rooms are priced between $50 and $500
                int randPrice = ThreadLocalRandom.current().nextInt(50,501);
                System.out.print("("+i+","+j+","+j+","+randPrice+"),\n");
                myWriter.write("\t("+i+","+j+","+j+","+randPrice+"),\n");
            }
        }
        myWriter.close();
    }

    public static void main(String[] args) throws IOException {
        makeRooms();
    }
}