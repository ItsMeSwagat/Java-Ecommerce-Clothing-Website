package com.Encryption;

import java.nio.charset.StandardCharsets;
import java.security.Key;
import javax.crypto.Cipher;
import javax.crypto.spec.SecretKeySpec;

public class MyEncryption {

	 public static String encrypt(String strToEncrypt, String secretKey) {
	        Key key = generateKey(secretKey);
	        Cipher cipher;
	        try {
	            cipher = Cipher.getInstance("AES/ECB/PKCS5Padding");
	            cipher.init(Cipher.ENCRYPT_MODE, key);
	            byte[] encryptedBytes = cipher.doFinal(strToEncrypt.getBytes(StandardCharsets.UTF_8));
	            return new String(encryptedBytes, StandardCharsets.ISO_8859_1);
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
	        return null;

	    }

	    public static String decrypt(String strToEncrypt, String secretKey) {
	        Key key = generateKey(secretKey);
	        Cipher cipher;
	        try {
	            cipher = Cipher.getInstance("AES/ECB/PKCS5Padding");
	            cipher.init(Cipher.DECRYPT_MODE, key);
	            byte[] encryptedBytes = cipher.doFinal(strToEncrypt.getBytes(StandardCharsets.ISO_8859_1));
	            return new String(encryptedBytes, StandardCharsets.UTF_8);
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
	        return null;

	    }

	    private static Key generateKey(String secretKey) {
	        byte[] keyBytes = secretKey.getBytes(StandardCharsets.UTF_8);
	        return new SecretKeySpec(keyBytes, "AES");
	    }
	
}
