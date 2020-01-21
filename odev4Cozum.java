package odev4;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Scanner;

public class Odev4 {
    private static Connection conn = null;
    public static Scanner input = null;
    public static PreparedStatement st = null;
    public static PreparedStatement st1 = null;
    public static void main(String[] args) {
        try {
          Class.forName("org.postgresql.Driver");
            conn = DriverManager
                    .getConnection("jdbc:postgresql://localhost:5432/odev4",
                            "postgres", "sailormoon98");
        } catch (Exception e) {
            e.printStackTrace();
            System.err.println(e.getClass().getName() + ": " + e.getMessage());
            System.exit(0);
        }
        odev4();
    }
    public static void closeConnection() {
        try {
            if (conn != null) {
                conn.close();
                System.out.println("Connection is closed succesfuly.");
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
    }
    public static void odev4() {
        input = new Scanner(System.in);
       boolean loop = true;
        while (loop) {
            System.out.println("Menü");
            System.out.println("---------------------");
            System.out.println("1- kardeş sorgula");
            System.out.println("2- kuzen sorgula");
            System.out.println("3- soy ağacı sorgula");
            System.out.println("4- soyundan gelenleri sorgula");
            System.out.println("0- Çıkış");
            System.out.print("Seçenek? ");

            int answer = input.nextInt();
            System.out.print("ID? ");
            int id = input.nextInt();

            switch (answer) {
                case 1:
                    kardesSorgula(id);
                    break;
                case 2:
                    kuzenSorgula(id);
                    break;
                case 3:
                    soyAgaciSorgula(id);
                    break;
                case 4:
                    SoyundanGelenSorgula(id);
                    break;
                case 5:
                    System.exit(-1);
                    break;
            }
        }
        input.close();
    }
    public static void kardesSorgula(int id) {
        int id1 = id;
        try {
            st = conn.prepareStatement("SELECT b.name FROM Person a,Person b "
                    + "WHERE a.fatherID=b.fatherID AND a.motherID=b.motherID AND a.ID=?");
            st.setInt(1, id1);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                String name = rs.getString("name");
                System.out.println("NAME = " + name);

            }
            rs.close();
            st.close();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    private static void kuzenSorgula(int id) {
        int id1 = id;
         int id2 = id;
        try {
            st = conn.prepareStatement("SELECT a.name,b.name FROM Person a,Person b,Person c,(SELECT a.ID FROM Person a,Person b WHERE a.fatherID=b.fatherID AND a.motherID=b.motherID AND a.ID=?)t "
                    + "WHERE a.ID=? AND a.ID=b.motherID AND t.ID=c.motherID");
            st.setInt(1, id1);
            
            st1 = conn.prepareStatement("SELECT a.name,b.name FROM Person a,Person b,Person c,(SELECT a.ID FROM Person a,Person b WHERE a.fatherID=b.fatherID AND a.motherID=b.motherID AND a.ID=?)t "
                    + "WHERE a.ID=? AND a.ID=b.fatherID AND t.ID=c.fatherID");
            st1.setInt(1, id2);
            ResultSet rs = st.executeQuery();

            while (rs.next()) {
                String name = rs.getString("name");
                System.out.println("NAME = " + name);

            }
            rs.close();
            st.close();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    private static void soyAgaciSorgula(int id) {
        int id1 = id;
        PreparedStatement st0 = null;
        PreparedStatement st2 = null;
        PreparedStatement st3 = null;

        try {
            st0 = conn.prepareStatement("SELECT b.name FROM Person a,Person b WHERE a.fatherid=b.id AND a.ID=?");
            st3 = conn.prepareStatement("SELECT b.name FROM Person a,Person b WHERE a.motherid=b.id AND a.ID=?");
            st = conn.prepareStatement("SELECT b.name FROM Person a,Person b "
                    + "WHERE a.fatherID=b.fatherID AND a.motherID=b.motherID AND a.ID=?");
            st1 = conn.prepareStatement("SELECT b.name FROM Person a,Person b "
                    + "WHERE a.ID=b.motherID AND a.ID=?");
            st2 = conn.prepareStatement("SELECT b.name FROM Person a,Person b "
                    + "WHERE a.ID=b.fatherID AND a.ID=?");

            st0.setInt(1, id1);
            st3.setInt(1, id1);
            st.setInt(1, id1);
            st1.setInt(1, id1);
            st2.setInt(1, id1);

            ResultSet rs0 = st0.executeQuery();
            ResultSet rs3 = st3.executeQuery();
            ResultSet rs = st.executeQuery();
            ResultSet rs1 = st1.executeQuery();
            ResultSet rs2 = st2.executeQuery();
           

            System.out.println("Anne-Baba : ");
            while (rs0.next()) {
                String name = rs0.getString("name");
                System.out.println("NAME = " + name);

            }
            while (rs3.next()) {
                String name = rs3.getString("name");
                System.out.println("NAME = " + name);

            }
            System.out.println("Kardeşleri : ");
            while (rs.next()) {
                String name = rs.getString("name");
                System.out.println("NAME = " + name);

            }
            System.out.print("\n");
            System.out.println("Çocukları : ");

            while (rs1.next()) {
                String name = rs1.getString("name");
                System.out.println("NAME = " + name);

            }
            while (rs2.next()) {
                String name = rs2.getString("name");
                System.out.println("NAME = " + name);

            }
            rs.close();
            rs1.close();
            rs2.close();
            rs3.close();
            rs0.close();
            st0.close();
            st.close();
            st1.close();
            st2.close();
            st3.close();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    private static void SoyundanGelenSorgula(int id) {
        int id1 = id;
        PreparedStatement st1 = null;

        try {
            st = conn.prepareStatement("SELECT b.name FROM Person a,Person b "
                    + "WHERE a.ID=b.motherID AND a.ID=?");
            st1 = conn.prepareStatement("SELECT b.name FROM Person a,Person b "
                    + "WHERE a.ID=b.fatherID AND a.ID=?");
            st.setInt(1, id1);
            st1.setInt(1, id1);

            ResultSet rs = st.executeQuery();
            ResultSet rs1 = st1.executeQuery();

            while (rs.next()) {
                String name = rs.getString("name");
                System.out.println("NAME = " + name);

            }
            while (rs1.next()) {
                String name = rs1.getString("name");
                System.out.println("NAME = " + name);
            }
            rs.close();
            rs1.close();
            st.close();
            st1.close();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }
}
MongoDB
package odev4mongodb;
import com.mongodb.client.*;
import com.mongodb.client.model.Filters;
import com.mongodb.client.model.Updates;
import com.mongodb.client.result.DeleteResult;
import com.mongodb.client.result.UpdateResult;
import org.bson.Document;
import java.util.Scanner;

public class Odev4MongoDB {

    private static final String USERNAME = "admin";
    private static final String PASSWORD = "admin123";
    private static final String CLUSTER_NAME = "iu-ce-azmzc";
    private static final String DATABASE_NAME = "odev4";
    private static final String COLLECTION_NAME = "Person";

    private static final Scanner scan = new Scanner(System.in);

    private static MongoCollection<Document> collection;

    public static void main(String[] args) {
        connectDB();

        if (checkDBConnection()) {
            userInterface();
        } else {
            System.out.println("Cannot connect DB!");
        }
    }
    private static void connectDB() {
        String mongoURI = "mongodb+srv://" + USERNAME + ":" + PASSWORD + "@" + CLUSTER_NAME + ".mongodb.net/" + DATABASE_NAME + "?retryWrites=true";

        MongoClient mongoClient = MongoClients.create(mongoURI);

        MongoDatabase database = mongoClient.getDatabase(DATABASE_NAME);
        collection = database.getCollection(COLLECTION_NAME);
    }
    private static boolean checkDBConnection() {
        return collection != null;
    }

    private static void odev4() {

        int answer;
        while (true) {
            System.out.println("Menü");
            System.out.println("---------------------");
            System.out.println("1- kardeş sorgula");
            System.out.println("2- kuzen sorgula");
            System.out.println("3- soy ağacı sorgula");
            System.out.println("4- soyundan gelenleri sorgula");
            System.out.println("0- Çıkış");
            System.out.print("Seçenek? ");

            answer = getNumberUI(null);
            System.out.print("ID? ");
            int id = getNumberUI(null);

            switch (answer) {
                case 1:
                    kardesSorgula(id);
                    break;
                case 2:
                    kuzenSorgula(id);
                    break;
                case 3:
                    soyAgaciSorgula(id);
                    break;
                case 4:
                    SoyundanGelenSorgula(id);
                    break;
                case 0:
                    System.exit(0);
                    break;
            }
        }

    }

    public static void kardesSorgula(int id) {
        db.people.find( {
            user_id:
            {
              $exists:
                true }
        })
        db.Person a,Person b .find(
        {
            "$and"
            : [{
		"$where"
            : "this.a.fatherID == this.b.fatherID "
	},
            {
                "$and"
                : [{
		"$where"
                : "this. a.motherID == this.b.motherID "
	},
                {" a.ID" : ?
	}]
            }]
        },
        {
            "b.name": 1
}
);

    }

    private static void kuzenSorgula(int id) {
        int id1 = id;
        int id2 = id;
        db.Persona,Person b, Person c,(SELECT a.ID FROM Person a, Person b.find(
        {
            "$and"
            : [{
		"$where"
            : "this.a.fatherID == this.b.fatherID "
	},
            {
                "$and"
                : [{
		"$where"
                : "this. a.motherID == this.b.motherID "
	},
                {
                    "$and"
                    : [{
		"$where"
                    : "this. a.ID == this.?)t WHERE a.ID=? "
	},
                    {
                        "$and"
                        : [{
		"$where"
                        : "this. a.ID == this.b.motherID "
	},
                        {"$where"
                        : "this. t.ID == this.c.motherID"
	}]
                    }]
                }]
            }]
        },
        {
            "a.name": 1,
	"b.name": 1
}
);
        db.Person a,Person b, Person c,(SELECT a.ID FROM Person a, Person b.find(
        {
            "$and"
            : [{
		"$where"
            : "this.a.fatherID == this.b.fatherID "
	},
            {
                "$and"
                : [{
		"$where"
                : "this. a.motherID == this.b.motherID "
	},
                {
                    "$and"
                    : [{
		"$where"
                    : "this. a.ID == this.?)t WHERE a.ID=? "
	},
                    {
                        "$and"
                        : [{
		"$where"
                        : "this. a.ID == this.b.fatherID "
	},
                        {"$where"
                        : "this. t.ID == this.c.fatherID"
	}]
                    }]
                }]
            }]
        },
        {
            "a.name"
        : 1,
	"b.name": 1
}
);
    }

    private static void soyAgaciSorgula(int id) {
        int id1 = id;

        System.out.println("Anne-Baba : ");
        db.Person a,Person b .find(
        {
            "$and"
            : [{
		"$where"
            : "this.a.fatherid == this.b.id "
	},
            {" a.ID" : ?
	}]
        },
        {
            "b.name"
        : 1
}
);
        db.Person a,Person b .find(
        {
            "$and"
            : [{
		"$where"
            : "this.a.motherid == this.b.id "
	},
            {" a.ID" : ?
	}]
        },
        {
            "b.name"
        : 1
}
);
        System.out.println("Kardeşleri : ");
        db.Person a,Person b .find(
        {
            "$and"
            : [{
		"$where"
            : "this.a.fatherID == this.b.fatherID "
	},
            {
                "$and"
                : [{
		"$where"
                : "this. a.motherID == this.b.motherID "
	},
                {" a.ID" : ?
	}]
            }]
        },
        {
            "b.name"
        : 1
}
);
        System.out.println("Çocukları : ");
        db.Person a,Person b .find(
        {
            "$and"
            : [{
		"$where"
            : "this.a.ID == this.b.motherID "
	},
            {" a.ID" : ?
	}]
        },
        {
            "b.name"
        : 1
}
);
        db.Person a,Person b .find(
        {
            "$and"
            : [{
		"$where"
            : "this.a.ID == this.b.fatherID "
	},
            {" a.ID" : ?
	}]
        },
        {
            "b.name"
        : 1
}
);

    }

    private static void SoyundanGelenSorgula(int id) {
        int id1 = id;
        db.Person a,Person b .find(
        {
            "$and"
            : [{
		"$where"
            : "this.a.ID == this.b.motherID "
	},
            {" a.ID" : ?
	}]
        },
        {
            "b.name"
        : 1
}
);
        db.Person a,Person b .find(
        {
            "$and"
            : [{
		"$where"
            : "this.a.ID == this.b.fatherID "
	},
            {" a.ID" : ?
	}]
        },
        {
            "b.name"
        : 1
}
);

    }

    private static int getNumberUI(String text) {

        if (text != null) {
            System.out.println(text);
        }

        System.out.print("-> ");

        try {
            return Integer.parseInt(scan.nextLine());
        } catch (NumberFormatException e) {
            System.out.println("Input type error! (Must be number)");
            return getNumberUI(text);
        }
    }
}
