using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Web;

/// <summary>
/// Summary description for bc_SharedKeyEncryption
/// </summary>
public class bc_SharedKeyEncryption
{
    public string EncryptUsernamePassword(string clearText, string password)
    {
        if (string.IsNullOrEmpty(clearText))
        {
            return clearText;
        }

        byte[] salt = {
                (byte) 0xA9, (byte) 0x9B, (byte) 0xC8, (byte) 0x32,
                (byte) 0x56, (byte) 0x35, (byte) 0xE3, (byte) 0x03
                          };

        // NOTE: The keystring, salt, and iterations must be the same as what is used in the Demo java system.
        PKCSKeyGenerator crypto = new PKCSKeyGenerator(password, salt, 19, 1);

        ICryptoTransform cryptoTransform = crypto.Encryptor;
        var cipherBytes = cryptoTransform.TransformFinalBlock(Encoding.UTF8.GetBytes(clearText), 0, clearText.Length);
        return Convert.ToBase64String(cipherBytes);
    }

    public string DecryptUsernamePassword(string cipherText, string password)
    {
        if (string.IsNullOrEmpty(cipherText))
        {
            return cipherText;
        }

        byte[] salt = {
                            (byte) 0xA9, (byte) 0x9B, (byte) 0xC8, (byte) 0x32,
                            (byte) 0x56, (byte) 0x35, (byte) 0xE3, (byte) 0x03
                          };

        // NOTE: The keystring, salt, and iterations must be the same as what is used in the original BillCloud API.
        PKCSKeyGenerator crypto = new PKCSKeyGenerator(password, salt, 19, 1);

        ICryptoTransform cryptoTransform = crypto.Decryptor;
        var cipherBytes = Convert.FromBase64String(cipherText);
        var clearBytes = cryptoTransform.TransformFinalBlock(cipherBytes, 0, cipherBytes.Length);
        return Encoding.UTF8.GetString(clearBytes);
    }

    public class PKCSKeyGenerator
    {
        private byte[] key = new byte[8];
        private byte[] iv = new byte[8];
        private DESCryptoServiceProvider des = new DESCryptoServiceProvider();

        public PKCSKeyGenerator()
        { }

        public PKCSKeyGenerator(string keystring, byte[] salt, int iterationsMd5, int segments)
        {
            this.Generate(keystring, salt, iterationsMd5, segments);
        }

        public byte[] Key
        {
            get { return this.key; }
        }

        public byte[] IV
        {
            get { return this.iv; }
        }

        public ICryptoTransform Encryptor
        {
            get { return this.des.CreateEncryptor(this.key, this.iv); }
        }

        public ICryptoTransform Decryptor
        {
            get { return des.CreateDecryptor(key, iv); }
        }

        public ICryptoTransform Generate(string keystring, byte[] salt, int iterationsMd5, int segments)
        {
            int hashLength = 16;

            byte[] keyMaterial = new byte[hashLength * segments];
            byte[] passwordBytes;

            passwordBytes = Encoding.UTF8.GetBytes(keystring);
            byte[] data00 = new byte[passwordBytes.Length + salt.Length];

            Array.Copy(passwordBytes, data00, passwordBytes.Length);
            Array.Copy(salt, 0, data00, passwordBytes.Length, salt.Length);

            MD5 md5 = new MD5CryptoServiceProvider();
            byte[] result = null;

            byte[] hashtarget = new byte[hashLength + data00.Length];

            for (int j = 0; j < segments; j++)
            {
                if (j == 0)
                {
                    result = data00;
                }
                else
                {
                    Array.Copy(result, hashtarget, result.Length);
                    Array.Copy(data00, 0, hashtarget, result.Length, data00.Length);
                    result = hashtarget;
                }

                for (int i = 0; i < iterationsMd5; i++)
                {
                    result = md5.ComputeHash(result);
                }

                Array.Copy(result, 0, keyMaterial, j * hashLength, result.Length);
            }

            Array.Copy(keyMaterial, 0, this.key, 0, 8);
            Array.Copy(keyMaterial, 8, this.iv, 0, 8);

            return this.Encryptor;
        }
    }
}