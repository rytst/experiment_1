def check(var, div):
    tmp = var + div
    print(bin(var) + ' + ' + bin(div) + ' = ', end='')
    print(bin(tmp))
    return (tmp - 2**11)

i = 1
tmp = 1235
while len(bin(tmp + 2003)) == (12 + 2):
    print(str(i) + '回目: ', end='')
    tmp = check(tmp, 2003)
    i = i + 1

print(str(i) + '回目: ', bin(tmp) + ' + ' + bin(2003) + ' = ' + bin(tmp+2003))
