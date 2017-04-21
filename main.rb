require 'opengl'
require 'glu'
require 'glut'

include Gl
include Glu
include Glut

def disp
	glClearColor(0,0,0,0) 		# background Color
	glClear(GL_COLOR_BUFFER_BIT) # borramos la pantalla
	glMatrixMode(GL_PROJECTION) # Modo proyección
	glLoadIdentity
	glOrtho(-1.0, 1.0, -1.0, 1.0, -1.0, 1.0)

	glMatrixMode(GL_MODELVIEW)
	glBegin(GL_TRIANGLES)
		glColor3f(1,0,0)
		glVertex(0,0.8,0)
		glColor3f(0,1,0)
		glVertex(-0.6,-0.2,0)
		glColor3f(0,1,1)
		glVertex(0.6,-0.2,0)
	glEnd
	glFlush
	glutPostRedisplay
end

glutInit
glutInitDisplayMode(GLUT_SINGLE | GLUT_RGBA)
glutInitWindowSize(500, 500)
glutInitWindowPosition(20, 20)
glutCreateWindow("Hola OpenGL, en Ruby")
glutDisplayFunc :disp
glutMainLoop