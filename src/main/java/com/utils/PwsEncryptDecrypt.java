package com.utils;

import java.security.spec.KeySpec;
import java.util.Base64;

import javax.crypto.Cipher;
import javax.crypto.SecretKey;
import javax.crypto.SecretKeyFactory;
import javax.crypto.spec.PBEKeySpec;
import javax.crypto.spec.SecretKeySpec;

public class PwsEncryptDecrypt {
	public static final String SALT_KEY = "uioyptrewqp";
	private static final String SECRET_KEY_ALGORITHM = "PBKDF2WithHmacSHA256";
    private static final int ITERATIONS = 65536;
    private static final int KEY_LENGTH = 256;
    private static final String ENCRYPTION_ALGORITHM = "AES";
	
	public String passwordEncrypt(String plainText) throws Exception {
		SecretKey saltCode = generateSaltCode(SALT_KEY);
        Cipher cipher = Cipher.getInstance(ENCRYPTION_ALGORITHM);
        cipher.init(Cipher.ENCRYPT_MODE, saltCode);
        byte[] encryptedTextBytes = cipher.doFinal(plainText.getBytes());
        return Base64.getEncoder().encodeToString(encryptedTextBytes);
	}
 
//	public String passwordDecrypt(String encryptedText) throws Exception {
//		SecretKey saltCode = generateSaltCode(SALT_KEY);
//		Cipher cipher = Cipher.getInstance(ENCRYPTION_ALGORITHM);
//        cipher.init(Cipher.DECRYPT_MODE, saltCode);
//        byte[] encryptedTextBytes = Base64.getDecoder().decode(encryptedText);
//        byte[] decryptedTextBytes = cipher.doFinal(encryptedTextBytes);
//        return new String(decryptedTextBytes);
//	}
	
	private static SecretKey generateSaltCode(String salt) throws Exception {
        KeySpec keySpec = new PBEKeySpec(salt.toCharArray(), salt.getBytes(), ITERATIONS, KEY_LENGTH);
        SecretKeyFactory keyFactory = SecretKeyFactory.getInstance(SECRET_KEY_ALGORITHM);
        byte[] keyBytes = keyFactory.generateSecret(keySpec).getEncoded();
        return new SecretKeySpec(keyBytes, ENCRYPTION_ALGORITHM);
    }
}
	

	    
