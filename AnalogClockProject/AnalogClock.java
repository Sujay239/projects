import javax.swing.*;
import java.awt.*;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Locale;

public class AnalogClock extends JPanel {
    private final int width = 400;
    private final int height = 400;
    private int hours = 0, minutes = 0, seconds = 0;
    private String timeString = "";

    public AnalogClock(){
        setPreferredSize(new Dimension(width,height));
        setBackground(Color.CYAN);
        Timer timer = new Timer(1000, e -> {
            updateTime();
            repaint();
        });
        timer.start();
    }

    private void updateTime() {
        Calendar cal = Calendar.getInstance();
        hours = cal.get(Calendar.HOUR_OF_DAY);

        if(hours > 12) hours -= 12;

        minutes = cal.get(Calendar.MINUTE);
        seconds = cal.get(Calendar.SECOND);

        SimpleDateFormat formatter = new SimpleDateFormat("hh:mm:ss", Locale.getDefault());
        timeString = formatter.format(cal.getTime());
    }

    private void drawHand(double angle, int radius, Graphics g){
        angle -= 0.5 * Math.PI;
        int x = (int) (radius * Math.cos(angle));
        int y = (int) (radius * Math.sin(angle));
        g.drawLine(width/2,height/2, width/2 + x, height/2 + y);
    }

    private void drawWedge(double angle, int radius, Graphics g){
        angle -= 0.5 * Math.PI;
        int x = (int) (radius * Math.cos(angle));
        int y = (int) (radius * Math.sin(angle));

        angle += 2 * Math.PI / 3;
        int x2 = (int) (5 * Math.cos(angle));
        int y2= (int) (5 * Math.sin(angle));

        angle += 2 * Math.PI / 3;
        int x3 = (int) (5 * Math.cos(angle));
        int y3 = (int) (5 * Math.sin(angle));

        g.drawLine(width / 2 + x2, height / 2 + y2, width / 2 + x, height / 2 + y);
        g.drawLine(width / 2 + x3, height / 2 + y3, width / 2 + x, height / 2 + y);
        g.drawLine(width / 2 + x2, height / 2 + y2, width / 2 + x3, height / 2 + y3);
    }


    @Override
    protected void paintComponent(Graphics g){
        super.paintComponent(g);

        g.setColor(Color.BLACK);
        g.drawOval(50,50,300,300);

        g.setColor(Color.RED);
        drawWedge(2 * Math.PI * hours / 12, width / 5, g);
        drawWedge(2 * Math.PI * minutes / 60, width / 3, g);
        drawHand(2 * Math.PI * seconds / 60, width / 2 - 20, g);
        g.setColor(Color.BLACK);
        g.drawString(timeString, 10, height - 10);
    }


    public static void main(String[] args) {
        JFrame frame = new JFrame("Analog Clock");
        frame.setDefaultCloseOperation(WindowConstants.EXIT_ON_CLOSE);
        frame.getContentPane().add(new AnalogClock());
        frame.pack();
        frame.setLocationRelativeTo(null);
        frame.setVisible(true);
    }
}
