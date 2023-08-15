% Main script for encryption and decryption
% Get user inputs
plaintext = input('Enter the text: ', 's');
key = input('Enter the key matrix: ');
% Encrypt the message
Encrypted = encrypt(plaintext, key);
% Decrypt the message
Decrypted = decrypt(Encrypted, key,plaintext);
% Display the results
fprintf('Encryped text: %s\n', Encrypted);
fprintf('Decrypted text: %s\n', Decrypted);
