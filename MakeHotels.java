import java.io.FileWriter;
import java.io.IOException;
import java.util.concurrent.ThreadLocalRandom;

class MakeHotels{
    static String[] chains = {"Hilton", "Marriot", "Best Western", "Days Inn", "Brook Street"};
    static String[] cities = {"Barrie","Ottawa","Toronto","Stouffville","Gatineau","Washington","Chicago","Vancouver","Montreal","New York","Los Angeles","Phoenix","Calgary","Halifax","Hamilton","Winnipeg"};
    
    public static void printHotels() throws IOException{
        FileWriter myWriter = new FileWriter("Hotels.txt");

        for (int i=0;i<5;i++){
            for (int j=0;j<8;j++){
                int randInt = ThreadLocalRandom.current().nextInt(0, cities.length);
                int randRate = ThreadLocalRandom.current().nextInt(1, 6);
                System.out.print("('"+chains[i]+"','"+cities[randInt]+"',"+randRate+"),\n");
                myWriter.write("\t('"+chains[i]+"','"+cities[randInt]+"',"+randRate+"),\n");
            }
        }
        myWriter.close();
    }

    public static void printRooms() throws IOException{
        FileWriter myWriter = new FileWriter("Rooms.txt");

        for (int i=1;i<41;i++){
            for (int j=1; j<6;j++){
                int randCap = ThreadLocalRandom.current().nextInt(1, 7);
                System.out.print("("+i+","+j+","+randCap+"),\n");
                myWriter.write("("+i+","+j+","+randCap+"),\n");
            }
        }
        myWriter.close();
    }

    public static void main(String[] args) throws IOException {
        printRooms();
    }
}