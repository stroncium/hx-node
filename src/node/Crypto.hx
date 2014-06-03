package node;

private typedef CredentialsDetails = {
  pfx:Dynamic, // String/Buffer holding the PFX or PKCS12 encoded private key, certificate and CA certificates
  key:String, // A string holding the PEM encoded private key
  passphrase:String, // A string of passphrase for the private key or pfx
  cert:String, // A string holding the PEM encoded certificate
  ca:Array<String>, // list of strings of PEM encoded CA certificates to trust.
  crl:Array<String>, // list of strings of PEM encoded CRLs (Certificate Revocation List)
  ciphers:String, // SSL cipher list
}

extern class Credentials{}

extern class Crypto implements Node.Module<'crypto', ''>{
  public static function createCredentials(details:CredentialsDetails):Credentials;
  public static function createHash(algorithm:String):Hash;
  public static function createHmac(algorithm:String, key:String):Hmac;

  @:overload(function (algorithm:String, password:Buffer):Cipher{})
  public static function createCipher(algorithm:String, password:String):Cipher;

  public static function createCipheriv(algorithm:String, key:String, iv:String):Cipher;
  public static function createDecipher(algorithm:String, password:String):Decipher;
  public static function createDecipheriv(algorithm:String, key:String, iv:String):Decipher;
  public static function createSign(algorithm:String):Sign;
  public static function createVerify(algorithm:String):Verify;
  @:overload(function(prime_length:Int):DiffieHellman{})
  public static function createDiffieHellman(prime:Buffer):DiffieHellman;
  // public function createDiffieHellman(prime:, ?enc:String):DiffieHellman;
  public static function getDiffieHellman(group_name:String):DiffieHellman;
  public static function pbkdf2Sync(password:String, salt:String, iterations:Int, keylen:Int):String;
  public static function pbkdf2(password:String, salt:String, iterations:Int, keylen:Int, cb:Dynamic->String->Void):Void;

  public static function randomBytes(size:Int, ?cb:Dynamic->Buffer->Void):Buffer;
}

extern class DigestEncoding{
  public static inline var Hex = 'hex';
  public static inline var Binary = 'binary';
  public static inline var Base64 = 'base64';
}
extern class Hash{
  @:overload(function(data:String, encoding:String = 'utf8'):Void{})
  public function update(data:String, ?encoding:String):Hash;
  public function digest(encoding:String):String;
}

extern class Hmac{
  public function update(data:String):Void;
  public function digest(?encoding:String):String;
}


extern class Cipher{
  public function update(data:Buffer):Buffer;
  public function final():Buffer;
  public function setAutoPadding(?autoPadding:Bool):Void;

  // public function update(data, [input_encoding], [output_encoding])
  // public function final([output_enco3ding])
  // public function setAutoPadding(auto_padding=true)
}

extern class Decipher{
  public function update(data:Buffer):Buffer;
  public function final():Buffer;
  public function setAutoPadding(?autoPadding:Bool):Void;

  // public function update(data, [input_encoding], [output_encoding])
  // public function final([output_encoding])
  // public function setAutoPadding(auto_padding=true)
}

extern class Sign extends node.stream.WritableImpl{
  public function update(data:Buffer):Void;
  public function sign(private_key:String):Buffer;
  // public function sign(private_key:String, [output_format])
}

extern class Verify{
  public function update(data:Buffer):Void;
  public function verify(object:String, signature:Buffer):Bool;
  // public function verify(object:String, signature, [signature_format])
}

extern class DiffieHellman{
  public function generateKeys():Buffer;
  // public function generateKeys([encoding])
  public function computeSecret(other_public_key:Buffer):Buffer;
  // public function computeSecret(other_public_key, [input_encoding], [output_encoding])
  public function getPrime():Buffer;
  // public function getPrime([encoding])
  public function getGenerator():Buffer;
  // public function getGenerator([encoding])
  public function getPublicKey():Buffer;
  // public function getPublicKey([encoding])
  public function getPrivateKey():Buffer;
  // public function getPrivateKey([encoding])
  public function setPublicKey(public_key:Buffer):Void;
  // public function setPublicKey(public_key, [encoding]):Void;
  public function setPrivateKey(public_key:Buffer):Void;
  // public function setPrivateKey(public_key, [encoding]):Void;
}
