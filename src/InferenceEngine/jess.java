package InferenceEngine;

import java.io.StringWriter;
import javax.swing.JOptionPane;
import jess.JessException;
import jess.Rete;

/**
 * @author banta
 */
public class jess {

    public static Rete engine;

    public static void queryInferenceEngine(String s) throws JessException {
        // Create a Jess rule engine
        engine = new Rete();
        engine.reset();
        StringWriter o = new StringWriter();
        engine.addOutputRouter("t", o);
        String result = "";

        // Load the pricing rules
        engine.batch("Files/c.clp");
        engine.eval(s);
        engine.run();

        result = o.toString();
        engine.clear();
        if (result == null ? "" == null : result.equals("")) {
            result = "No cancer was diagnosed"
                    + " Please try again";
        }
        JOptionPane.showMessageDialog(null, result);
    }
}