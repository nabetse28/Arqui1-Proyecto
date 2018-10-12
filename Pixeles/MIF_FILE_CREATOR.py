from PIL import Image

##file = 'lenna.png'
##im = Image.open(file)
##
##pix = im.load()
##im_size = im.size

##print(im_size)

def hex_ext(num):
    res = ''
    if(num <=15):
        res += '0'
        res += str('{:x}'.format(num))
    else:
        res += str('{:x}'.format(num))

    return res
    

def archivo(archivo):
    file = archivo
    
    im = Image.open(file)

    pix = im.load()
    size_i = im.size[0]
    size_j = im.size[1]

    rgb=''
    cont = 0
    f = open('RAM.mif','w')
    f.write("DEPTH = 65536;"+"\n")
    f.write("WIDTH = 32;" + "\n")
    f.write("ADDRESS_RADIX = UNS;"+"\n")
    f.write("DATA_RADIX = HEX;"+"\n")
    f.write("CONTENT"+"\n")
    f.write("BEGIN"+"\n")
    
    
    for i in range(0,size_i):
        for j in range(0,size_j):
            
            
            r = hex_ext(int(pix[i,j][0]))
            g = hex_ext(int(pix[i,j][1]))
            b = hex_ext(int(pix[i,j][2]))

            rgb+= r + g + b

            f.write(str(cont) + " : " + rgb +";" + "\n")

            cont+=1
            rgb = ''

    f.write("[40000..65535]: 0;")
    f.close()





            

            






