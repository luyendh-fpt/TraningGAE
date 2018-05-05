package utity;

import java.util.HashMap;

public class MapError {
    public static HashMap<String, EntityError> mapError = new HashMap<>();
    static {

        EntityError username = new EntityError("Please enter Username","Username must have at least 6","Username only include : A-Z, a-z, 0-9","Username existed. Please enter Usernam other.");
        EntityError password = new EntityError("Please enter Password","Password must have at least 6", "Password not include : space");
        EntityError fullname = new EntityError("Please enter Full Name","Full Name must have at least 6","Fullname only include : A-Z, a-z, space");
        EntityError address = new EntityError("Please enter Address","Address must have at least 6","Address only include: 0-9, A-Z, a-z, /");
        mapError.put("username", username);
        mapError.put("password", password);
        mapError.put("fullname", fullname);
        mapError.put("address", address);
    }
}
