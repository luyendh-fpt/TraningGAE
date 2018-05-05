package utity;

import java.util.Map;

public class Validate {

    public String validateUsername(String txt){
        String error;
        String regex = "[A-Za-z0-9]+";
        if(txt == null || txt.isEmpty()){
            error = MapError.mapError.get("username").getEmpty();
            return error;
        }else if(txt.matches(regex)){
            if(txt.length() < 6){
                error = MapError.mapError.get("username").getLength();
                return error;
            }
            return "";
        }else {
            error = MapError.mapError.get("username").getCharacter();
            return error;
        }
    }

    public String validatePassword(String txt){
        String error;
        String regex = "[A-Za-z0-9\\p{S}\\p{P}]+";
        if(txt == null || txt.isEmpty()){
            error = MapError.mapError.get("password").getEmpty();
            return error;
        }else if(txt.matches(regex)){
            if(txt.length() < 6){
                error = MapError.mapError.get("password").getLength();
                return error;
            }
            return "";
        }else {
            error = MapError.mapError.get("password").getCharacter();
            return error;
        }
    }

    public String validateFullName(String txt){
        String error;
        String regex = "[\\p{L}\\s]+";
        String regex2 = "[\\s]+";
        if(txt == null || txt.isEmpty() || txt.matches(regex2)){
            error = MapError.mapError.get("fullname").getEmpty();
            return error;
        }else if(txt.matches(regex)){
            if(txt.length() < 6){
                error = MapError.mapError.get("fullname").getLength();
                return error;
            }
            return "";
        }else {
            error = MapError.mapError.get("fullname").getCharacter();
            return error;
        }
    }

    public String validateAddress(String txt){
        String error;
        String regex = "[\\p{L}\\s\\/]+";
        String regex2 = "[\\s]+";
        if(txt == null || txt.isEmpty() || txt.matches(regex2)){
            error = MapError.mapError.get("address").getEmpty();
            return error;
        }else if(txt.matches(regex)){
            if(txt.length() < 6){
                error = MapError.mapError.get("address").getLength();
                return error;
            }
            return "";
        }else {
            error = MapError.mapError.get("address").getCharacter();
            return error;
        }
    }
}
