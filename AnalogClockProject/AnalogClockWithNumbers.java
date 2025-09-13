import javax.swing.*;
import java.awt.*;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Locale;

public class AnalogClockWithNumbers extends JPanel {
    private final int width = 400;
    private final int height = 400;
    private int hours = 0, minutes = 0, seconds = 0;
    private String timeString = "";

    public AnalogClockWithNumbers() {
        setPreferredSize(new Dimension(width, height));
        setBackground(Color.GREEN);

        updateTime();

        Timer timer = new Timer(1000, e -> {
            updateTime();
            repaint();
        });
        timer.start();
    }

    private void updateTime() {
        Calendar cal = Calendar.getInstance();
        hours = cal.get(Calendar.HOUR);
        minutes = cal.get(Calendar.MINUTE);
        seconds = cal.get(Calendar.SECOND);

        SimpleDateFormat formatter = new SimpleDateFormat("hh:mm:ss", Locale.getDefault());
        timeString = formatter.format(cal.getTime());
    }

    private void drawHand(Graphics g, double angle, int length, int thickness) {
        angle -= Math.PI / 2;
        int x = (int) (length * Math.cos(angle));
        int y = (int) (length * Math.sin(angle));
        Graphics2D g2 = (Graphics2D) g.create();
        g2.setStroke(new BasicStroke(thickness));
        g2.drawLine(width / 2, height / 2, width / 2 + x, height / 2 + y);
        g2.dispose();
    }

    private void drawClockNumbers(Graphics g) {
        g.setColor(Color.BLACK);
        g.setFont(new Font("Arial", Font.BOLD, 16));

        int radius = 130;
        for (int i = 1; i <= 12; i++) {
            double angle = Math.toRadians(i * 30 - 90);
            int x = (int) ((double) width / 2 + radius * Math.cos(angle));
            int y = (int) ((double) height / 2 + radius * Math.sin(angle));
            String num = String.valueOf(i);
            int strWidth = g.getFontMetrics().stringWidth(num);
            int strHeight = g.getFontMetrics().getAscent();
            g.drawString(num, x - strWidth / 2, y + strHeight / 3);
        }
    }

    private void drawTickMarks(Graphics g) {
        Graphics2D g2 = (Graphics2D) g;
        int outerRadius = 150;
        int innerRadiusLong = 140; // for hour ticks
        int innerRadiusShort = 145; // for minute ticks

        for (int i = 0; i < 60; i++) {
            double angle = Math.toRadians(i * 6 - 90); // 360/60 = 6 degrees per tick

            int x1 = (int) ((double) width / 2 + outerRadius * Math.cos(angle));
            int y1 = (int) ((double) height / 2 + outerRadius * Math.sin(angle));

            int innerRadius = (i % 5 == 0) ? innerRadiusLong : innerRadiusShort;

            int x2 = (int) ((double) width / 2 + innerRadius * Math.cos(angle));
            int y2 = (int) ((double) height / 2 + innerRadius * Math.sin(angle));

            g2.setStroke(new BasicStroke((i % 5 == 0) ? 2 : 1));
            g2.setColor(Color.BLACK);
            g2.drawLine(x1, y1, x2, y2);
        }
    }

    @Override
    protected void paintComponent(Graphics g) {
        super.paintComponent(g);

        // Draw clock outline
        g.setColor(Color.BLACK);
        g.drawOval(50, 50, 300, 300);

        // Draw numbers and 60 tick marks (4 between each number)
        drawClockNumbers(g);
        drawTickMarks(g);

        // Draw hands
        double hourAngle = (hours + minutes / 60.0) * Math.PI / 6;
        double minuteAngle = (minutes + seconds / 60.0) * Math.PI / 30;
        double secondAngle = seconds * Math.PI / 30;

        g.setColor(Color.BLACK);
        drawHand(g, hourAngle, 80, 6);
        drawHand(g, minuteAngle, 120, 4);
        g.setColor(Color.RED);
        drawHand(g, secondAngle, 140, 2);

        // Draw center
        g.setColor(Color.BLACK);
        g.fillOval(width / 2 - 5, height / 2 - 5, 10, 10);

        // Digital time
        g.setColor(Color.BLACK);
        g.drawString(timeString, 10, height - 10);
    }

    public static void main(String[] args) {
        SwingUtilities.invokeLater(() -> {
            JFrame frame = new JFrame("Analog Clock");
            frame.setDefaultCloseOperation(WindowConstants.EXIT_ON_CLOSE);
            frame.getContentPane().add(new AnalogClockWithNumbers());
            frame.pack();
            frame.setLocationRelativeTo(null);
            frame.setVisible(true);
        });
    }
}
