require 'opengl'
require 'glu'
require 'glut'

include Gl
include Glu
include Glut

def disp
	glDepthFunc(GL_LEQUAL);
	glEnable(GL_DEPTH_TEST);
	glClearDepth(1.0)

	glClearColor(0,0,0,0) 		# background Color
	glClear(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT) # borramos la pantalla

	glMatrixMode(GL_PROJECTION) # Modo proyección
	#glOrtho(-1.0, 1.0, -1.0, 1.0, -1.0, 1.0)
	glLoadIdentity
	gluPerspective(60.0,1.0,1.0,100.0)

	glMatrixMode(GL_MODELVIEW)
	glTranslatef(0.0,0.0,-2.0)

	glBegin(GL_QUADS)
		glColor3f(1,0,1)
		glVertex(-0.5,0.5,-0.5)
		glVertex(-0.5,-0.5,0.5)
		glVertex(0.5,-0.5,0.5)
		glVertex(0.5,0.5,-0.5)
	glEnd

	glBegin(GL_TRIANGLES)
		glColor3f(1,0.5,1)
		glVertex(0,0.5,0)
		glVertex(-0.7,-0.5,0)	
		glVertex(0.7,-0.5,0)
	glEnd
	glFlush
	#glutPostRedisplay
end

glutInit
glutInitDisplayMode(GLUT_SINGLE | GLUT_RGBA | GLUT_DEPTH)
glutInitWindowSize(500, 500)
glutInitWindowPosition(20, 20)
glutCreateWindow("Hola OpenGL, en Ruby")
glutDisplayFunc :disp
glutMainLoop
