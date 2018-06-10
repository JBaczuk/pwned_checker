# pwned_checker
Check if your password has been leaked, and if so how many times (uses https://haveibeenpwned.com/Passwords API)

## Dependencies
- brew: https://brew.sh/
- libressl: `brew install libressl`

## Usage
```
$ chmod +x search_pwned_passwd.sh
$ ./search_pwned_passwd.sh
$ enter the password you want to search for:
$ P@ssw0rd
$ Warning: The number of times password "P@ssw0rd" has been hacked:
$ 47205
```

## Security
Note that obviously sending your password over the air to some API is not secure. The API, however, does not expect a password, rather the first 5 characters of the SHA1 hash of the password. Upon receipt, the API will respond with hundreds of partial hashes (35 characters only), but only one will have the same 35 characters of the last part of the SHA1 hash that match your hash.

Read more about this here: [Cloudflare, Privacy and k-Anonymity](https://www.troyhunt.com/ive-just-launched-pwned-passwords-version-2/#cloudflareprivacyandkanonymity)
