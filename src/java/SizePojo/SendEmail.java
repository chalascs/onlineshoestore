/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package SizePojo;

import java.util.Properties;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

/**
 *
 * @author Dinuk
 */
public class SendEmail {
    public static boolean sendmail(String from, String pass, String message, String to[], String sub) throws AddressException, MessagingException {
        String host = "smtp.gmail.com";
        Properties prop = System.getProperties();
        prop.put("mail.smtp.starttls.enable", "true");
        prop.put("mail.smtp.host", host);
        prop.put("mail.smtp.user", from);
        prop.put("mail.smtp.password", pass);
        prop.put("mail.smtp.port", 587);
        prop.put("mail.smtp.auth", "true");
        Session session = Session.getDefaultInstance(prop, null);
        MimeMessage mimeMessage = new MimeMessage(session);
        mimeMessage.setFrom(new InternetAddress(from));
        InternetAddress[] toadAddresses = new InternetAddress[to.length];
        for (int i = 0; i < to.length; i++) {
            toadAddresses[i] = new InternetAddress(to[i]);
        }
        for (int i = 0; i < toadAddresses.length; i++) {
            mimeMessage.addRecipient(MimeMessage.RecipientType.TO, toadAddresses[i]);
        }
        mimeMessage.setSubject(sub);
        mimeMessage.setText(message);
        Transport transport = session.getTransport("smtp");
        transport.connect(host, from, pass);
        transport.sendMessage(mimeMessage, mimeMessage.getAllRecipients());
        transport.close();
        return true;
    }
}
