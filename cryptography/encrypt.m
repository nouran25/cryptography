function Encrypted = encrypt(plaintext, key)
    text = upper(plaintext);
    plaintext = double(text) - 65;
    txt = plaintext;
    n = size(key, 1);

    if (rem(size(plaintext), n) == [1 0])
        Message = reshape(plaintext, n, length(plaintext) / n);
        Message = [Message]';
    else
        plaintext = [plaintext 25];
        Message = reshape(plaintext, n, length(plaintext) / n);
        Message = [Message]';
    end

    if det(key) ~= 0
        Encmessage = Message * key;
        Encmessage = mod(Encmessage, 26);
        Encmessage = [Encmessage]';
        encmatrix = reshape(Encmessage, 1, length(plaintext)) + 65;
        Encrypted = char(encmatrix);
    else
        error('The key matrix is not invertible');
    end
end
