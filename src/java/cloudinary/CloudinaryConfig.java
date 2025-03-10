/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package cloudinary;

import com.cloudinary.Cloudinary;
import java.util.HashMap;
import java.util.Map;

/**
 *
 * @author Admin
 */
public class CloudinaryConfig {
    private static Cloudinary cloudinary;

    static {
        Map<String, String> config = new HashMap<>();
        config.put("cloud_name", "deco0gmtm");
        config.put("api_key", "985761876185843");
        config.put("api_secret", "9EDx7cpIJhMN8aONRdPfxvFAYlE");
        cloudinary = new Cloudinary(config);
    }

    public static Cloudinary getInstance() {
        return cloudinary;
    }
}
