from glapp.PyOGLApp import *
from glapp.Utils import *
from glapp.Mesh import *


class MyFirstShaderToyPort(PyOGLApp):
    def __init__(self, fractal: object, res: object = (700, 700)) -> object:
        super().__init__(50, 50, res[0], res[1])
        self.screen_plane = None
        self.fractal = fractal

    def initialise(self):
        self.program_id = create_program(open("shaders/vert.vs").read(), open(self.fractal).read())
        self.screen_plane = Mesh(self.program_id)

    def display(self):
        glClear(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT)  # clear the screen
        glUseProgram(self.program_id)
        res_id = glGetUniformLocation(self.program_id, "iResolution")  # our resolution
        glUniform2f(res_id, self.screen_width, self.screen_height)
        self.screen_plane.draw()
