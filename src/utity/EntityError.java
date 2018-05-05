package utity;

public class EntityError {
    private String empty;
    private String length;
    private String character;

    public EntityError(String empty, String length, String character) {
        this.empty = empty;
        this.length = length;
        this.character = character;
    }

    public EntityError() {
    }

    public String getCharacter() {
        return character;
    }

    public void setCharacter(String character) {
        this.character = character;
    }

    public String getEmpty() {
        return empty;
    }

    public void setEmpty(String empty) {
        this.empty = empty;
    }

    public String getLength() {
        return length;
    }

    public void setLength(String length) {
        this.length = length;
    }
}
