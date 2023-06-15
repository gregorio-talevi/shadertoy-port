import sys
from MyFirstShaderToyPort import MyFirstShaderToyPort


if __name__ == '__main__':
    if len(sys.argv) > 1:
        MyFirstShaderToyPort(sys.argv[1]).mainloop()
    else:
        MyFirstShaderToyPort("shaders/examples/turning_glow.vs", res=(800, 800)).mainloop()
