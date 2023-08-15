function Decrypted = decrypt(Encrypted, key,plaintext)
    Encmessage = double(Encrypted) - 65;
    n = size(key,1);
    txt = plaintext;
    j = mod(det(key), 26);
    for b = 1:26
        d(b) = j * b;
        h(b) = rem(d(b), 26);
    end
    h = uint8(h);
    m = find(h == 1);
    if m ~= 0
        invk = m .* adjoint(key);
    else
        error('Enter Another Key');
    end
    Encmessage = reshape(Encmessage,n,length(Encmessage)/n);
    Encmessage = [Encmessage]';
    decmsg = Encmessage * invk;
    decmsg = mod(decmsg, 26);
    decmsg = [decmsg]';
    decmsg = reshape(decmsg, 1, length(Encrypted)) + 65;
    if rem(length(txt), n) == 0
        decmsg = uint8(decmsg);
        v = find(decmsg == 91);
        decmsg(v) = 65;
    else
        decmsg = decmsg(1:length(Encrypted) - 1);
        decmsg = uint8(decmsg);
        v = find(decmsg == 91);
        decmsg(v) = 65;
    end
    Decrypted = char(decmsg);
end