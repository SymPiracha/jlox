import org.junit.jupiter.api.Test;
import java.io.ByteArrayOutputStream;
import java.io.PrintStream;
import static org.junit.jupiter.api.Assertions.assertEquals;

public class AppTest {

    @Test
    void testMainMethod() {
        // Create an output stream to capture the output of System.out
        ByteArrayOutputStream outputStream = new ByteArrayOutputStream();
        PrintStream originalOut = System.out;
        
        // Redirect System.out to our output stream
        System.setOut(new PrintStream(outputStream));

        try {
            // Call the main method of the App class
            App.main(new String[] {});

            // Get the output and compare it
            String output = outputStream.toString().trim();
            assertEquals("Hello, World!", output, "The output should be 'Hello, World!'");
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            // Restore the original System.out
            System.setOut(originalOut);
        }
    }
}
