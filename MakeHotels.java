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

    public static void printRooms(){
        for (int i=0;i<40;i++){
            for (int j=0; j<5;j++){
                int randCap = ThreadLocalRandom.current().nextInt(1, 7);
                System.out.println("("+(i+1)+","+randCap+"),");
            }
        }
    }

    public static void main(String[] args) throws IOException {
        printRooms();
    }
}