using Microsoft.AspNetCore.Cryptography.KeyDerivation;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Proyecto_Des_App_Web
{
    public partial class guardarUsuario : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        public static string HashPassword(string password, string salt)
        {
            // Convert the salt string to a byte array
            byte[] saltBytes = Convert.FromBase64String(salt);

            // Hash the password using the PBKDF2 algorithm
            byte[] hashBytes = KeyDerivation.Pbkdf2(
                password: password,
                salt: saltBytes,
                prf: KeyDerivationPrf.HMACSHA512,
                iterationCount: 600000,
                numBytesRequested: 256 / 8
            );

            // Convert the hash byte array to a string
            string hashedPassword = Convert.ToBase64String(hashBytes);

            return hashedPassword;
        }

        public static bool VerifyPassword(string password, string salt, string hashedPassword)
        {
            // Hash the provided password with the same salt and compare the result with the stored hash
            return HashPassword(password, salt) == hashedPassword;
        }
    }
}